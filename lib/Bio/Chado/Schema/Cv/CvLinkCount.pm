package Bio::Chado::Schema::Cv::CvLinkCount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::CvLinkCount - per-cv summary of number of
links (cvterm_relationships) broken down by
relationship_type. num_links is the total # of links of the specified
type in which the subject_id of the link is in the named cv

=cut

__PACKAGE__->table("cv_link_count");

=head1 ACCESSORS

=head2 cv_name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 relation_name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 1024

=head2 relation_cv_name

  data_type: character varying
  default_value: undef
  is_nullable: 1
  size: 255

=head2 num_links

  data_type: bigint
  default_value: undef
  is_nullable: 1
  size: 8

=cut

__PACKAGE__->add_columns(
  "cv_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "relation_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 1024,
  },
  "relation_cv_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "num_links",
  { data_type => "bigint", default_value => undef, is_nullable => 1, size => 8 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nAzGj1tDoGtsjTCUh61Zqg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
