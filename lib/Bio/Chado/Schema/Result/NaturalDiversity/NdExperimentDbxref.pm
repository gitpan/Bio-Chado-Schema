package Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentDbxref;
BEGIN {
  $Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentDbxref::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentDbxref::VERSION = '0.09020';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("nd_experiment_dbxref");


__PACKAGE__->add_columns(
  "nd_experiment_dbxref_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_experiment_dbxref_nd_experiment_dbxref_id_seq",
  },
  "nd_experiment_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("nd_experiment_dbxref_id");


__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::Result::General::Dbxref",
  { dbxref_id => "dbxref_id" },
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
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperiment",
  { nd_experiment_id => "nd_experiment_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ld1l9qsf11t3LQL0kwmORA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentDbxref

=head1 NAME

Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentDbxref - Cross-reference experiment to accessions, images, etc

=head1 ACCESSORS

=head2 nd_experiment_dbxref_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_experiment_dbxref_nd_experiment_dbxref_id_seq'

=head2 nd_experiment_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::General::Dbxref>

=head2 nd_experiment

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperiment>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

