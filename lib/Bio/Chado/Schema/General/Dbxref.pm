package Bio::Chado::Schema::General::Dbxref;
BEGIN {
  $Bio::Chado::Schema::General::Dbxref::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::General::Dbxref::VERSION = '0.07000';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("dbxref");


__PACKAGE__->add_columns(
  "dbxref_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "dbxref_dbxref_id_seq",
  },
  "db_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "accession",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "version",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "description",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("dbxref_id");
__PACKAGE__->add_unique_constraint("dbxref_c1", ["db_id", "accession", "version"]);


__PACKAGE__->has_many(
  "arraydesigns",
  "Bio::Chado::Schema::Mage::Arraydesign",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Mage::Assay",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterials",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterial_dbxrefs",
  "Bio::Chado::Schema::Mage::BiomaterialDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_dbxrefs",
  "Bio::Chado::Schema::CellLine::CellLineDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->might_have(
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cvterm_dbxrefs",
  "Bio::Chado::Schema::Cv::CvtermDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "db",
  "Bio::Chado::Schema::General::Db",
  { db_id => "db_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "dbxrefprops",
  "Bio::Chado::Schema::Cv::Dbxrefprop",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "features",
  "Bio::Chado::Schema::Sequence::Feature",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_cvterm_dbxrefs",
  "Bio::Chado::Schema::Sequence::FeatureCvtermDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_dbxrefs",
  "Bio::Chado::Schema::Sequence::FeatureDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "library_dbxrefs",
  "Bio::Chado::Schema::Library::LibraryDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_dbxrefs",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_stock_dbxrefs",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentStockDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "organism_dbxrefs",
  "Bio::Chado::Schema::Organism::OrganismDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phylonode_dbxrefs",
  "Bio::Chado::Schema::Phylogeny::PhylonodeDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phylotrees",
  "Bio::Chado::Schema::Phylogeny::Phylotree",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "protocols",
  "Bio::Chado::Schema::Mage::Protocol",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "pub_dbxrefs",
  "Bio::Chado::Schema::Pub::PubDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stocks",
  "Bio::Chado::Schema::Stock::Stock",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stock_dbxrefs",
  "Bio::Chado::Schema::Stock::StockDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "studies",
  "Bio::Chado::Schema::Mage::Study",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZJLCc473+PTc1EIgOlcgGQ



__PACKAGE__->many_to_many
    (
     'biomaterials_mm',
     'biomaterial_dbxrefs' => 'biomaterial',
    );


__PACKAGE__->many_to_many
    (
     'cell_lines_mm',
     'cell_line_dbxrefs' => 'cell_line',
    );


__PACKAGE__->many_to_many
    (
     'cvterms_mm',
     'cvterm_dbxrefs' => 'cvterm',
    );


__PACKAGE__->many_to_many
    (
     'features_mm',
     'feature_dbxrefs' => 'feature',
    );


__PACKAGE__->many_to_many
    (
     'libraries_mm',
     'library_dbxrefs' => 'library',
    );


__PACKAGE__->many_to_many
    (
     'organisms_mm',
     'organism_dbxrefs' => 'organism',
    );


__PACKAGE__->many_to_many
    (
     'phylonodes_mm',
     'phylonode_dbxrefs' => 'phylonode',
    );


__PACKAGE__->many_to_many
    (
     'pubs_mm',
     'pub_dbxrefs' => 'pub',
    );


__PACKAGE__->many_to_many
    (
     'stocks_mm',
     'stock_dbxrefs' => 'stock',
    );


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::General::Dbxref

=head1 DESCRIPTION

A unique, global, public, stable identifier. Not necessarily an external reference - can reference data items inside the particular chado instance being used. Typically a row in a table can be uniquely identified with a primary identifier (called dbxref_id); a table may also have secondary identifiers (in a linking table <T>_dbxref). A dbxref is generally written as <DB>:<ACCESSION> or as <DB>:<ACCESSION>:<VERSION>.

=head1 NAME

Bio::Chado::Schema::General::Dbxref

=head1 ACCESSORS

=head2 dbxref_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'dbxref_dbxref_id_seq'

=head2 db_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 accession

  data_type: 'varchar'
  is_nullable: 0
  size: 255

The local part of the identifier. Guaranteed by the db authority to be unique for that db.

=head2 version

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=head1 RELATIONS

=head2 arraydesigns

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Arraydesign>

=head2 assays

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Assay>

=head2 biomaterials

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Biomaterial>

=head2 biomaterial_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::BiomaterialDbxref>

=head2 cell_line_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineDbxref>

=head2 cvterm

Type: might_have

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 cvterm_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Cv::CvtermDbxref>

=head2 db

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Db>

=head2 dbxrefprops

Type: has_many

Related object: L<Bio::Chado::Schema::Cv::Dbxrefprop>

=head2 elements

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Element>

=head2 features

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=head2 feature_cvterm_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeatureCvtermDbxref>

=head2 feature_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeatureDbxref>

=head2 library_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Library::LibraryDbxref>

=head2 nd_experiment_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentDbxref>

=head2 nd_experiment_stock_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentStockDbxref>

=head2 organism_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Organism::OrganismDbxref>

=head2 phylonode_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Phylogeny::PhylonodeDbxref>

=head2 phylotrees

Type: has_many

Related object: L<Bio::Chado::Schema::Phylogeny::Phylotree>

=head2 protocols

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Protocol>

=head2 pub_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Pub::PubDbxref>

=head2 stocks

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::Stock>

=head2 stock_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockDbxref>

=head2 studies

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Study>

=head1 MANY-TO-MANY RELATIONSHIPS

=head2 biomaterials_mm

Relation to L<Bio::Chado::Schema::Mage::Biomaterial> (i.e. C<biomaterial> table)
via the C<organism_dbxrefs> table.

=head2 cell_lines_mm

Relation to L<Bio::Chado::Schema::CellLine::CellLine> (i.e. C<cell_line> table)
via the C<cell_line_dbxrefs> table.

=head2 cvterms_mm

Relation to L<Bio::Chado::Schema::Cv::Cvterm> (i.e. C<cvterm> table)
via the C<cvterm_dbxrefs> table.

=head2 features_mm

Relation to L<Bio::Chado::Schema::Sequence::Feature> (i.e. C<feature> table)
via the C<feature_dbxrefs> table.

=head2 libraries_mm

Relation to L<Bio::Chado::Schema::Library::LibraryDbxref> (i.e. C<library> table)
via the C<library_dbxrefs> table.

=head2 organisms_mm

Relation to L<Bio::Chado::Schema::Organism::Organism> (i.e. C<organism> table)
via the C<organism_dbxrefs> table.

=head2 phylonodes_mm

Relation to L<Bio::Chado::Schema::Phylogeny::Phylonode> (i.e. C<phylonode> table)
via the C<phylonode_dbxrefs> table.

=head2 pubs_mm

Relation to L<Bio::Chado::Schema::Pub::Pub> (i.e. C<pub> table)
via the C<pub_dbxrefs> table.

=head2 stocks_mm

Relation to L<Bio::Chado::Schema::Stock::Stock> (i.e. C<stock> table)
via the C<stock_dbxrefs> table.

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

