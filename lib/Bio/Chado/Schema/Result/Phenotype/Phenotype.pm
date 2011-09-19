package Bio::Chado::Schema::Result::Phenotype::Phenotype;
BEGIN {
  $Bio::Chado::Schema::Result::Phenotype::Phenotype::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Phenotype::Phenotype::VERSION = '0.08200';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("phenotype");


__PACKAGE__->add_columns(
  "phenotype_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "phenotype_phenotype_id_seq",
  },
  "uniquename",
  { data_type => "text", is_nullable => 0 },
  "observable_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "attr_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "value",
  { data_type => "text", is_nullable => 1 },
  "cvalue_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "assay_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("phenotype_id");
__PACKAGE__->add_unique_constraint("phenotype_c1", ["uniquename"]);


__PACKAGE__->has_many(
  "feature_phenotypes",
  "Bio::Chado::Schema::Result::Phenotype::FeaturePhenotype",
  { "foreign.phenotype_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_phenotypes",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentPhenotype",
  { "foreign.phenotype_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "assay",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "assay_id" },
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
  "attr",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "attr_id" },
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
  "observable",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "observable_id" },
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
  "cvalue",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "cvalue_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "phenotype_comparison_phenotype1s",
  "Bio::Chado::Schema::Result::Genetic::PhenotypeComparison",
  { "foreign.phenotype1_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_comparison_phenotype2s",
  "Bio::Chado::Schema::Result::Genetic::PhenotypeComparison",
  { "foreign.phenotype2_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_cvterms",
  "Bio::Chado::Schema::Result::Phenotype::PhenotypeCvterm",
  { "foreign.phenotype_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Result::Genetic::Phenstatement",
  { "foreign.phenotype_id" => "self.phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BQ6KZODWf4Lkio/RVuwL0Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Phenotype::Phenotype

=head1 DESCRIPTION

A phenotypic statement, or a single
atomic phenotypic observation, is a controlled sentence describing
observable effects of non-wild type function. E.g. Obs=eye, attribute=color, cvalue=red.

=head1 NAME

Bio::Chado::Schema::Result::Phenotype::Phenotype

=head1 ACCESSORS

=head2 phenotype_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'phenotype_phenotype_id_seq'

=head2 uniquename

  data_type: 'text'
  is_nullable: 0

=head2 observable_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

The entity: e.g. anatomy_part, biological_process.

=head2 attr_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

Phenotypic attribute (quality, property, attribute, character) - drawn from PATO.

=head2 value

  data_type: 'text'
  is_nullable: 1

Value of attribute - unconstrained free text. Used only if cvalue_id is not appropriate.

=head2 cvalue_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

Phenotype attribute value (state).

=head2 assay_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

Evidence type.

=head1 RELATIONS

=head2 feature_phenotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phenotype::FeaturePhenotype>

=head2 nd_experiment_phenotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentPhenotype>

=head2 assay

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 attr

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 observable

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 cvalue

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 phenotype_comparison_phenotype1s

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::PhenotypeComparison>

=head2 phenotype_comparison_phenotype2s

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::PhenotypeComparison>

=head2 phenotype_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phenotype::PhenotypeCvterm>

=head2 phenstatements

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Genetic::Phenstatement>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

