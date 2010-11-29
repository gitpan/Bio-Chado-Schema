package Bio::Chado::Schema::CellLine::CellLineCvtermprop;
BEGIN {
  $Bio::Chado::Schema::CellLine::CellLineCvtermprop::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::CellLine::CellLineCvtermprop::VERSION = '0.07300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("cell_line_cvtermprop");


__PACKAGE__->add_columns(
  "cell_line_cvtermprop_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "cell_line_cvtermprop_cell_line_cvtermprop_id_seq",
  },
  "cell_line_cvterm_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "value",
  { data_type => "text", is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("cell_line_cvtermprop_id");
__PACKAGE__->add_unique_constraint(
  "cell_line_cvtermprop_c1",
  ["cell_line_cvterm_id", "type_id", "rank"],
);


__PACKAGE__->belongs_to(
  "cell_line_cvterm",
  "Bio::Chado::Schema::CellLine::CellLineCvterm",
  { cell_line_cvterm_id => "cell_line_cvterm_id" },
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
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:28aSlbpXroRV9VV1cpwm7A


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::CellLine::CellLineCvtermprop

=head1 NAME

Bio::Chado::Schema::CellLine::CellLineCvtermprop

=head1 ACCESSORS

=head2 cell_line_cvtermprop_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cell_line_cvtermprop_cell_line_cvtermprop_id_seq'

=head2 cell_line_cvterm_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: 'text'
  is_nullable: 1

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 RELATIONS

=head2 cell_line_cvterm

Type: belongs_to

Related object: L<Bio::Chado::Schema::CellLine::CellLineCvterm>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

