package Bio::Chado::Schema::CellLine::CellLineprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::CellLine::CellLineprop

=cut

__PACKAGE__->table("cell_lineprop");

=head1 ACCESSORS

=head2 cell_lineprop_id

  data_type: integer
  default_value: nextval('cell_lineprop_cell_lineprop_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 cell_line_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 value

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 rank

  data_type: integer
  default_value: 0
  is_nullable: 0
  size: 4

=cut

__PACKAGE__->add_columns(
  "cell_lineprop_id",
  {
    data_type => "integer",
    default_value => "nextval('cell_lineprop_cell_lineprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "cell_line_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("cell_lineprop_id");
__PACKAGE__->add_unique_constraint("cell_lineprop_c1", ["cell_line_id", "type_id", "rank"]);

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
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

=head2 cell_lineprop_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLinepropPub>

=cut

__PACKAGE__->has_many(
  "cell_lineprop_pubs",
  "Bio::Chado::Schema::CellLine::CellLinepropPub",
  { "foreign.cell_lineprop_id" => "self.cell_lineprop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eUCVyNQx+lQEPNDrXl3QTA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
