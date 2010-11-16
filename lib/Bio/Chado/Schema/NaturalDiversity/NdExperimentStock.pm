package Bio::Chado::Schema::NaturalDiversity::NdExperimentStock;
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperimentStock::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperimentStock::VERSION = '0.07100';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("nd_experiment_stock");


__PACKAGE__->add_columns(
  "nd_experiment_stock_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_experiment_stock_nd_experiment_stock_id_seq",
  },
  "nd_experiment_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "stock_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("nd_experiment_stock_id");


__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
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
  "nd_experiment",
  "Bio::Chado::Schema::NaturalDiversity::NdExperiment",
  { nd_experiment_id => "nd_experiment_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "nd_experiment_stock_dbxrefs",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentStockDbxref",
  {
    "foreign.nd_experiment_stock_id" => "self.nd_experiment_stock_id",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_stockprops",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentStockprop",
  {
    "foreign.nd_experiment_stock_id" => "self.nd_experiment_stock_id",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BhwLj81nl/4bPMHE48A9SQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperimentStock

=head1 DESCRIPTION

Part of a stock or a clone of a stock that is used in an experiment

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperimentStock

=head1 ACCESSORS

=head2 nd_experiment_stock_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_experiment_stock_nd_experiment_stock_id_seq'

=head2 nd_experiment_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 stock_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

stock used in the extraction or the corresponding stock for the clone

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 stock

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::Stock>

=head2 nd_experiment

Type: belongs_to

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperiment>

=head2 nd_experiment_stock_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentStockDbxref>

=head2 nd_experiment_stockprops

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentStockprop>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

