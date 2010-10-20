package Bio::Chado::Schema::Map::Featurepos;
BEGIN {
  $Bio::Chado::Schema::Map::Featurepos::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Map::Featurepos::VERSION = '0.06302';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("featurepos");


__PACKAGE__->add_columns(
  "featurepos_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "featurepos_featurepos_id_seq",
  },
  "featuremap_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
    sequence          => "featurepos_featuremap_id_seq",
  },
  "feature_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "map_feature_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "mappos",
  { data_type => "double precision", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("featurepos_id");


__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "map_feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "map_feature_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "featuremap",
  "Bio::Chado::Schema::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3/lR2HPHQ8lZKGkuvjjDLQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Map::Featurepos

=head1 NAME

Bio::Chado::Schema::Map::Featurepos

=head1 ACCESSORS

=head2 featurepos_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'featurepos_featurepos_id_seq'

=head2 featuremap_id

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0
  sequence: 'featurepos_featuremap_id_seq'

=head2 feature_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 map_feature_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

map_feature_id
links to the feature (map) upon which the feature is being localized.

=head2 mappos

  data_type: 'double precision'
  is_nullable: 0

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=head2 map_feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=head2 featuremap

Type: belongs_to

Related object: L<Bio::Chado::Schema::Map::Featuremap>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

