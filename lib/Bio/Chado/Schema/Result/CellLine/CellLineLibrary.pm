package Bio::Chado::Schema::Result::CellLine::CellLineLibrary;
BEGIN {
  $Bio::Chado::Schema::Result::CellLine::CellLineLibrary::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::CellLine::CellLineLibrary::VERSION = '0.08000'; # TRIAL
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("cell_line_library");


__PACKAGE__->add_columns(
  "cell_line_library_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "cell_line_library_cell_line_library_id_seq",
  },
  "cell_line_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "library_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("cell_line_library_id");
__PACKAGE__->add_unique_constraint(
  "cell_line_library_c1",
  ["cell_line_id", "library_id", "pub_id"],
);


__PACKAGE__->belongs_to(
  "cell_line",
  "Bio::Chado::Schema::Result::CellLine::CellLine",
  { cell_line_id => "cell_line_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "library",
  "Bio::Chado::Schema::Result::Library::Library",
  { library_id => "library_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


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


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jSXuZ9Hgt2aHFfabAfg+xg


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::CellLine::CellLineLibrary

=head1 NAME

Bio::Chado::Schema::Result::CellLine::CellLineLibrary

=head1 ACCESSORS

=head2 cell_line_library_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cell_line_library_cell_line_library_id_seq'

=head2 cell_line_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 library_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 cell_line

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::CellLine::CellLine>

=head2 library

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Library::Library>

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Pub::Pub>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

