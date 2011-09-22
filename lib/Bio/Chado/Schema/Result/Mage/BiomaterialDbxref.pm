package Bio::Chado::Schema::Result::Mage::BiomaterialDbxref;
BEGIN {
  $Bio::Chado::Schema::Result::Mage::BiomaterialDbxref::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Mage::BiomaterialDbxref::VERSION = '0.09000';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("biomaterial_dbxref");


__PACKAGE__->add_columns(
  "biomaterial_dbxref_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "biomaterial_dbxref_biomaterial_dbxref_id_seq",
  },
  "biomaterial_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("biomaterial_dbxref_id");
__PACKAGE__->add_unique_constraint("biomaterial_dbxref_c1", ["biomaterial_id", "dbxref_id"]);


__PACKAGE__->belongs_to(
  "biomaterial",
  "Bio::Chado::Schema::Result::Mage::Biomaterial",
  { biomaterial_id => "biomaterial_id" },
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
  "Bio::Chado::Schema::Result::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IV0HPBVaUplQTyLeE7g+Tg


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Mage::BiomaterialDbxref

=head1 NAME

Bio::Chado::Schema::Result::Mage::BiomaterialDbxref

=head1 ACCESSORS

=head2 biomaterial_dbxref_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'biomaterial_dbxref_biomaterial_dbxref_id_seq'

=head2 biomaterial_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 biomaterial

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Mage::Biomaterial>

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::General::Dbxref>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

