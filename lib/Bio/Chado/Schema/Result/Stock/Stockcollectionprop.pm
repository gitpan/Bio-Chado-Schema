package Bio::Chado::Schema::Result::Stock::Stockcollectionprop;
BEGIN {
  $Bio::Chado::Schema::Result::Stock::Stockcollectionprop::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Stock::Stockcollectionprop::VERSION = '0.09000';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("stockcollectionprop");


__PACKAGE__->add_columns(
  "stockcollectionprop_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stockcollectionprop_stockcollectionprop_id_seq",
  },
  "stockcollection_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "value",
  { data_type => "text", is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("stockcollectionprop_id");
__PACKAGE__->add_unique_constraint(
  "stockcollectionprop_c1",
  ["stockcollection_id", "type_id", "rank"],
);


__PACKAGE__->belongs_to(
  "stockcollection",
  "Bio::Chado::Schema::Result::Stock::Stockcollection",
  { stockcollection_id => "stockcollection_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ee4TAKRvLikp5Jtcm6ZcfA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Stock::Stockcollectionprop

=head1 DESCRIPTION

The table stockcollectionprop
contains the value of the stock collection such as website/email URLs;
the value of the stock collection order URLs.

=head1 NAME

Bio::Chado::Schema::Result::Stock::Stockcollectionprop

=head1 ACCESSORS

=head2 stockcollectionprop_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stockcollectionprop_stockcollectionprop_id_seq'

=head2 stockcollection_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

The cv for the type_id is "stockcollection property type".

=head2 value

  data_type: 'text'
  is_nullable: 1

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 RELATIONS

=head2 stockcollection

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Stock::Stockcollection>

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

