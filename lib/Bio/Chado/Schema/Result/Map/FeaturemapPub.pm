package Bio::Chado::Schema::Result::Map::FeaturemapPub;
BEGIN {
  $Bio::Chado::Schema::Result::Map::FeaturemapPub::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Map::FeaturemapPub::VERSION = '0.08100';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("featuremap_pub");


__PACKAGE__->add_columns(
  "featuremap_pub_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "featuremap_pub_featuremap_pub_id_seq",
  },
  "featuremap_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("featuremap_pub_id");


__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Result::Pub::Pub",
  { pub_id => "pub_id" },
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
  "Bio::Chado::Schema::Result::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Jl2UjU1qjT8AKmJpFW9VNw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Map::FeaturemapPub

=head1 NAME

Bio::Chado::Schema::Result::Map::FeaturemapPub

=head1 ACCESSORS

=head2 featuremap_pub_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'featuremap_pub_featuremap_pub_id_seq'

=head2 featuremap_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Pub::Pub>

=head2 featuremap

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Map::Featuremap>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

