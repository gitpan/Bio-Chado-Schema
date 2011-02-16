package Bio::Chado::Schema::Result::Project::ProjectRelationship;
BEGIN {
  $Bio::Chado::Schema::Result::Project::ProjectRelationship::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Project::ProjectRelationship::VERSION = '0.08000'; # TRIAL
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("project_relationship");


__PACKAGE__->add_columns(
  "project_relationship_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "project_relationship_project_relationship_id_seq",
  },
  "subject_project_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "object_project_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("project_relationship_id");
__PACKAGE__->add_unique_constraint(
  "project_relationship_c1",
  ["subject_project_id", "object_project_id", "type_id"],
);


__PACKAGE__->belongs_to(
  "subject_project",
  "Bio::Chado::Schema::Result::Project::Project",
  { project_id => "subject_project_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "object_project",
  "Bio::Chado::Schema::Result::Project::Project",
  { project_id => "object_project_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/G1HqKLRBroFGwz7Qj8FYA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Project::ProjectRelationship

=head1 NAME

Bio::Chado::Schema::Result::Project::ProjectRelationship - A project can be composed of several smaller scale projects

=head1 ACCESSORS

=head2 project_relationship_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'project_relationship_project_relationship_id_seq'

=head2 subject_project_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 object_project_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

The type of relationship being stated, such as "is part of".

=head1 RELATIONS

=head2 subject_project

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Project::Project>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 object_project

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Project::Project>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

