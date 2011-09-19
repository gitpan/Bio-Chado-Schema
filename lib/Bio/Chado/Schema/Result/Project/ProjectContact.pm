package Bio::Chado::Schema::Result::Project::ProjectContact;
BEGIN {
  $Bio::Chado::Schema::Result::Project::ProjectContact::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Project::ProjectContact::VERSION = '0.08200';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("project_contact");


__PACKAGE__->add_columns(
  "project_contact_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "project_contact_project_contact_id_seq",
  },
  "project_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "contact_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("project_contact_id");
__PACKAGE__->add_unique_constraint("project_contact_c1", ["project_id", "contact_id"]);


__PACKAGE__->belongs_to(
  "project",
  "Bio::Chado::Schema::Result::Project::Project",
  { project_id => "project_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "contact",
  "Bio::Chado::Schema::Result::Contact::Contact",
  { contact_id => "contact_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J3YmqM29T25HDKbk7dEJJQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Project::ProjectContact

=head1 NAME

Bio::Chado::Schema::Result::Project::ProjectContact - Linking project(s) to contact(s)

=head1 ACCESSORS

=head2 project_contact_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'project_contact_project_contact_id_seq'

=head2 project_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 contact_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 project

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Project::Project>

=head2 contact

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Contact::Contact>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

