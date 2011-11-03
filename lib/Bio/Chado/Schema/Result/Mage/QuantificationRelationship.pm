package Bio::Chado::Schema::Result::Mage::QuantificationRelationship;
BEGIN {
  $Bio::Chado::Schema::Result::Mage::QuantificationRelationship::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Mage::QuantificationRelationship::VERSION = '0.09020';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("quantification_relationship");


__PACKAGE__->add_columns(
  "quantification_relationship_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "quantification_relationship_quantification_relationship_id_seq",
  },
  "subject_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "object_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("quantification_relationship_id");
__PACKAGE__->add_unique_constraint(
  "quantification_relationship_c1",
  ["subject_id", "object_id", "type_id"],
);


__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Result::Mage::Quantification",
  { quantification_id => "subject_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Result::Mage::Quantification",
  { quantification_id => "object_id" },
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


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lMjhMSLrSfzRub2YWp5xkg


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Mage::QuantificationRelationship

=head1 DESCRIPTION

There may be multiple rounds of quantification, this allows us to keep an audit trail of what values went where.

=head1 NAME

Bio::Chado::Schema::Result::Mage::QuantificationRelationship

=head1 ACCESSORS

=head2 quantification_relationship_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'quantification_relationship_quantification_relationship_id_seq'

=head2 subject_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 object_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 subject

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Mage::Quantification>

=head2 object

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Mage::Quantification>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

