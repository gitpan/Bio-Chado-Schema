#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
use lib "$FindBin::RealBin/../lib";

use Test::More tests => 23;
use Test::Exception;
use Bio::Chado::Schema;

my $schema = Bio::Chado::Schema::Test->init_schema();

my $sf = $schema->resultset('Sequence::Feature');
isa_ok( $sf, 'DBIx::Class::ResultSet' );

$schema->txn_do(sub{
    # try a joined query through one of the longer has_many rels
    lives_ok {
        $sf->search_related('feature_relationship_objects')->count;
    } 'join through a long has_many name does not die';
    $schema->txn_rollback;
});

$schema->txn_do(sub{
    my $dbx = $schema->resultset('General::Db')
                ->find_or_create({ name => 'test db' })
                ->find_or_create_related('dbxrefs',
                            { accession => 'made_up',
                            },
                            );

    # insert a feature with some sequence
    my $cvterm = $schema->resultset('Cv::Cv')
                ->find_or_create({ name => 'testing cv' })
                ->find_or_create_related('cvterms',
                                { name => 'tester',
                                dbxref => $dbx,
                                },
                            );

    my $test_seq = 'ACTAGCATCATGCCGCTAGCTAATATGCTG';
    my $grandpa = $schema->resultset('Sequence::Feature')
            ->find_or_create({
                    residues   => $test_seq,
                    seqlen     => length( $test_seq ),
                    name       => 'BCS_grandpa',
                    uniquename => 'BCS_pappy',
                    type       => $cvterm,
                    organism_id=> 4,
            });
    my $parent = $schema->resultset('Sequence::Feature')
            ->find_or_create({
                    residues   => $test_seq,
                    seqlen     => length( $test_seq ),
                    name       => 'BCS_stuff_parent',
                    uniquename => 'BCS_foo',
                    type       => $cvterm,
                    organism_id=> 4,
            });
    my $child = $schema->resultset('Sequence::Feature')
            ->find_or_create({
                    residues   => $test_seq,
                    seqlen     => length( $test_seq ),
                    name       => 'BCS_stuff_child',
                    uniquename => 'BCS_foo2',
                    type       => $cvterm,
                    organism_id=> 4,
            });
    my $stepchild = $schema->resultset('Sequence::Feature')
            ->find_or_create({
                    residues   => $test_seq,
                    seqlen     => length( $test_seq ),
                    name       => 'BCS_stepchild',
                    uniquename => 'BCS_step',
                    type       => $cvterm,
                    organism_id=> 4,
            });

    lives_ok(sub {
        $parent->add_to_child_features( $stepchild, { type => $stepchild->type })
    }, 'add_to_child_features');

    lives_ok(sub {
        $parent->add_to_parent_features( $grandpa, { type => $grandpa->type })
    }, 'add_to_parent_features');

    $parent->create_related( 'feature_relationship_subjects', {
            object_id  => $parent->feature_id,
            subject_id => $child->feature_id,
            type       => $parent->type,
    });

    $schema->resultset('Organism::Organism')
            ->find_or_create({ genus => 'test', species => 'testus' })
            ->create_related( 'features', {
                    residues   => $test_seq,
                    seqlen     => length( $test_seq ),
                    name       => 'BCS_test_seq_deleteme',
                    uniquename => 'BCS_test_seq_deleteme',
                    type       => $cvterm,
                    });

    # find a feature with some sequence. might be the one we just
    # inserted.
    my $feature = $sf->search({
                        'residues' => {'!=', undef},
                        'seqlen'   => {'!=', undef},
                        'name'     => {'!=', 'BSC_stuff'},
                    }, { 'rows' => 1 })->single;


    # test some Bio::SeqI methods for it
    for (
        [qw[ length      seqlen    ]],
        [qw[ id          name      ]],
        [qw[ primary_id  name      ]],
        [qw[ residues    seq       ]],
        ) {
        my ($m1,$m2) = @$_;
        is( $feature->$m1, $feature->$m2,
        "$m1() returns same thing as $m2()" );
    }
    can_ok($feature,'child_features');
    can_ok($feature,'parent_features');

    can_ok($feature,'child_relationships');
    can_ok($feature,'parent_relationships');

    my (@children_rels) = $parent->child_relationships;
    my (@parents_rels)  = $parent->parent_relationships;
    isa_ok($children_rels[0], 'Bio::Chado::Schema::Sequence::FeatureRelationship');
    isa_ok($parents_rels[0],  'Bio::Chado::Schema::Sequence::FeatureRelationship');

    isnt($parent->feature_id, $child->feature_id, 'child and parent are different');
    my (@children) = $parent->child_features;
    my (@parents)  = $child->parent_features;

    is(scalar @children, 2, "the parent feature has two child features");
    is(scalar @parents, 1, "the child feature has one parent feature");

    my (@grandparents) = $parent->parent_features;
    my (@grandkids) = $child->child_features;
    is(scalar @grandparents, 1, "the parent feature has one parent feature");
    is(scalar @grandkids, 0, "the child feature has no child feature");

    isa_ok($children[0], 'Bio::Chado::Schema::Sequence::Feature');
    isa_ok($parents[0], 'Bio::Chado::Schema::Sequence::Feature');

    is_deeply( [ map { $_->name } @children ], [ 'BCS_stepchild', 'BCS_stuff_child' ], 'child feature_id is correct' );
    is_deeply( [ map { $_->name } @parents ], [ 'BCS_stuff_parent' ], 'parent feature_id is correct' );

    $schema->txn_rollback;
});
