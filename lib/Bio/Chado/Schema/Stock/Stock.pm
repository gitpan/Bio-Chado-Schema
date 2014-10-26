package Bio::Chado::Schema::Stock::Stock;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Stock::Stock

=head1 DESCRIPTION

Any stock can be globally identified by the
combination of organism, uniquename and stock type. A stock is the physical entities, either living or preserved, held by collections. Stocks belong to a collection; they have IDs, type, organism, description and may have a genotype.

=cut

__PACKAGE__->table("stock");

=head1 ACCESSORS

=head2 stock_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stock_stock_id_seq'

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

The dbxref_id is an optional primary stable identifier for this stock. Secondary indentifiers and external dbxrefs go in table: stock_dbxref.

=head2 organism_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

The organism_id is the organism to which the stock belongs. This column should only be left blank if the organism cannot be determined.

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

The name is a human-readable local name for a stock.

=head2 uniquename

  data_type: 'text'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

The description is the genetic description provided in the stock list.

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

The type_id foreign key links to a controlled vocabulary of stock types. The would include living stock, genomic DNA, preserved specimen. Secondary cvterms for stocks would go in stock_cvterm.

=head2 is_obsolete

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "stock_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stock_stock_id_seq",
  },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "organism_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "uniquename",
  { data_type => "text", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "is_obsolete",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("stock_id");
__PACKAGE__->add_unique_constraint("stock_c1", ["organism_id", "uniquename", "type_id"]);

=head1 RELATIONS

=head2 nd_experiment_stocks

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentStock>

=cut

__PACKAGE__->has_many(
  "nd_experiment_stocks",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentStock",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
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

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

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

=head2 organism

Type: belongs_to

Related object: L<Bio::Chado::Schema::Organism::Organism>

=cut

__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);

=head2 stockcollection_stocks

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockcollectionStock>

=cut

__PACKAGE__->has_many(
  "stockcollection_stocks",
  "Bio::Chado::Schema::Stock::StockcollectionStock",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockCvterm>

=cut

__PACKAGE__->has_many(
  "stock_cvterms",
  "Bio::Chado::Schema::Stock::StockCvterm",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockDbxref>

=cut

__PACKAGE__->has_many(
  "stock_dbxrefs",
  "Bio::Chado::Schema::Stock::StockDbxref",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockGenotype>

=cut

__PACKAGE__->has_many(
  "stock_genotypes",
  "Bio::Chado::Schema::Stock::StockGenotype",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stockprops

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::Stockprop>

=cut

__PACKAGE__->has_many(
  "stockprops",
  "Bio::Chado::Schema::Stock::Stockprop",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockPub>

=cut

__PACKAGE__->has_many(
  "stock_pubs",
  "Bio::Chado::Schema::Stock::StockPub",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockRelationship>

=cut

__PACKAGE__->has_many(
  "stock_relationship_subjects",
  "Bio::Chado::Schema::Stock::StockRelationship",
  { "foreign.subject_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockRelationship>

=cut

__PACKAGE__->has_many(
  "stock_relationship_objects",
  "Bio::Chado::Schema::Stock::StockRelationship",
  { "foreign.object_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:P/R2qsizqCc4FlZ6sk6+0g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
