package Bio::Chado::Schema::Mage::Arraydesign;
BEGIN {
  $Bio::Chado::Schema::Mage::Arraydesign::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Mage::Arraydesign::VERSION = '0.07100';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("arraydesign");


__PACKAGE__->add_columns(
  "arraydesign_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "arraydesign_arraydesign_id_seq",
  },
  "manufacturer_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "platformtype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "substratetype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "protocol_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "version",
  { data_type => "text", is_nullable => 1 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "array_dimensions",
  { data_type => "text", is_nullable => 1 },
  "element_dimensions",
  { data_type => "text", is_nullable => 1 },
  "num_of_elements",
  { data_type => "integer", is_nullable => 1 },
  "num_array_columns",
  { data_type => "integer", is_nullable => 1 },
  "num_array_rows",
  { data_type => "integer", is_nullable => 1 },
  "num_grid_columns",
  { data_type => "integer", is_nullable => 1 },
  "num_grid_rows",
  { data_type => "integer", is_nullable => 1 },
  "num_sub_columns",
  { data_type => "integer", is_nullable => 1 },
  "num_sub_rows",
  { data_type => "integer", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("arraydesign_id");
__PACKAGE__->add_unique_constraint("arraydesign_c1", ["name"]);


__PACKAGE__->belongs_to(
  "manufacturer",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "manufacturer_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "platformtype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "platformtype_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
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
  "substratetype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "substratetype_id" },
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
  "protocol",
  "Bio::Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "arraydesignprops",
  "Bio::Chado::Schema::Mage::Arraydesignprop",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Mage::Assay",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FR/k6RYSH2PKr1sDtaDFcA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Mage::Arraydesign

=head1 DESCRIPTION

General properties about an array.
An array is a template used to generate physical slides, etc.  It
contains layout information, as well as global array properties, such
as material (glass, nylon) and spot dimensions (in rows/columns).

=head1 NAME

Bio::Chado::Schema::Mage::Arraydesign

=head1 ACCESSORS

=head2 arraydesign_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'arraydesign_arraydesign_id_seq'

=head2 manufacturer_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 platformtype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 substratetype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 protocol_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 version

  data_type: 'text'
  is_nullable: 1

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 array_dimensions

  data_type: 'text'
  is_nullable: 1

=head2 element_dimensions

  data_type: 'text'
  is_nullable: 1

=head2 num_of_elements

  data_type: 'integer'
  is_nullable: 1

=head2 num_array_columns

  data_type: 'integer'
  is_nullable: 1

=head2 num_array_rows

  data_type: 'integer'
  is_nullable: 1

=head2 num_grid_columns

  data_type: 'integer'
  is_nullable: 1

=head2 num_grid_rows

  data_type: 'integer'
  is_nullable: 1

=head2 num_sub_columns

  data_type: 'integer'
  is_nullable: 1

=head2 num_sub_rows

  data_type: 'integer'
  is_nullable: 1

=head1 RELATIONS

=head2 manufacturer

Type: belongs_to

Related object: L<Bio::Chado::Schema::Contact::Contact>

=head2 platformtype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=head2 substratetype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 protocol

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Protocol>

=head2 arraydesignprops

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Arraydesignprop>

=head2 assays

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Assay>

=head2 elements

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Element>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

