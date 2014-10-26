package Bio::Chado::Schema::Cv::Cvtermpath;
BEGIN {
  $Bio::Chado::Schema::Cv::Cvtermpath::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Cv::Cvtermpath::VERSION = '0.06302';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("cvtermpath");


__PACKAGE__->add_columns(
  "cvtermpath_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "cvtermpath_cvtermpath_id_seq",
  },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "subject_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "object_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "cv_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pathdistance",
  { data_type => "integer", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("cvtermpath_id");
__PACKAGE__->add_unique_constraint(
  "cvtermpath_c1",
  ["subject_id", "object_id", "type_id", "pathdistance"],
);


__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "object_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "subject_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "cv",
  "Bio::Chado::Schema::Cv::Cv",
  { cv_id => "cv_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1B23FYH1bWW69+918dFlZw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Cv::Cvtermpath

=head1 DESCRIPTION

The reflexive transitive closure of
the cvterm_relationship relation.

=head1 NAME

Bio::Chado::Schema::Cv::Cvtermpath

=head1 ACCESSORS

=head2 cvtermpath_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cvtermpath_cvtermpath_id_seq'

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

The relationship type that
this is a closure over. If null, then this is a closure over ALL
relationship types. If non-null, then this references a relationship
cvterm - note that the closure will apply to both this relationship
AND the OBO_REL:is_a (subclass) relationship.

=head2 subject_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 object_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 cv_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

Closures will mostly be within
one cv. If the closure of a relationship traverses a cv, then this
refers to the cv of the object_id cvterm.

=head2 pathdistance

  data_type: 'integer'
  is_nullable: 1

The number of steps
required to get from the subject cvterm to the object cvterm, counting
from zero (reflexive relationship).

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 object

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 subject

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 cv

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cv>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

