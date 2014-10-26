package Bio::Chado::Schema::NaturalDiversity::NdExperiment;
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperiment::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::NaturalDiversity::NdExperiment::VERSION = '0.06302';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("nd_experiment");


__PACKAGE__->add_columns(
  "nd_experiment_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_experiment_nd_experiment_id_seq",
  },
  "nd_geolocation_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("nd_experiment_id");


__PACKAGE__->belongs_to(
  "nd_geolocation",
  "Bio::Chado::Schema::NaturalDiversity::NdGeolocation",
  { nd_geolocation_id => "nd_geolocation_id" },
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


__PACKAGE__->has_many(
  "nd_experiment_contacts",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentContact",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_dbxrefs",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentDbxref",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->might_have(
  "nd_experiment_genotype",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->might_have(
  "nd_experiment_phenotype",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentPhenotype",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_projects",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentProject",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experimentprops",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentprop",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_protocols",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentProtocol",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_pubs",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentPub",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_stocks",
  "Bio::Chado::Schema::NaturalDiversity::NdExperimentStock",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:H4F2iw3eRmVfBOU+Ncb3Ew


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperiment

=head1 NAME

Bio::Chado::Schema::NaturalDiversity::NdExperiment

=head1 ACCESSORS

=head2 nd_experiment_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_experiment_nd_experiment_id_seq'

=head2 nd_geolocation_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 nd_geolocation

Type: belongs_to

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdGeolocation>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=head2 nd_experiment_contacts

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentContact>

=head2 nd_experiment_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentDbxref>

=head2 nd_experiment_genotype

Type: might_have

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentGenotype>

=head2 nd_experiment_phenotype

Type: might_have

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentPhenotype>

=head2 nd_experiment_projects

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentProject>

=head2 nd_experimentprops

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentprop>

=head2 nd_experiment_protocols

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentProtocol>

=head2 nd_experiment_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentPub>

=head2 nd_experiment_stocks

Type: has_many

Related object: L<Bio::Chado::Schema::NaturalDiversity::NdExperimentStock>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

