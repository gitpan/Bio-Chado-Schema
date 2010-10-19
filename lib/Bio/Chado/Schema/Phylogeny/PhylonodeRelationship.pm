package Bio::Chado::Schema::Phylogeny::PhylonodeRelationship;
BEGIN {
  $Bio::Chado::Schema::Phylogeny::PhylonodeRelationship::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Phylogeny::PhylonodeRelationship::VERSION = '0.06300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("phylonode_relationship");


__PACKAGE__->add_columns(
  "phylonode_relationship_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "phylonode_relationship_phylonode_relationship_id_seq",
  },
  "subject_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "object_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "rank",
  { data_type => "integer", is_nullable => 1 },
  "phylotree_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("phylonode_relationship_id");
__PACKAGE__->add_unique_constraint(
  "phylonode_relationship_subject_id_key",
  ["subject_id", "object_id", "type_id"],
);


__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "phylotree",
  "Bio::Chado::Schema::Phylogeny::Phylotree",
  { phylotree_id => "phylotree_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "object_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "subject_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CWG5Utnjcu3h7gz6ROoTug


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Phylogeny::PhylonodeRelationship

=head1 DESCRIPTION

This is for
relationships that are not strictly hierarchical; for example,
horizontal gene transfer. Most phylogenetic trees are strictly
hierarchical, nevertheless it is here for completeness.

=head1 NAME

Bio::Chado::Schema::Phylogeny::PhylonodeRelationship

=head1 ACCESSORS

=head2 phylonode_relationship_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'phylonode_relationship_phylonode_relationship_id_seq'

=head2 subject_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 object_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  is_nullable: 1

=head2 phylotree_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 phylotree

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylotree>

=head2 object

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylonode>

=head2 subject

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylonode>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

