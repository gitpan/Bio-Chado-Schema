package Bio::Chado::Schema::Result::Mage::Biomaterial;
BEGIN {
  $Bio::Chado::Schema::Result::Mage::Biomaterial::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Mage::Biomaterial::VERSION = '0.08001'; # TRIAL
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("biomaterial");


__PACKAGE__->add_columns(
  "biomaterial_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "biomaterial_biomaterial_id_seq",
  },
  "taxon_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "biosourceprovider_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "description",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("biomaterial_id");
__PACKAGE__->add_unique_constraint("biomaterial_c1", ["name"]);


__PACKAGE__->has_many(
  "assay_biomaterials",
  "Bio::Chado::Schema::Result::Mage::AssayBiomaterial",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "taxon",
  "Bio::Chado::Schema::Result::Organism::Organism",
  { organism_id => "taxon_id" },
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
  "biosourceprovider",
  "Bio::Chado::Schema::Result::Contact::Contact",
  { contact_id => "biosourceprovider_id" },
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
  "biomaterial_dbxrefs",
  "Bio::Chado::Schema::Result::Mage::BiomaterialDbxref",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterialprops",
  "Bio::Chado::Schema::Result::Mage::Biomaterialprop",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterial_relationship_subjects",
  "Bio::Chado::Schema::Result::Mage::BiomaterialRelationship",
  { "foreign.subject_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterial_relationship_objects",
  "Bio::Chado::Schema::Result::Mage::BiomaterialRelationship",
  { "foreign.object_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterial_treatments",
  "Bio::Chado::Schema::Result::Mage::BiomaterialTreatment",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "treatments",
  "Bio::Chado::Schema::Result::Mage::Treatment",
  { "foreign.biomaterial_id" => "self.biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1vxYhyIfJGhyzpuxMzUAbw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Mage::Biomaterial

=head1 DESCRIPTION

A biomaterial represents the MAGE concept of BioSource, BioSample, and LabeledExtract. It is essentially some biological material (tissue, cells, serum) that may have been processed. Processed biomaterials should be traceable back to raw biomaterials via the biomaterialrelationship table.

=head1 NAME

Bio::Chado::Schema::Result::Mage::Biomaterial

=head1 ACCESSORS

=head2 biomaterial_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'biomaterial_biomaterial_id_seq'

=head2 taxon_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 biosourceprovider_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 description

  data_type: 'text'
  is_nullable: 1

=head1 RELATIONS

=head2 assay_biomaterials

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::AssayBiomaterial>

=head2 taxon

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Organism::Organism>

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::General::Dbxref>

=head2 biosourceprovider

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Contact::Contact>

=head2 biomaterial_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::BiomaterialDbxref>

=head2 biomaterialprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Biomaterialprop>

=head2 biomaterial_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::BiomaterialRelationship>

=head2 biomaterial_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::BiomaterialRelationship>

=head2 biomaterial_treatments

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::BiomaterialTreatment>

=head2 treatments

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Treatment>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

