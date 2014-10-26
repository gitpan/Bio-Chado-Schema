package Bio::Chado::Schema::Genetic::Genotype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Genetic::Genotype

=head1 DESCRIPTION

Genetic context. A genotype is defined by a collection of features, mutations, balancers, deficiencies, haplotype blocks, or engineered constructs.

=cut

__PACKAGE__->table("genotype");

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

  data_type: 'character varying'
  is_nullable: 1
  size: 255

=cut

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
  { data_type => "character varying", is_nullable => 1, size => 255 },
);
__PACKAGE__->set_primary_key("genotype_id");
__PACKAGE__->add_unique_constraint("genotype_c1", ["uniquename"]);

=head1 RELATIONS

=head2 feature_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::FeatureGenotype>

=cut

__PACKAGE__->has_many(
  "feature_genotypes",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phendescs

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::Phendesc>

=cut

__PACKAGE__->has_many(
  "phendescs",
  "Bio::Chado::Schema::Genetic::Phendesc",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenotype_comparison_genotype1s

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::PhenotypeComparison>

=cut

__PACKAGE__->has_many(
  "phenotype_comparison_genotype1s",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.genotype1_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenotype_comparison_genotype2s

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::PhenotypeComparison>

=cut

__PACKAGE__->has_many(
  "phenotype_comparison_genotype2s",
  "Bio::Chado::Schema::Genetic::PhenotypeComparison",
  { "foreign.genotype2_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phenstatements

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::Phenstatement>

=cut

__PACKAGE__->has_many(
  "phenstatements",
  "Bio::Chado::Schema::Genetic::Phenstatement",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockGenotype>

=cut

__PACKAGE__->has_many(
  "stock_genotypes",
  "Bio::Chado::Schema::Stock::StockGenotype",
  { "foreign.genotype_id" => "self.genotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2B9lshLGzHWyBgbCAsBTfQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
