package Bio::Chado::Schema::Project::Project;
BEGIN {
  $Bio::Chado::Schema::Project::Project::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Project::Project::VERSION = '0.06400';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("project");


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


__PACKAGE__->has_many(
  "assay_projects",
  "Bio::Chado::Schema::Mage::AssayProject",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_projects",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentProject",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "project_contacts",
  "Bio::Chado::Schema::Project::ProjectContact",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "projectprops",
  "Bio::Chado::Schema::Project::Projectprop",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "project_pubs",
  "Bio::Chado::Schema::Project::ProjectPub",
  { "foreign.project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "project_relationship_subject_projects",
  "Bio::Chado::Schema::Project::ProjectRelationship",
  { "foreign.subject_project_id" => "self.project_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


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

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Project::Project

=head1 NAME

Bio::Chado::Schema::Project::Project

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

=head1 RELATIONS

=head2 assay_projects

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::AssayProject>

=head2 nd_experiment_projects

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentProject>

=head2 project_contacts

Type: has_many

Related object: L<Bio::Chado::Schema::Project::ProjectContact>

=head2 projectprops

Type: has_many

Related object: L<Bio::Chado::Schema::Project::Projectprop>

=head2 project_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Project::ProjectPub>

=head2 project_relationship_subject_projects

Type: has_many

Related object: L<Bio::Chado::Schema::Project::ProjectRelationship>

=head2 project_relationship_object_projects

Type: has_many

Related object: L<Bio::Chado::Schema::Project::ProjectRelationship>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

