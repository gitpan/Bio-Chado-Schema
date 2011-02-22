package Bio::Chado::Schema::Result::Expression::Eimage;
BEGIN {
  $Bio::Chado::Schema::Result::Expression::Eimage::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Expression::Eimage::VERSION = '0.08002';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("eimage");


__PACKAGE__->add_columns(
  "eimage_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "eimage_eimage_id_seq",
  },
  "eimage_data",
  { data_type => "text", is_nullable => 1 },
  "eimage_type",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "image_uri",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);
__PACKAGE__->set_primary_key("eimage_id");


__PACKAGE__->has_many(
  "expression_images",
  "Bio::Chado::Schema::Result::Expression::ExpressionImage",
  { "foreign.eimage_id" => "self.eimage_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2KekdzLeTd1X48rPHf7Elw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Expression::Eimage

=head1 NAME

Bio::Chado::Schema::Result::Expression::Eimage

=head1 ACCESSORS

=head2 eimage_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'eimage_eimage_id_seq'

=head2 eimage_data

  data_type: 'text'
  is_nullable: 1

We expect images in eimage_data (e.g. JPEGs) to be uuencoded.

=head2 eimage_type

  data_type: 'varchar'
  is_nullable: 0
  size: 255

Describes the type of data in eimage_data.

=head2 image_uri

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 RELATIONS

=head2 expression_images

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Expression::ExpressionImage>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

