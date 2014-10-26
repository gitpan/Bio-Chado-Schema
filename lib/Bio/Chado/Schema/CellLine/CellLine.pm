package Bio::Chado::Schema::CellLine::CellLine;
BEGIN {
  $Bio::Chado::Schema::CellLine::CellLine::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::CellLine::CellLine::VERSION = '0.06301';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("cell_line");


__PACKAGE__->add_columns(
  "cell_line_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "cell_line_cell_line_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "uniquename",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "organism_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "timeaccessioned",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "timelastmodified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);
__PACKAGE__->set_primary_key("cell_line_id");
__PACKAGE__->add_unique_constraint("cell_line_c1", ["uniquename", "organism_id"]);


__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "cell_line_cvterms",
  "Bio::Chado::Schema::CellLine::CellLineCvterm",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_dbxrefs",
  "Bio::Chado::Schema::CellLine::CellLineDbxref",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_features",
  "Bio::Chado::Schema::CellLine::CellLineFeature",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_libraries",
  "Bio::Chado::Schema::CellLine::CellLineLibrary",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_lineprops",
  "Bio::Chado::Schema::CellLine::CellLineprop",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_pubs",
  "Bio::Chado::Schema::CellLine::CellLinePub",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_relationship_subjects",
  "Bio::Chado::Schema::CellLine::CellLineRelationship",
  { "foreign.subject_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_relationship_objects",
  "Bio::Chado::Schema::CellLine::CellLineRelationship",
  { "foreign.object_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "cell_line_synonyms",
  "Bio::Chado::Schema::CellLine::CellLineSynonym",
  { "foreign.cell_line_id" => "self.cell_line_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bSpl0pE/TDd8htXcE/RHGA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::CellLine::CellLine

=head1 NAME

Bio::Chado::Schema::CellLine::CellLine

=head1 ACCESSORS

=head2 cell_line_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cell_line_cell_line_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 uniquename

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 organism_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 timeaccessioned

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 timelastmodified

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head1 RELATIONS

=head2 organism

Type: belongs_to

Related object: L<Bio::Chado::Schema::Organism::Organism>

=head2 cell_line_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineCvterm>

=head2 cell_line_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineDbxref>

=head2 cell_line_features

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineFeature>

=head2 cell_line_libraries

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineLibrary>

=head2 cell_lineprops

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineprop>

=head2 cell_line_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLinePub>

=head2 cell_line_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineRelationship>

=head2 cell_line_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineRelationship>

=head2 cell_line_synonyms

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineSynonym>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

