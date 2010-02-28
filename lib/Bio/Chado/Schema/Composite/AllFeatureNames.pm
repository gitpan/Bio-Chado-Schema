package Bio::Chado::Schema::Composite::AllFeatureNames;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Composite::AllFeatureNames

=cut

__PACKAGE__->table("all_feature_names");

=head1 ACCESSORS

=head2 feature_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 organism_id

  data_type: integer
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "organism_id",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:21:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4IGQyyX4N6rigWwjZ71yOw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
