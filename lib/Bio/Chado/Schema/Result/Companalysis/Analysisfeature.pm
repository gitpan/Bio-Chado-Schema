package Bio::Chado::Schema::Result::Companalysis::Analysisfeature;
BEGIN {
  $Bio::Chado::Schema::Result::Companalysis::Analysisfeature::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Companalysis::Analysisfeature::VERSION = '0.08200';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("analysisfeature");


__PACKAGE__->add_columns(
  "analysisfeature_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "analysisfeature_analysisfeature_id_seq",
  },
  "feature_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "analysis_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "rawscore",
  { data_type => "double precision", is_nullable => 1 },
  "normscore",
  { data_type => "double precision", is_nullable => 1 },
  "significance",
  { data_type => "double precision", is_nullable => 1 },
  "identity",
  { data_type => "double precision", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("analysisfeature_id");
__PACKAGE__->add_unique_constraint("analysisfeature_c1", ["feature_id", "analysis_id"]);


__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Result::Sequence::Feature",
  { feature_id => "feature_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "analysis",
  "Bio::Chado::Schema::Result::Companalysis::Analysis",
  { analysis_id => "analysis_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "analysisfeatureprops",
  "Bio::Chado::Schema::Result::Companalysis::Analysisfeatureprop",
  { "foreign.analysisfeature_id" => "self.analysisfeature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7SsoB6zDC9mxvavrk0DtTA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Companalysis::Analysisfeature

=head1 DESCRIPTION

Computational analyses generate features (e.g. Genscan generates transcripts and exons; sim4 alignments generate similarity/match features). analysisfeatures are stored using the feature table from the sequence module. The analysisfeature table is used to decorate these features, with analysis specific attributes. A feature is an analysisfeature if and only if there is a corresponding entry in the analysisfeature table. analysisfeatures will have two or more featureloc entries,
 with rank indicating query/subject

=head1 NAME

Bio::Chado::Schema::Result::Companalysis::Analysisfeature

=head1 ACCESSORS

=head2 analysisfeature_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'analysisfeature_analysisfeature_id_seq'

=head2 feature_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 analysis_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 rawscore

  data_type: 'double precision'
  is_nullable: 1

This is the native score generated by the program; for example, the bitscore generated by blast, sim4 or genscan scores. One should not assume that high is necessarily better than low.

=head2 normscore

  data_type: 'double precision'
  is_nullable: 1

This is the rawscore but
    semi-normalized. Complete normalization to allow comparison of
    features generated by different programs would be nice but too
    difficult. Instead the normalization should strive to enforce the
    following semantics: * normscores are floating point numbers >= 0,
    * high normscores are better than low one. For most programs, it would be sufficient to make the normscore the same as this rawscore, providing these semantics are satisfied.

=head2 significance

  data_type: 'double precision'
  is_nullable: 1

This is some kind of expectation or probability metric, representing the probability that the analysis would appear randomly given the model. As such, any program or person querying this table can assume the following semantics:
   * 0 <= significance <= n, where n is a positive number, theoretically unbounded but unlikely to be more than 10
  * low numbers are better than high numbers.

=head2 identity

  data_type: 'double precision'
  is_nullable: 1

Percent identity between the locations compared.  Note that these 4 metrics do not cover the full range of scores possible; it would be undesirable to list every score possible, as this should be kept extensible. instead, for non-standard scores, use the analysisprop table.

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Sequence::Feature>

=head2 analysis

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Companalysis::Analysis>

=head2 analysisfeatureprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Companalysis::Analysisfeatureprop>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

