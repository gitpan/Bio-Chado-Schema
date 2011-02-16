package Bio::Chado::Schema::Result::Stock::StockGenotype;
BEGIN {
  $Bio::Chado::Schema::Result::Stock::StockGenotype::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Stock::StockGenotype::VERSION = '0.08000'; # TRIAL
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("stock_genotype");


__PACKAGE__->add_columns(
  "stock_genotype_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stock_genotype_stock_genotype_id_seq",
  },
  "stock_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "genotype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("stock_genotype_id");
__PACKAGE__->add_unique_constraint("stock_genotype_c1", ["stock_id", "genotype_id"]);


__PACKAGE__->belongs_to(
  "genotype",
  "Bio::Chado::Schema::Result::Genetic::Genotype",
  { genotype_id => "genotype_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "stock",
  "Bio::Chado::Schema::Result::Stock::Stock",
  { stock_id => "stock_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:E2UmG8Y+t+NbKr3JOqW+1w


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Stock::StockGenotype

=head1 DESCRIPTION

Simple table linking a stock to
a genotype. Features with genotypes can be linked to stocks thru feature_genotype -> genotype -> stock_genotype -> stock.

=head1 NAME

Bio::Chado::Schema::Result::Stock::StockGenotype

=head1 ACCESSORS

=head2 stock_genotype_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stock_genotype_stock_genotype_id_seq'

=head2 stock_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 genotype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 genotype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Genetic::Genotype>

=head2 stock

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Stock::Stock>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

