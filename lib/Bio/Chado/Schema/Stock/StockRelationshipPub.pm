package Bio::Chado::Schema::Stock::StockRelationshipPub;
BEGIN {
  $Bio::Chado::Schema::Stock::StockRelationshipPub::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Stock::StockRelationshipPub::VERSION = '0.06400';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("stock_relationship_pub");


__PACKAGE__->add_columns(
  "stock_relationship_pub_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stock_relationship_pub_stock_relationship_pub_id_seq",
  },
  "stock_relationship_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("stock_relationship_pub_id");
__PACKAGE__->add_unique_constraint(
  "stock_relationship_pub_c1",
  ["stock_relationship_id", "pub_id"],
);


__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "stock_relationship",
  "Bio::Chado::Schema::Stock::StockRelationship",
  { "stock_relationship_id" => "stock_relationship_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5F8HVLcKJz6x1p+eAOKlgA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Stock::StockRelationshipPub

=head1 DESCRIPTION

Provenance. Attach optional evidence to a stock_relationship in the form of a publication.

=head1 NAME

Bio::Chado::Schema::Stock::StockRelationshipPub

=head1 ACCESSORS

=head2 stock_relationship_pub_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stock_relationship_pub_stock_relationship_pub_id_seq'

=head2 stock_relationship_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=head2 stock_relationship

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::StockRelationship>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

