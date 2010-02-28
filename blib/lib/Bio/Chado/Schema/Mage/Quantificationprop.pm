package Bio::Chado::Schema::Mage::Quantificationprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Quantificationprop

=head1 DESCRIPTION

Extra quantification properties that are not accounted for in quantification.

=cut

__PACKAGE__->table("quantificationprop");

=head1 ACCESSORS

=head2 quantificationprop_id

  data_type: integer
  default_value: nextval('quantificationprop_quantificationprop_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 quantification_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

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
  "quantificationprop_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('quantificationprop_quantificationprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "quantification_id",
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
  "value",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("quantificationprop_id");
__PACKAGE__->add_unique_constraint(
  "quantificationprop_c1",
  ["quantification_id", "type_id", "rank"],
);

=head1 RELATIONS

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

=head2 quantification

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Quantification>

=cut

__PACKAGE__->belongs_to(
  "quantification",
  "Bio::Chado::Schema::Mage::Quantification",
  { quantification_id => "quantification_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0jzjbiqBgXHEDIz9C4qxWw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
