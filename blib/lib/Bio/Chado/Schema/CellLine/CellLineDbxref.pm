package Bio::Chado::Schema::CellLine::CellLineDbxref;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::CellLine::CellLineDbxref

=cut

__PACKAGE__->table("cell_line_dbxref");

=head1 ACCESSORS

=head2 cell_line_dbxref_id

  data_type: integer
  default_value: nextval('cell_line_dbxref_cell_line_dbxref_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 cell_line_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 dbxref_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 is_current

  data_type: boolean
  default_value: true
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "cell_line_dbxref_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('cell_line_dbxref_cell_line_dbxref_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "cell_line_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "dbxref_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "is_current",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("cell_line_dbxref_id");
__PACKAGE__->add_unique_constraint("cell_line_dbxref_c1", ["cell_line_id", "dbxref_id"]);

=head1 RELATIONS

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line

Type: belongs_to

Related object: L<Bio::Chado::Schema::CellLine::CellLine>

=cut

__PACKAGE__->belongs_to(
  "cell_line",
  "Bio::Chado::Schema::CellLine::CellLine",
  { cell_line_id => "cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xMWdwH3HQNpA+XMSECAf6A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
