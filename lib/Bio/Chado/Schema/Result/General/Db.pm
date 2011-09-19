package Bio::Chado::Schema::Result::General::Db;
BEGIN {
  $Bio::Chado::Schema::Result::General::Db::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::General::Db::VERSION = '0.08200';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("db");


__PACKAGE__->add_columns(
  "db_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "db_db_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "urlprefix",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "url",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);
__PACKAGE__->set_primary_key("db_id");
__PACKAGE__->add_unique_constraint("db_c1", ["name"]);


__PACKAGE__->has_many(
  "dbxrefs",
  "Bio::Chado::Schema::Result::General::Dbxref",
  { "foreign.db_id" => "self.db_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CskErYSCRJcWnw9M/PfWYw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::General::Db

=head1 DESCRIPTION

A database authority. Typical databases in
bioinformatics are FlyBase, GO, UniProt, NCBI, MGI, etc. The authority
is generally known by this shortened form, which is unique within the
bioinformatics and biomedical realm.  To Do - add support for URIs,
URNs (e.g. LSIDs). We can do this by treating the URL as a URI -
however, some applications may expect this to be resolvable - to be
decided.

=head1 NAME

Bio::Chado::Schema::Result::General::Db

=head1 ACCESSORS

=head2 db_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'db_db_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 urlprefix

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 url

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 RELATIONS

=head2 dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::General::Dbxref>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

