package Bio::Chado::Schema::Result::Composite::FLoc;
BEGIN {
  $Bio::Chado::Schema::Result::Composite::FLoc::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Composite::FLoc::VERSION = '0.08200';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("f_loc");


__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "dbxref_id",
  { data_type => "integer", is_nullable => 1 },
  "nbeg",
  { data_type => "integer", is_nullable => 1 },
  "nend",
  { data_type => "integer", is_nullable => 1 },
  "strand",
  { data_type => "smallint", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1Kr0g1/QsR2mPepYWS1Wsw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Composite::FLoc

=head1 NAME

Bio::Chado::Schema::Result::Composite::FLoc

=head1 ACCESSORS

=head2 feature_id

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 dbxref_id

  data_type: 'integer'
  is_nullable: 1

=head2 nbeg

  data_type: 'integer'
  is_nullable: 1

=head2 nend

  data_type: 'integer'
  is_nullable: 1

=head2 strand

  data_type: 'smallint'
  is_nullable: 1

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

