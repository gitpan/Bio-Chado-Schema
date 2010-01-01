package Bio::Chado::Schema::General::Project;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::General::Project

=cut

__PACKAGE__->table("project");

=head1 ACCESSORS

=head2 project_id

  data_type: integer
  default_value: nextval('project_project_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 name

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 255

=head2 description

  data_type: character varying
  default_value: undef
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "project_id",
  {
    data_type => "integer",
    default_value => "nextval('project_project_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "description",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("project_id");
__PACKAGE__->add_unique_constraint("project_c1", ["name"]);

=head1 RELATIONS

=head2 assay_projects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::AssayProject>

=cut

__PACKAGE__->has_many(
  "assay_projects",
  "Bio::Chado::Schema::Mage::AssayProject",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ntjNFl7eiDcZ57YKZsHgfg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
