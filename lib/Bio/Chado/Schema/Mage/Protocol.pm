package Bio::Chado::Schema::Mage::Protocol;
BEGIN {
  $Bio::Chado::Schema::Mage::Protocol::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Mage::Protocol::VERSION = '0.07100';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("protocol");


__PACKAGE__->add_columns(
  "protocol_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "protocol_protocol_id_seq",
  },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "uri",
  { data_type => "text", is_nullable => 1 },
  "protocoldescription",
  { data_type => "text", is_nullable => 1 },
  "hardwaredescription",
  { data_type => "text", is_nullable => 1 },
  "softwaredescription",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("protocol_id");
__PACKAGE__->add_unique_constraint("protocol_c1", ["name"]);


__PACKAGE__->has_many(
  "acquisitions",
  "Bio::Chado::Schema::Mage::Acquisition",
  { "foreign.protocol_id" => "self.protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "arraydesigns",
  "Bio::Chado::Schema::Mage::Arraydesign",
  { "foreign.protocol_id" => "self.protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Mage::Assay",
  { "foreign.protocol_id" => "self.protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
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
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
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


__PACKAGE__->has_many(
  "protocolparams",
  "Bio::Chado::Schema::Mage::Protocolparam",
  { "foreign.protocol_id" => "self.protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "quantifications",
  "Bio::Chado::Schema::Mage::Quantification",
  { "foreign.protocol_id" => "self.protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "treatments",
  "Bio::Chado::Schema::Mage::Treatment",
  { "foreign.protocol_id" => "self.protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ry8UY+78ZiviKjNWid61OQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Mage::Protocol

=head1 NAME

Bio::Chado::Schema::Mage::Protocol - Procedural notes on how data was prepared and processed.

=head1 ACCESSORS

=head2 protocol_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'protocol_protocol_id_seq'

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

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

=head2 uri

  data_type: 'text'
  is_nullable: 1

=head2 protocoldescription

  data_type: 'text'
  is_nullable: 1

=head2 hardwaredescription

  data_type: 'text'
  is_nullable: 1

=head2 softwaredescription

  data_type: 'text'
  is_nullable: 1

=head1 RELATIONS

=head2 acquisitions

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Acquisition>

=head2 arraydesigns

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Arraydesign>

=head2 assays

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Assay>

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 protocolparams

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Protocolparam>

=head2 quantifications

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Quantification>

=head2 treatments

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Treatment>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

