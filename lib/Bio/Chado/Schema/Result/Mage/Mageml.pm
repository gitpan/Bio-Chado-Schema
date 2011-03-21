package Bio::Chado::Schema::Result::Mage::Mageml;
BEGIN {
  $Bio::Chado::Schema::Result::Mage::Mageml::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Mage::Mageml::VERSION = '0.08100';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("mageml");


__PACKAGE__->add_columns(
  "mageml_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "mageml_mageml_id_seq",
  },
  "mage_package",
  { data_type => "text", is_nullable => 0 },
  "mage_ml",
  { data_type => "text", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("mageml_id");


__PACKAGE__->has_many(
  "magedocumentations",
  "Bio::Chado::Schema::Result::Mage::Magedocumentation",
  { "foreign.mageml_id" => "self.mageml_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:a2Jy7AB2R2qN1xWoB8Fjiw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Mage::Mageml

=head1 DESCRIPTION

This table is for storing extra bits of MAGEml in a denormalized form. More normalization would require many more tables.

=head1 NAME

Bio::Chado::Schema::Result::Mage::Mageml

=head1 ACCESSORS

=head2 mageml_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'mageml_mageml_id_seq'

=head2 mage_package

  data_type: 'text'
  is_nullable: 0

=head2 mage_ml

  data_type: 'text'
  is_nullable: 0

=head1 RELATIONS

=head2 magedocumentations

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Magedocumentation>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

