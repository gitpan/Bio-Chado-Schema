package Bio::Chado::Schema::Cv::Cvtermsynonym;
BEGIN {
  $Bio::Chado::Schema::Cv::Cvtermsynonym::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Cv::Cvtermsynonym::VERSION = '0.06301';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("cvtermsynonym");


__PACKAGE__->add_columns(
  "cvtermsynonym_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "cvtermsynonym_cvtermsynonym_id_seq",
  },
  "cvterm_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "synonym",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("cvtermsynonym_id");
__PACKAGE__->add_unique_constraint("cvtermsynonym_c1", ["cvterm_id", "synonym"]);


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
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ALkCRkJ9vK2LlRMVDxppKw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Cv::Cvtermsynonym

=head1 DESCRIPTION

A cvterm actually represents a
distinct class or concept. A concept can be refered to by different
phrases or names. In addition to the primary name (cvterm.name) there
can be a number of alternative aliases or synonyms. For example, "T
cell" as a synonym for "T lymphocyte".

=head1 NAME

Bio::Chado::Schema::Cv::Cvtermsynonym

=head1 ACCESSORS

=head2 cvtermsynonym_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cvtermsynonym_cvtermsynonym_id_seq'

=head2 cvterm_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 synonym

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

A synonym can be exact,
narrower, or broader than.

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 cvterm

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

