package Bio::Chado::Schema::Result::Stock::Stock;
BEGIN {
  $Bio::Chado::Schema::Result::Stock::Stock::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Stock::Stock::VERSION = '0.08002';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("stock");


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


__PACKAGE__->has_many(
  "nd_experiment_stocks",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentStock",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
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
  "organism",
  "Bio::Chado::Schema::Result::Organism::Organism",
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


__PACKAGE__->has_many(
  "stockcollection_stocks",
  "Bio::Chado::Schema::Result::Stock::StockcollectionStock",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_cvterms",
  "Bio::Chado::Schema::Result::Stock::StockCvterm",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_dbxrefs",
  "Bio::Chado::Schema::Result::Stock::StockDbxref",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_genotypes",
  "Bio::Chado::Schema::Result::Stock::StockGenotype",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stockprops",
  "Bio::Chado::Schema::Result::Stock::Stockprop",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_pubs",
  "Bio::Chado::Schema::Result::Stock::StockPub",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_relationship_subjects",
  "Bio::Chado::Schema::Result::Stock::StockRelationship",
  { "foreign.subject_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_relationship_objects",
  "Bio::Chado::Schema::Result::Stock::StockRelationship",
  { "foreign.object_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:P/R2qsizqCc4FlZ6sk6+0g



sub create_stockprops {
    my ($self, $props, $opts) = @_;

    # process opts
    $opts->{cv_name} = 'stock_property'
        unless defined $opts->{cv_name};
    return Bio::Chado::Schema::Util->create_properties
        ( properties => $props,
          options    => $opts,
          row        => $self,
          prop_relation_name => 'stockprops',
        );
}


# You can replace this text with custom content, and it will be preserved on regeneration
1;


__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Stock::Stock

=head1 DESCRIPTION

Any stock can be globally identified by the
combination of organism, uniquename and stock type. A stock is the physical entities, either living or preserved, held by collections. Stocks belong to a collection; they have IDs, type, organism, description and may have a genotype.

=head1 NAME

Bio::Chado::Schema::Result::Stock::Stock

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

=head1 RELATIONS

=head2 nd_experiment_stocks

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentStock>

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::General::Dbxref>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 organism

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Organism::Organism>

=head2 stockcollection_stocks

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockcollectionStock>

=head2 stock_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockCvterm>

=head2 stock_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockDbxref>

=head2 stock_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockGenotype>

=head2 stockprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::Stockprop>

=head2 stock_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockPub>

=head2 stock_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockRelationship>

=head2 stock_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::StockRelationship>

=head2 create_stockprops

  Usage: $set->create_stockprops({ baz => 2, foo => 'bar' });
  Desc : convenience method to create stock properties using cvterms
          from the ontology with the given name
  Args : hashref of { propname => value, ...},
         options hashref as:
          {
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given stockprop name.  Default false.

            cv_name => cv.name to use for the given stockprops.
                       Defaults to 'stock_property',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            dbxref_accession_prefix => optional, default
                                       'autocreated:',
            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms

             rank => force numeric rank. Be careful not to pass ranks that already exist
                     for the property type. The function will die in such case.

             allow_duplicate_values => default false.
                If true, allow duplicate instances of the same stock
                and value in the properties of the stock.  Duplicate
                values will have different ranks.
          }
  Ret  : hashref of { propname => new stockprop object }

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

