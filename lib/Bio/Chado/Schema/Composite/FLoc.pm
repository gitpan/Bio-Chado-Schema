package Bio::Chado::Schema::Composite::FLoc;
BEGIN {
  $Bio::Chado::Schema::Composite::FLoc::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Composite::FLoc::VERSION = '0.06400';
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


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dbxGIAZ9SLZ4giHctwZscw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Composite::FLoc

=head1 NAME

Bio::Chado::Schema::Composite::FLoc

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

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

