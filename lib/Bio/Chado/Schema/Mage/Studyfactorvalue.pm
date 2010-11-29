package Bio::Chado::Schema::Mage::Studyfactorvalue;
BEGIN {
  $Bio::Chado::Schema::Mage::Studyfactorvalue::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Mage::Studyfactorvalue::VERSION = '0.07300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("studyfactorvalue");


__PACKAGE__->add_columns(
  "studyfactorvalue_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "studyfactorvalue_studyfactorvalue_id_seq",
  },
  "studyfactor_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "assay_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "factorvalue",
  { data_type => "text", is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("studyfactorvalue_id");


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


__PACKAGE__->belongs_to(
  "studyfactor",
  "Bio::Chado::Schema::Mage::Studyfactor",
  { studyfactor_id => "studyfactor_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k9J30JZ9SKuIOY7eyNO2Kw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Mage::Studyfactorvalue

=head1 NAME

Bio::Chado::Schema::Mage::Studyfactorvalue

=head1 ACCESSORS

=head2 studyfactorvalue_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'studyfactorvalue_studyfactorvalue_id_seq'

=head2 studyfactor_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 assay_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 factorvalue

  data_type: 'text'
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 RELATIONS

=head2 assay

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Assay>

=head2 studyfactor

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Studyfactor>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

