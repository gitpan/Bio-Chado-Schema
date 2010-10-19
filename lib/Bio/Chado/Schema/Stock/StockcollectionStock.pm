package Bio::Chado::Schema::Stock::StockcollectionStock;
BEGIN {
  $Bio::Chado::Schema::Stock::StockcollectionStock::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Stock::StockcollectionStock::VERSION = '0.06300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("stockcollection_stock");


__PACKAGE__->add_columns(
  "stockcollection_stock_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stockcollection_stock_stockcollection_stock_id_seq",
  },
  "stockcollection_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "stock_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("stockcollection_stock_id");
__PACKAGE__->add_unique_constraint(
  "stockcollection_stock_c1",
  ["stockcollection_id", "stock_id"],
);


__PACKAGE__->belongs_to(
  "stock",
  "Bio::Chado::Schema::Stock::Stock",
  { stock_id => "stock_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "stockcollection",
  "Bio::Chado::Schema::Stock::Stockcollection",
  { stockcollection_id => "stockcollection_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yG8QkSXUbg/32opT0TUeSg


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Stock::StockcollectionStock

=head1 DESCRIPTION

stockcollection_stock links
a stock collection to the stocks which are contained in the collection.

=head1 NAME

Bio::Chado::Schema::Stock::StockcollectionStock

=head1 ACCESSORS

=head2 stockcollection_stock_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stockcollection_stock_stockcollection_stock_id_seq'

=head2 stockcollection_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 stock_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 stock

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::Stock>

=head2 stockcollection

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::Stockcollection>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

