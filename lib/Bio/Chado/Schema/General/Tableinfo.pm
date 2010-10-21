package Bio::Chado::Schema::General::Tableinfo;
BEGIN {
  $Bio::Chado::Schema::General::Tableinfo::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::General::Tableinfo::VERSION = '0.06400';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("tableinfo");


__PACKAGE__->add_columns(
  "tableinfo_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "tableinfo_tableinfo_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "primary_key_column",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "is_view",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "view_on_table_id",
  { data_type => "integer", is_nullable => 1 },
  "superclass_table_id",
  { data_type => "integer", is_nullable => 1 },
  "is_updateable",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "modification_date",
  {
    data_type     => "date",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);
__PACKAGE__->set_primary_key("tableinfo_id");
__PACKAGE__->add_unique_constraint("tableinfo_c1", ["name"]);


__PACKAGE__->has_many(
  "controls",
  "Bio::Chado::Schema::Mage::Control",
  { "foreign.tableinfo_id" => "self.tableinfo_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "magedocumentations",
  "Bio::Chado::Schema::Mage::Magedocumentation",
  { "foreign.tableinfo_id" => "self.tableinfo_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0EOLyHeZBC5uBYw0qeqENQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::General::Tableinfo

=head1 NAME

Bio::Chado::Schema::General::Tableinfo

=head1 ACCESSORS

=head2 tableinfo_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'tableinfo_tableinfo_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 primary_key_column

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 is_view

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 view_on_table_id

  data_type: 'integer'
  is_nullable: 1

=head2 superclass_table_id

  data_type: 'integer'
  is_nullable: 1

=head2 is_updateable

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 modification_date

  data_type: 'date'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head1 RELATIONS

=head2 controls

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Control>

=head2 magedocumentations

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Magedocumentation>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

