package Bio::Chado::Schema::Genetic::Genotype;
BEGIN {
  $Bio::Chado::Schema::Genetic::Genotype::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Genetic::Genotype::VERSION = '0.06300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("genotype");


__PACKAGE__->add_columns(
  "genotype_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "genotype_genotype_id_seq",
  },
  "name",
  { data_type => "text", is_nullable => 1 },
  "uniquename",
  { data_type => "text", is_nullable => 0 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);
__PACKAGE__->set_primary_key("genotype_id");
__PACKAGE__->add_unique_constraint("genotype_c1", ["uniquename"]);


__PACKAGE__->has_many(
  "feature_genotypes",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_genotypes",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phendescs",
  "Bio::Chado::Schema::Genetic::Phendesc",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_comparison_genotype1s",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.genotype1_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenotype_comparison_genotype2s",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.genotype2_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Genetic::Phenstatement",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_genotypes",
  "Bio::Chado::Schema::Stock::StockGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/TjrozFzjptRGcbXXJZI6Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Genetic::Genotype

=head1 DESCRIPTION

Genetic context. A genotype is defined by a collection of features, mutations, balancers, deficiencies, haplotype blocks, or engineered constructs.

=head1 NAME

Bio::Chado::Schema::Genetic::Genotype

=head1 ACCESSORS

=head2 genotype_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'genotype_genotype_id_seq'

=head2 name

  data_type: 'text'
  is_nullable: 1

Optional alternative name for a genotype,
for display purposes.

=head2 uniquename

  data_type: 'text'
  is_nullable: 0

The unique name for a genotype;
typically derived from the features making up the genotype.

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 RELATIONS

=head2 feature_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::FeatureGenotype>

=head2 nd_experiment_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype>

=head2 phendescs

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::Phendesc>

=head2 phenotype_comparison_genotype1s

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::PhenotypeComparison>

=head2 phenotype_comparison_genotype2s

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::PhenotypeComparison>

=head2 phenstatements

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::Phenstatement>

=head2 stock_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockGenotype>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

