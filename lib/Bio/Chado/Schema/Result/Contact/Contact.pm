package Bio::Chado::Schema::Result::Contact::Contact;
BEGIN {
  $Bio::Chado::Schema::Result::Contact::Contact::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Contact::Contact::VERSION = '0.09000';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("contact");


__PACKAGE__->add_columns(
  "contact_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "contact_contact_id_seq",
  },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);
__PACKAGE__->set_primary_key("contact_id");
__PACKAGE__->add_unique_constraint("contact_c1", ["name"]);


__PACKAGE__->has_many(
  "arraydesigns",
  "Bio::Chado::Schema::Result::Mage::Arraydesign",
  { "foreign.manufacturer_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Result::Mage::Assay",
  { "foreign.operator_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterials",
  "Bio::Chado::Schema::Result::Mage::Biomaterial",
  { "foreign.biosourceprovider_id" => "self.contact_id" },
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
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "contact_relationship_objects",
  "Bio::Chado::Schema::Result::Contact::ContactRelationship",
  { "foreign.object_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "contact_relationship_subjects",
  "Bio::Chado::Schema::Result::Contact::ContactRelationship",
  { "foreign.subject_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_contacts",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentContact",
  { "foreign.contact_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "project_contacts",
  "Bio::Chado::Schema::Result::Project::ProjectContact",
  { "foreign.contact_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "quantifications",
  "Bio::Chado::Schema::Result::Mage::Quantification",
  { "foreign.operator_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stockcollections",
  "Bio::Chado::Schema::Result::Stock::Stockcollection",
  { "foreign.contact_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "studies",
  "Bio::Chado::Schema::Result::Mage::Study",
  { "foreign.contact_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7KIOnPWNyVs/NPhRJ3bFYg


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Contact::Contact

=head1 NAME

Bio::Chado::Schema::Result::Contact::Contact - Model persons, institutes, groups, organizations, etc.

=head1 ACCESSORS

=head2 contact_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'contact_contact_id_seq'

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

What type of contact is this?  E.g. "person", "lab".

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 RELATIONS

=head2 arraydesigns

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Arraydesign>

=head2 assays

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Assay>

=head2 biomaterials

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Biomaterial>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 contact_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Contact::ContactRelationship>

=head2 contact_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Contact::ContactRelationship>

=head2 nd_experiment_contacts

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentContact>

=head2 project_contacts

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Project::ProjectContact>

=head2 quantifications

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Quantification>

=head2 stockcollections

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Stock::Stockcollection>

=head2 studies

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Study>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

