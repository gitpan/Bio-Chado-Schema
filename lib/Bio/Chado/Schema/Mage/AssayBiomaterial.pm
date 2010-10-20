package Bio::Chado::Schema::Mage::AssayBiomaterial;
BEGIN {
  $Bio::Chado::Schema::Mage::AssayBiomaterial::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Mage::AssayBiomaterial::VERSION = '0.06302';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("assay_biomaterial");


__PACKAGE__->add_columns(
  "assay_biomaterial_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "assay_biomaterial_assay_biomaterial_id_seq",
  },
  "assay_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "biomaterial_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "channel_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("assay_biomaterial_id");
__PACKAGE__->add_unique_constraint(
  "assay_biomaterial_c1",
  ["assay_id", "biomaterial_id", "channel_id", "rank"],
);


__PACKAGE__->belongs_to(
  "channel",
  "Bio::Chado::Schema::Mage::Channel",
  { channel_id => "channel_id" },
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
  "biomaterial",
  "Bio::Chado::Schema::Mage::Biomaterial",
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
  "assay",
  "Bio::Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rY31rDP5M4Pw89g/vTtXQQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Mage::AssayBiomaterial

=head1 DESCRIPTION

A biomaterial can be hybridized many times (technical replicates), or combined with other biomaterials in a single hybridization (for two-channel arrays).

=head1 NAME

Bio::Chado::Schema::Mage::AssayBiomaterial

=head1 ACCESSORS

=head2 assay_biomaterial_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'assay_biomaterial_assay_biomaterial_id_seq'

=head2 assay_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 biomaterial_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 channel_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 RELATIONS

=head2 channel

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Channel>

=head2 biomaterial

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Biomaterial>

=head2 assay

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Assay>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

