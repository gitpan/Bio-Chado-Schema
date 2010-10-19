package Bio::Chado::Schema::NaturalDiversity::NdExperimentStockprop;
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperimentStockprop::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperimentStockprop::VERSION = '0.06300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("nd_experiment_stockprop");


__PACKAGE__->add_columns(
  "nd_experiment_stockprop_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_experiment_stockprop_nd_experiment_stockprop_id_seq",
  },
  "nd_experiment_stock_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "value",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("nd_experiment_stockprop_id");
__PACKAGE__->add_unique_constraint(
  "nd_experiment_stockprop_c1",
  ["nd_experiment_stock_id", "type_id", "rank"],
);


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
  "nd_experiment_stock",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentStock",
  { "nd_experiment_stock_id" => "nd_experiment_stock_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-30 12:25:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zuGak4CGd9LGn1abkiOyew


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperimentStockprop

=head1 DESCRIPTION

Property/value associations for experiment_stocks. This table can store the properties such as treatment

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperimentStockprop

=head1 ACCESSORS

=head2 nd_experiment_stockprop_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_experiment_stockprop_nd_experiment_stockprop_id_seq'

=head2 nd_experiment_stock_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

The experiment_stock to which the property applies.

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

The name of the property as a reference to a controlled vocabulary term.

=head2 value

  data_type: 'varchar'
  is_nullable: 1
  size: 255

The value of the property.

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

The rank of the property value, if the property has an array of values.

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 nd_experiment_stock

Type: belongs_to

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentStock>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

