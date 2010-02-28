package Bio::Chado::Schema::Mage::Biomaterial;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Biomaterial

=head1 DESCRIPTION

A biomaterial represents the MAGE concept of BioSource, BioSample, and LabeledExtract. It is essentially some biological material (tissue, cells, serum) that may have been processed. Processed biomaterials should be traceable back to raw biomaterials via the biomaterialrelationship table.

=cut

__PACKAGE__->table("biomaterial");

=head1 ACCESSORS

=head2 biomaterial_id

  data_type: integer
  default_value: nextval('biomaterial_biomaterial_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 taxon_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=head2 biosourceprovider_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=head2 dbxref_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=head2 name

  data_type: text
  default_value: undef
  is_nullable: 1

=head2 description

  data_type: text
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "biomaterial_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('biomaterial_biomaterial_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "taxon_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "biosourceprovider_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "dbxref_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "name",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "description",
  { data_type => "text", default_value => undef, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("biomaterial_id");
__PACKAGE__->add_unique_constraint("biomaterial_c1", ["name"]);

=head1 RELATIONS

=head2 assay_biomaterials

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::AssayBiomaterial>

=cut

__PACKAGE__->has_many(
  "assay_biomaterials",
  "Bio::Chado::Schema::Mage::AssayBiomaterial",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 taxon

Type: belongs_to

Related object: L<Bio::Chado::Schema::Organism::Organism>

=cut

__PACKAGE__->belongs_to(
  "taxon",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "taxon_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 biosourceprovider

Type: belongs_to

Related object: L<Bio::Chado::Schema::Contact::Contact>

=cut

__PACKAGE__->belongs_to(
  "biosourceprovider",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "biosourceprovider_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 biomaterial_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::BiomaterialDbxref>

=cut

__PACKAGE__->has_many(
  "biomaterial_dbxrefs",
  "Bio::Chado::Schema::Mage::BiomaterialDbxref",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 biomaterialprops

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Biomaterialprop>

=cut

__PACKAGE__->has_many(
  "biomaterialprops",
  "Bio::Chado::Schema::Mage::Biomaterialprop",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 biomaterial_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::BiomaterialRelationship>

=cut

__PACKAGE__->has_many(
  "biomaterial_relationship_subjects",
  "Bio::Chado::Schema::Mage::BiomaterialRelationship",
  { "foreign.subject_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 biomaterial_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::BiomaterialRelationship>

=cut

__PACKAGE__->has_many(
  "biomaterial_relationship_objects",
  "Bio::Chado::Schema::Mage::BiomaterialRelationship",
  { "foreign.object_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 biomaterial_treatments

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::BiomaterialTreatment>

=cut

__PACKAGE__->has_many(
  "biomaterial_treatments",
  "Bio::Chado::Schema::Mage::BiomaterialTreatment",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 treatments

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Treatment>

=cut

__PACKAGE__->has_many(
  "treatments",
  "Bio::Chado::Schema::Mage::Treatment",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FJVA80J5/LakdFGosL5gtA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
