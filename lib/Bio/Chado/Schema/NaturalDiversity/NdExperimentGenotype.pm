package Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype;
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype::VERSION = '0.07300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("nd_experiment_genotype");


__PACKAGE__->add_columns(
  "nd_experiment_genotype_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_experiment_genotype_nd_experiment_genotype_id_seq",
  },
  "nd_experiment_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "genotype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("nd_experiment_genotype_id");
__PACKAGE__->add_unique_constraint(
  "nd_experiment_genotype_c1",
  ["nd_experiment_id", "genotype_id"],
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


__PACKAGE__->belongs_to(
  "genotype",
  "Bio::Chado::Schema::Genetic::Genotype",
  { genotype_id => "genotype_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-10-28 03:52:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:r9vtruL+MI5xpfxqKN94Zw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype

=head1 DESCRIPTION

Linking table: experiments to the genotypes they produce. There is a one-to-one relationship between an experiment and a genotype since each genotype record should point to one experiment. Add a new experiment_id for each genotype record.

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype

=head1 ACCESSORS

=head2 nd_experiment_genotype_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_experiment_genotype_nd_experiment_genotype_id_seq'

=head2 nd_experiment_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 genotype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 nd_experiment

Type: belongs_to

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperiment>

=head2 genotype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Genetic::Genotype>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

