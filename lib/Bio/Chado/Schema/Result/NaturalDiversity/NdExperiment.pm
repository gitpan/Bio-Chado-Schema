package Bio::Chado::Schema::Result::NaturalDiversity::NdExperiment;
BEGIN {
  $Bio::Chado::Schema::Result::NaturalDiversity::NdExperiment::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::NaturalDiversity::NdExperiment::VERSION = '0.08001'; # TRIAL
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
  "Bio::Chado::Schema::Result::NaturalDiversity::NdGeolocation",
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


__PACKAGE__->has_many(
  "nd_experiment_contacts",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentContact",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_dbxrefs",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentDbxref",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_genotypes",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentGenotype",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_phenotypes",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentPhenotype",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_projects",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentProject",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experimentprops",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentprop",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_protocols",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentProtocol",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_pubs",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentPub",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_experiment_stocks",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentStock",
  { "foreign.nd_experiment_id" => "self.nd_experiment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-10-28 03:52:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2u5pTTWEf2F86gyZbHTrBg



sub create_nd_experimentprops {
    my ($self, $props, $opts) = @_;

    # process opts
    $opts->{cv_name} = 'nd_experiment_property'
        unless defined $opts->{cv_name};
    return Bio::Chado::Schema::Util->create_properties
        ( properties => $props,
          options    => $opts,
          row        => $self,
          prop_relation_name => 'nd_experimentprops',
        );
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::NaturalDiversity::NdExperiment

=head1 NAME

Bio::Chado::Schema::Result::NaturalDiversity::NdExperiment

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

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdGeolocation>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 nd_experiment_contacts

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentContact>

=head2 nd_experiment_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentDbxref>

=head2 nd_experiment_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentGenotype>

=head2 nd_experiment_phenotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentPhenotype>

=head2 nd_experiment_projects

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentProject>

=head2 nd_experimentprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentprop>

=head2 nd_experiment_protocols

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentProtocol>

=head2 nd_experiment_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentPub>

=head2 nd_experiment_stocks

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentStock>

=head2 create_nd_experimentprops

  Usage: $set->create_nd_experimentprops({ baz => 2, foo => 'bar' });
  Desc : convenience method to create experiment properties using cvterms
          from the ontology with the given name
  Args : hashref of { propname => value, ...},
         options hashref as:
          {
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given experimentprop name.  Default false.

            cv_name => cv.name to use for the given experimentprops.
                       Defaults to 'nd_experiment_property',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            dbxref_accession_prefix => optional, default
                                       'autocreated:',
            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms

             rank => force numeric rank. Be careful not to pass ranks that already exist
                     for the property type. The function will die in such case.

             allow_duplicate_values => default false.
                If true, allow duplicate instances of the same experiment
                and types in the properties of the experiment.  Duplicate
                types will have different ranks.
          }
  Ret  : hashref of { propname => new experimentprop object }

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
