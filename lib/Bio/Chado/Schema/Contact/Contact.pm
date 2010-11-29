package Bio::Chado::Schema::Contact::Contact;
BEGIN {
  $Bio::Chado::Schema::Contact::Contact::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Contact::Contact::VERSION = '0.07300';
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
  "Bio::Chado::Schema::Mage::Arraydesign",
  { "foreign.manufacturer_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Mage::Assay",
  { "foreign.operator_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "biomaterials",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { "foreign.biosourceprovider_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
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
  "Bio::Chado::Schema::Contact::ContactRelationship",
  { "foreign.object_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "contact_relationship_subjects",
  "Bio::Chado::Schema::Contact::ContactRelationship",
  { "foreign.subject_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_contacts",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentContact",
  { "foreign.contact_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "project_contacts",
  "Bio::Chado::Schema::Project::ProjectContact",
  { "foreign.contact_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "quantifications",
  "Bio::Chado::Schema::Mage::Quantification",
  { "foreign.operator_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "stockcollections",
  "Bio::Chado::Schema::Stock::Stockcollection",
  { "foreign.contact_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "studies",
  "Bio::Chado::Schema::Mage::Study",
  { "foreign.contact_id" => "self.contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:06gv7bmt2HKmaDlmPKI7/Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Contact::Contact

=head1 NAME

Bio::Chado::Schema::Contact::Contact - Model persons, institutes, groups, organizations, etc.

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

Related object: L<Bio::Chado::Schema::Mage::Arraydesign>

=head2 assays

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Assay>

=head2 biomaterials

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Biomaterial>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 contact_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Contact::ContactRelationship>

=head2 contact_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Contact::ContactRelationship>

=head2 nd_experiment_contacts

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentContact>

=head2 project_contacts

Type: has_many

Related object: L<Bio::Chado::Schema::Project::ProjectContact>

=head2 quantifications

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Quantification>

=head2 stockcollections

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::Stockcollection>

=head2 studies

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Study>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

