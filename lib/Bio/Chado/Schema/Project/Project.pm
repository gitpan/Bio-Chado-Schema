package Bio::Chado::Schema::Project::Project;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Project::Project

=cut

__PACKAGE__->table("project");

=head1 ACCESSORS

=head2 project_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'project_project_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "project_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "project_project_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 255 },
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

=head2 nd_experiment_projects

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentProject>

=cut

__PACKAGE__->has_many(
  "nd_experiment_projects",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentProject",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 project_contacts

Type: has_many

Related object: L<Bio::Chado::Schema::Project::ProjectContact>

=cut

__PACKAGE__->has_many(
  "project_contacts",
  "Bio::Chado::Schema::Project::ProjectContact",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 projectprops

Type: has_many

Related object: L<Bio::Chado::Schema::Project::Projectprop>

=cut

__PACKAGE__->has_many(
  "projectprops",
  "Bio::Chado::Schema::Project::Projectprop",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 project_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Project::ProjectPub>

=cut

__PACKAGE__->has_many(
  "project_pubs",
  "Bio::Chado::Schema::Project::ProjectPub",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 project_relationship_subject_projects

Type: has_many

Related object: L<Bio::Chado::Schema::Project::ProjectRelationship>

=cut

__PACKAGE__->has_many(
  "project_relationship_subject_projects",
  "Bio::Chado::Schema::Project::ProjectRelationship",
  { "foreign.subject_project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 project_relationship_object_projects

Type: has_many

Related object: L<Bio::Chado::Schema::Project::ProjectRelationship>

=cut

__PACKAGE__->has_many(
  "project_relationship_object_projects",
  "Bio::Chado::Schema::Project::ProjectRelationship",
  { "foreign.object_project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Na5ci/BXIaIn8CMtMuOjug


# You can replace this text with custom content, and it will be preserved on regeneration
1;
