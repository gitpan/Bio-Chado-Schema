package Bio::Chado::Schema::Result::Companalysis::Analysis;
BEGIN {
  $Bio::Chado::Schema::Result::Companalysis::Analysis::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Companalysis::Analysis::VERSION = '0.08002';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("analysis");


__PACKAGE__->add_columns(
  "analysis_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "analysis_analysis_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "program",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "programversion",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "algorithm",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "sourcename",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "sourceversion",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "sourceuri",
  { data_type => "text", is_nullable => 1 },
  "timeexecuted",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);
__PACKAGE__->set_primary_key("analysis_id");
__PACKAGE__->add_unique_constraint("analysis_c1", ["program", "programversion", "sourcename"]);


__PACKAGE__->has_many(
  "analysisfeatures",
  "Bio::Chado::Schema::Result::Companalysis::Analysisfeature",
  { "foreign.analysis_id" => "self.analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "analysisprops",
  "Bio::Chado::Schema::Result::Companalysis::Analysisprop",
  { "foreign.analysis_id" => "self.analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phylotrees",
  "Bio::Chado::Schema::Result::Phylogeny::Phylotree",
  { "foreign.analysis_id" => "self.analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "quantifications",
  "Bio::Chado::Schema::Result::Mage::Quantification",
  { "foreign.analysis_id" => "self.analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YT9qC0zsA8eVNXlt/PtoXw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Companalysis::Analysis

=head1 DESCRIPTION

An analysis is a particular type of a
    computational analysis; it may be a blast of one sequence against
    another, or an all by all blast, or a different kind of analysis
    altogether. It is a single unit of computation.

=head1 NAME

Bio::Chado::Schema::Result::Companalysis::Analysis

=head1 ACCESSORS

=head2 analysis_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'analysis_analysis_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

A way of grouping analyses. This
    should be a handy short identifier that can help people find an
    analysis they want. For instance "tRNAscan", "cDNA", "FlyPep",
    "SwissProt", and it should not be assumed to be unique. For instance, there may be lots of separate analyses done against a cDNA database.

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 program

  data_type: 'varchar'
  is_nullable: 0
  size: 255

Program name, e.g. blastx, blastp, sim4, genscan.

=head2 programversion

  data_type: 'varchar'
  is_nullable: 0
  size: 255

Version description, e.g. TBLASTX 2.0MP-WashU [09-Nov-2000].

=head2 algorithm

  data_type: 'varchar'
  is_nullable: 1
  size: 255

Algorithm name, e.g. blast.

=head2 sourcename

  data_type: 'varchar'
  is_nullable: 1
  size: 255

Source name, e.g. cDNA, SwissProt.

=head2 sourceversion

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 sourceuri

  data_type: 'text'
  is_nullable: 1

This is an optional, permanent URL or URI for the source of the  analysis. The idea is that someone could recreate the analysis directly by going to this URI and fetching the source data (e.g. the blast database, or the training model).

=head2 timeexecuted

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head1 RELATIONS

=head2 analysisfeatures

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Companalysis::Analysisfeature>

=head2 analysisprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Companalysis::Analysisprop>

=head2 phylotrees

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phylogeny::Phylotree>

=head2 quantifications

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Mage::Quantification>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

