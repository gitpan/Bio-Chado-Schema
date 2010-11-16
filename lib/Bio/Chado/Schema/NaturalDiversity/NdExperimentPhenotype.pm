package Bio::Chado::Schema::NaturalDiversity::NdExperimentPhenotype;
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperimentPhenotype::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperimentPhenotype::VERSION = '0.07100';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("nd_experiment_phenotype");


__PACKAGE__->add_columns(
  "nd_experiment_phenotype_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_experiment_phenotype_nd_experiment_phenotype_id_seq",
  },
  "nd_experiment_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "phenotype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("nd_experiment_phenotype_id");
__PACKAGE__->add_unique_constraint(
  "nd_experiment_phenotype_c1",
  ["nd_experiment_id", "phenotype_id"],
);


__PACKAGE__->belongs_to(
  "phenotype",
  "Bio::Chado::Schema::Phenotype::Phenotype",
  { phenotype_id => "phenotype_id" },
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


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-10-28 03:52:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SFx6wlA51/yT5QJEKkuHjw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperimentPhenotype

=head1 DESCRIPTION

Linking table: experiments to the phenotypes they produce. There is a one-to-one relationship between an experiment and a phenotype since each phenotype record should point to one experiment. Add a new experiment_id for each phenotype record.

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperimentPhenotype

=head1 ACCESSORS

=head2 nd_experiment_phenotype_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_experiment_phenotype_nd_experiment_phenotype_id_seq'

=head2 nd_experiment_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 phenotype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 phenotype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phenotype::Phenotype>

=head2 nd_experiment

Type: belongs_to

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperiment>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

