package Bio::Chado::Schema::Mage::ElementRelationship;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::ElementRelationship

=head1 DESCRIPTION

Sometimes we want to combine measurements from multiple elements to get a composite value. Affymetrix combines many probes to form a probeset measurement, for instance.

=cut

__PACKAGE__->table("element_relationship");

=head1 ACCESSORS

=head2 element_relationship_id

  data_type: integer
  default_value: nextval('element_relationship_element_relationship_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 subject_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 object_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: text
  default_value: undef
  is_nullable: 1

=head2 rank

  data_type: integer
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "element_relationship_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('element_relationship_element_relationship_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "subject_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "type_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "object_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "value",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("element_relationship_id");
__PACKAGE__->add_unique_constraint(
  "element_relationship_c1",
  ["subject_id", "object_id", "type_id", "rank"],
);

=head1 RELATIONS

=head2 object

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Element>

=cut

__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Mage::Element",
  { element_id => "object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 subject

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Element>

=cut

__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Mage::Element",
  { element_id => "subject_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+Px1jbb8GLMw26k7owI59A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
