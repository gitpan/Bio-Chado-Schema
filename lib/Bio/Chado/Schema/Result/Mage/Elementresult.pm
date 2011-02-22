package Bio::Chado::Schema::Result::Mage::Elementresult;
BEGIN {
  $Bio::Chado::Schema::Result::Mage::Elementresult::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Mage::Elementresult::VERSION = '0.08002';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("elementresult");


__PACKAGE__->add_columns(
  "elementresult_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "elementresult_elementresult_id_seq",
  },
  "element_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "quantification_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "signal",
  { data_type => "double precision", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("elementresult_id");
__PACKAGE__->add_unique_constraint("elementresult_c1", ["element_id", "quantification_id"]);


__PACKAGE__->belongs_to(
  "element",
  "Bio::Chado::Schema::Result::Mage::Element",
  { element_id => "element_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "quantification",
  "Bio::Chado::Schema::Result::Mage::Quantification",
  { quantification_id => "quantification_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "elementresult_relationship_subjects",
  "Bio::Chado::Schema::Result::Mage::ElementresultRelationship",
  { "foreign.subject_id" => "self.elementresult_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "elementresult_relationship_objects",
  "Bio::Chado::Schema::Result::Mage::ElementresultRelationship",
  { "foreign.object_id" => "self.elementresult_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZaZkTc2galwdEmECncsrYw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Mage::Elementresult

=head1 DESCRIPTION

An element on an array produces a measurement when hybridized to a biomaterial (traceable through quantification_id). This is the base data from which tables that actually contain data inherit.

=head1 NAME

Bio::Chado::Schema::Result::Mage::Elementresult

=head1 ACCESSORS

=head2 elementresult_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'elementresult_elementresult_id_seq'

=head2 element_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 quantification_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 signal

  data_type: 'double precision'
  is_nullable: 0

=head1 RELATIONS

=head2 element

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Mage::Element>

=head2 quantification

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Mage::Quantification>

=head2 elementresult_relationship_subjects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::ElementresultRelationship>

=head2 elementresult_relationship_objects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::ElementresultRelationship>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

