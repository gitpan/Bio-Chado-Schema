package Bio::Chado::Schema::Stock::StockRelationshipCvterm;
BEGIN {
  $Bio::Chado::Schema::Stock::StockRelationshipCvterm::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Stock::StockRelationshipCvterm::VERSION = '0.07300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("stock_relationship_cvterm");


__PACKAGE__->add_columns(
  "stock_relationship_cvterm_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stock_relationship_cvterm_stock_relationship_cvterm_id_seq",
  },
  "stock_relatiohship_id",
  { data_type => "integer", is_nullable => 0 },
  "cvterm_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("stock_relationship_cvterm_id");


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
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lg3HaaH0qhG9owBYLOZLew


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Stock::StockRelationshipCvterm

=head1 DESCRIPTION

For germplasm maintenance and pedigree data, stock_relationship. type_id will record cvterms such as "is a female parent of", "a parent for mutation", "is a group_id of", "is a source_id of", etc The cvterms for higher categories such as "generative", "derivative" or "maintenance" can be stored in table stock_relationship_cvterm

=head1 NAME

Bio::Chado::Schema::Stock::StockRelationshipCvterm

=head1 ACCESSORS

=head2 stock_relationship_cvterm_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stock_relationship_cvterm_stock_relationship_cvterm_id_seq'

=head2 stock_relatiohship_id

  data_type: 'integer'
  is_nullable: 0

=head2 cvterm_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=head2 cvterm

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

