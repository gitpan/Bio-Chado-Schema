package Bio::Chado::Schema::Result::Sequence::Feature;
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::Feature::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::Feature::VERSION = '0.08000'; # TRIAL
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("feature");


__PACKAGE__->add_columns(
  "feature_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "feature_feature_id_seq",
  },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "organism_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "uniquename",
  { data_type => "text", is_nullable => 0 },
  "residues",
  { data_type => "text", is_nullable => 1 },
  "seqlen",
  { data_type => "integer", is_nullable => 1 },
  "md5checksum",
  { data_type => "char", is_nullable => 1, size => 32 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "is_analysis",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "is_obsolete",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "timeaccessioned",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "timelastmodified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);
__PACKAGE__->set_primary_key("feature_id");
__PACKAGE__->add_unique_constraint("feature_c1", ["organism_id", "uniquename", "type_id"]);


__PACKAGE__->has_many(
  "analysisfeatures",
  "Bio::Chado::Schema::Result::Companalysis::Analysisfeature",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_features",
  "Bio::Chado::Schema::Result::CellLine::CellLineFeature",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Result::Mage::Element",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
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
  "dbxref",
  "Bio::Chado::Schema::Result::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Result::Organism::Organism",
  { organism_id => "organism_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "feature_cvterms",
  "Bio::Chado::Schema::Result::Sequence::FeatureCvterm",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_dbxrefs",
  "Bio::Chado::Schema::Result::Sequence::FeatureDbxref",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_expressions",
  "Bio::Chado::Schema::Result::Expression::FeatureExpression",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_genotype_features",
  "Bio::Chado::Schema::Result::Genetic::FeatureGenotype",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_genotype_chromosomes",
  "Bio::Chado::Schema::Result::Genetic::FeatureGenotype",
  { "foreign.chromosome_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featureloc_features",
  "Bio::Chado::Schema::Result::Sequence::Featureloc",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featureloc_srcfeatures",
  "Bio::Chado::Schema::Result::Sequence::Featureloc",
  { "foreign.srcfeature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_phenotypes",
  "Bio::Chado::Schema::Result::Phenotype::FeaturePhenotype",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featurepos_feature",
  "Bio::Chado::Schema::Result::Map::Featurepos",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featurepos_map_features",
  "Bio::Chado::Schema::Result::Map::Featurepos",
  { "foreign.map_feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featureprops",
  "Bio::Chado::Schema::Result::Sequence::Featureprop",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_pubs",
  "Bio::Chado::Schema::Result::Sequence::FeaturePub",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featurerange_leftendfs",
  "Bio::Chado::Schema::Result::Map::Featurerange",
  { "foreign.leftendf_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featurerange_rightstartfs",
  "Bio::Chado::Schema::Result::Map::Featurerange",
  { "foreign.rightstartf_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featurerange_rightendfs",
  "Bio::Chado::Schema::Result::Map::Featurerange",
  { "foreign.rightendf_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featurerange_leftstartfs",
  "Bio::Chado::Schema::Result::Map::Featurerange",
  { "foreign.leftstartf_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "featurerange_features",
  "Bio::Chado::Schema::Result::Map::Featurerange",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_relationship_subjects",
  "Bio::Chado::Schema::Result::Sequence::FeatureRelationship",
  { "foreign.subject_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_relationship_objects",
  "Bio::Chado::Schema::Result::Sequence::FeatureRelationship",
  { "foreign.object_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_synonyms",
  "Bio::Chado::Schema::Result::Sequence::FeatureSynonym",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "library_features",
  "Bio::Chado::Schema::Result::Library::LibraryFeature",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phylonodes",
  "Bio::Chado::Schema::Result::Phylogeny::Phylonode",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "studyprop_features",
  "Bio::Chado::Schema::Result::Mage::StudypropFeature",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1rnPsx4awJbpI2wm1doDlA

use Carp;


{ no warnings 'once';
  *parent_relationships  = \&feature_relationship_objects;
}


{ no warnings 'once';
  *child_relationships  = \&feature_relationship_subjects;
}



__PACKAGE__->belongs_to
    ( 'primary_dbxref',
      'Bio::Chado::Schema::Result::General::Dbxref',
      { 'foreign.dbxref_id' => 'self.dbxref_id' },
    );


__PACKAGE__->many_to_many
    (
     'parent_features',
     'feature_relationship_subjects' => 'object',
    );



__PACKAGE__->many_to_many
    (
     'child_features',
     'feature_relationship_objects' => 'subject',
    );


__PACKAGE__->many_to_many
    (
     'dbxrefs_mm',
     'feature_dbxrefs' => 'dbxref',
    );


__PACKAGE__->many_to_many
    (
     'secondary_dbxrefs',
     'feature_dbxrefs' => 'dbxref',
    );



sub create_featureprops {
    my ($self, $props, $opts) = @_;

    # process opts
    $opts->{cv_name} = 'feature_property'
        unless defined $opts->{cv_name};
    return Bio::Chado::Schema::Util->create_properties
        ( properties => $props,
          options    => $opts,
          row        => $self,
          prop_relation_name => 'featureprops',
        );
}


sub search_featureprops {
    my ( $self, $cvt_criteria ) = @_;

    $cvt_criteria = { name => $cvt_criteria }
        unless ref $cvt_criteria;

     $self->result_source->schema
          ->resultset('Cv::Cvterm')
          ->search( $cvt_criteria )
          ->search_related('featureprops',
                           { feature_id => $self->feature_id },
                          );
}



use base qw/ Bio::PrimarySeq /;


{ no warnings 'once';
  *display_id  = \&name;
  *id          = \&name;
  *primary_id  = \&name;
}


{ no warnings 'once';
  *seq  = \&residues;
}


sub subseq {
    my $self = shift;

    # use the normal subseq if normal residues
    if( $self->residues ) {
        local $self->{seq} = $self->residues; #< stupid hack for Bio::PrimarySeq's subseq to work
        return $self->SUPER::subseq( @_ );
    }

    my ( $start, $end ) = @_;
    croak "must provide start, end to subseq" unless $start;
    croak "subseq() on large_residues only supports ( $start, $end ) calling style"
        if ref $start || !$end;

    my $length = $end - $start + 1;
    return '' unless $length > 0;

    return
        $self->result_source
             ->schema
             ->resultset('Cv::Cvterm')
             ->search({ name => 'large_residues' })
             ->search_related( 'featureprops', { feature_id => $self->feature_id } )
             ->search(
                 undef,
                 { select => { substr => [ 'featureprops.value', $start, $length ] },
                   as  => 'mysubstring',
                 }
                )
             ->get_column('mysubstring')
             ->single;
}


sub trunc {
    my $self = shift;

    return Bio::PrimarySeq->new(
        -id  => $self->name,
        -seq => $self->subseq( @_ ),
       );
}




sub accession_number {
    my $self= shift;

    my $pd = $self->primary_dbxref
        || $self->secondary_dbxrefs->first
      or return;

    my $acc = $pd->accession;
    my $v = $pd->version;
    $v = $v ? ".$v" : '';

    return $acc.$v;
}

{ no warnings 'once';
  *accession = \&accession_number;
}



sub length {
    my $self = shift;
    my $l = $self->seqlen;
    return $l if defined $l;
    return CORE::length( $self->residues );
}


{ no warnings 'once';
  *description = \&desc;
}
sub desc {
    my $self = shift;
    my $desc_fp =
        $self->search_featureprops( 'description')
             ->first;
    return unless $desc_fp;
    return $desc_fp->value;
}


sub alphabet {
    shift()->throw_not_implemented()
}

# signal to BioPerl that this sequence can't be cloned
sub can_call_new { 0 }

1;


__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Sequence::Feature

=head1 DESCRIPTION

A feature is a biological sequence or a
section of a biological sequence, or a collection of such
sections. Examples include genes, exons, transcripts, regulatory
regions, polypeptides, protein domains, chromosome sequences, sequence
variations, cross-genome match regions such as hits and HSPs and so
on; see the Sequence Ontology for more. The combination of
organism_id, uniquename and type_id should be unique.

=head1 NAME

Bio::Chado::Schema::Result::Sequence::Feature

=head1 ACCESSORS

=head2 feature_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'feature_feature_id_seq'

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

An optional primary public stable
identifier for this feature. Secondary identifiers and external
dbxrefs go in the table feature_dbxref.

=head2 organism_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

The organism to which this feature
belongs. This column is mandatory.

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

The optional human-readable common name for
a feature, for display purposes.

=head2 uniquename

  data_type: 'text'
  is_nullable: 0

The unique name for a feature; may
not be necessarily be particularly human-readable, although this is
preferred. This name must be unique for this type of feature within
this organism.

=head2 residues

  data_type: 'text'
  is_nullable: 1

A sequence of alphabetic characters
representing biological residues (nucleic acids, amino acids). This
column does not need to be manifested for all features; it is optional
for features such as exons where the residues can be derived from the
featureloc. It is recommended that the value for this column be
manifested for features which may may non-contiguous sublocations (e.g.
transcripts), since derivation at query time is non-trivial. For
expressed sequence, the DNA sequence should be used rather than the
RNA sequence. The default storage method for the residues column is
EXTERNAL, which will store it uncompressed to make substring operations
faster.

=head2 seqlen

  data_type: 'integer'
  is_nullable: 1

The length of the residue feature. See
column:residues. This column is partially redundant with the residues
column, and also with featureloc. This column is required because the
location may be unknown and the residue sequence may not be
manifested, yet it may be desirable to store and query the length of
the feature. The seqlen should always be manifested where the length
of the sequence is known.

=head2 md5checksum

  data_type: 'char'
  is_nullable: 1
  size: 32

The 32-character checksum of the sequence,
calculated using the MD5 algorithm. This is practically guaranteed to
be unique for any feature. This column thus acts as a unique
identifier on the mathematical sequence.

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

A required reference to a table:cvterm
giving the feature type. This will typically be a Sequence Ontology
identifier. This column is thus used to subclass the feature table.

=head2 is_analysis

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

Boolean indicating whether this
feature is annotated or the result of an automated analysis. Analysis
results also use the companalysis module. Note that the dividing line
between analysis and annotation may be fuzzy, this should be determined on
a per-project basis in a consistent manner. One requirement is that
there should only be one non-analysis version of each wild-type gene
feature in a genome, whereas the same gene feature can be predicted
multiple times in different analyses.

=head2 is_obsolete

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

Boolean indicating whether this
feature has been obsoleted. Some chado instances may choose to simply
remove the feature altogether, others may choose to keep an obsolete
row in the table.

=head2 timeaccessioned

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

For handling object
accession or modification timestamps (as opposed to database auditing data,
handled elsewhere). The expectation is that these fields would be
available to software interacting with chado.

=head2 timelastmodified

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

For handling object
accession or modification timestamps (as opposed to database auditing data,
handled elsewhere). The expectation is that these fields would be
available to software interacting with chado.

=head1 RELATIONS

=head2 analysisfeatures

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Companalysis::Analysisfeature>

=head2 cell_line_features

Type: has_many

Related object: L<Bio::Chado::Schema::Result::CellLine::CellLineFeature>

=head2 elements

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Element>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::General::Dbxref>

=head2 organism

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Organism::Organism>

=head2 feature_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureCvterm>

=head2 feature_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureDbxref>

=head2 feature_expressions

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Expression::FeatureExpression>

=head2 feature_genotype_features

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::FeatureGenotype>

=head2 feature_genotype_chromosomes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::FeatureGenotype>

=head2 featureloc_features

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::Featureloc>

=head2 featureloc_srcfeatures

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::Featureloc>

=head2 feature_phenotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phenotype::FeaturePhenotype>

=head2 featurepos_feature

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Map::Featurepos>

=head2 featurepos_map_features

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Map::Featurepos>

=head2 featureprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::Featureprop>

=head2 feature_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeaturePub>

=head2 featurerange_leftendfs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Map::Featurerange>

=head2 featurerange_rightstartfs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Map::Featurerange>

=head2 featurerange_rightendfs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Map::Featurerange>

=head2 featurerange_leftstartfs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Map::Featurerange>

=head2 featurerange_features

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Map::Featurerange>

=head2 feature_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureRelationship>

=head2 feature_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureRelationship>

=head2 feature_synonyms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureSynonym>

=head2 library_features

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Library::LibraryFeature>

=head2 phylonodes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phylogeny::Phylonode>

=head2 studyprop_features

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::StudypropFeature>

=head1 ADDITIONAL RELATIONSHIPS

=head2 parent_relationships

Type: has_to_many

Returns a list of parent relationships.

Related object: Bio::Chado::Schema::Result::Sequence::FeatureRelationship

=head2 child_relationships

Type: has_to_many

Returns a list of child relationships.

Related object: Bio::Chado::Schema::Result::Sequence::FeatureRelationship

=head2 primary_dbxref

Alias for dbxref

=head1 MANY-TO-MANY RELATIONSHIPS

=head2 parent_features

Type: many_to_many

Returns a list of parent features.

Related object: Bio::Chado::Schema::Result::Sequence::Feature

=head2 child_features

Type: many_to_many

Returns a list of child features.

Related object: Bio::Chado::Schema::Result::Sequence::Feature

=head2 dbxrefs_mm

Type: many_to_many

Related object: L<Bio::Chado::Schema::Result::General::Dbxref> (i.e. dbxref
table) L<Bio::Chado::Schema::Result::Sequence::FeatureDbxref> (feature_dbxref
table)

=head2 secondary_dbxrefs

Alias for dbxrefs_mm

=head1 ADDITIONAL METHODS

=head2 create_featureprops

  Usage: $set->create_featureprops({ baz => 2, foo => 'bar' });
  Desc : convenience method to create feature properties using cvterms
          from the ontology with the given name
  Args : hashref of { propname => value, ...},
         options hashref as:
          {
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given featureprop name.  Default false.

            cv_name => cv.name to use for the given featureprops.
                       Defaults to 'feature_property',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            dbxref_accession_prefix => optional, default
                                       'autocreated:',
            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms

             allow_duplicate_values => default false.
                If true, allow duplicate instances of the same cvterm
                and value in the properties of the feature.  Duplicate
                values will have different ranks.
          }
  Ret  : hashref of { propname => new featureprop object }

=head2 search_featureprops

  Status  : public
  Usage   : $feat->search_featureprops( 'description' )
            # OR
            $feat->search_featureprops({ name => 'description'})
  Returns : DBIx::Class::ResultSet like other search() methods
  Args    : single string to match cvterm name,
            or hashref of search criteria.  This is passed
            to $chado->resultset('Cv::Cvterm')
                     ->search({ your criteria })

  Convenience method to search featureprops for a feature that
  match to Cvterms having the given criterion hash

=head1 L<Bio::PrimarySeqI> METHODS

The methods below are intended to provide some compatibility with
BioPerl's L<Bio::PrimarySeqI> interface, so that a feature may be used
as a sequence.  Note that L<Bio::PrimarySeqI> only provides
identifier, accession, and sequence information, no subfeatures,
ranges, or the like.

Support for BioPerl's more complete L<Bio::SeqI> interface, which
includes those things, still needs to be implemented.  If you are
interested in helping with this, please contact GMOD!

=head2 id, primary_id, display_id

These are aliases for name(), which just returns the contents of the
feature.name field

=head2 seq

  Alias for $feature->residues()

=head2 subseq( $start, $end )

Same as Bio::PrimarySeq subseq method, with one important exception.
If the residues column is not set (null) for this feature, it checks
for a featureprop of type C<large_residues> (irrespective of the
type's CV membership), and uses its value as the sequence if
it is present.

So, you can store large (i.e. megabase or greater) sequences in a
C<large_residues> featureprop, and use this C<subseq()> method to
fetch pieces of them, with the sequences never being entirely stored
in memory or transferred in total from the database server to the app
server.  This is implemented behind the scenes by using SQL substring
operations on the featureprop's value.

=head2 trunc

Same as subseq above, but return a sequence object rather than a bare string.

=head2 accession, accession_number

  Usage: say $feature->accession_number
  Desc : get an "<accession>.<version>"-style string.  gets this from
         either the primary dbxref, or the first secondary_dbxref
         found
  Args : none
  Ret : string of the form "accession.version" formed from the
        accession and version fields of either the primary or
        secondary dbxrefs

=head2 length

No arguments, returns the seqlen(), or length( $feature->residues ) if
that is not defined.

=head2 desc, description

No arguments, returns the value of the first 'description' featureprop
found for this feature.

=head2 alphabet

Not implemented. Throws an error if used.

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

