package Bio::Chado::Schema::Result::Sequence::ProteinCodingGene;
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::ProteinCodingGene::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::ProteinCodingGene::VERSION = '0.08001'; # TRIAL
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("protein_coding_gene");


__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", is_nullable => 1 },
  "dbxref_id",
  { data_type => "integer", is_nullable => 1 },
  "organism_id",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "uniquename",
  { data_type => "text", is_nullable => 1 },
  "residues",
  { data_type => "text", is_nullable => 1 },
  "seqlen",
  { data_type => "integer", is_nullable => 1 },
  "md5checksum",
  { data_type => "char", is_nullable => 1, size => 32 },
  "type_id",
  { data_type => "integer", is_nullable => 1 },
  "is_analysis",
  { data_type => "boolean", is_nullable => 1 },
  "is_obsolete",
  { data_type => "boolean", is_nullable => 1 },
  "timeaccessioned",
  { data_type => "timestamp", is_nullable => 1 },
  "timelastmodified",
  { data_type => "timestamp", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/0llhIyKpSDA4/JPSMHwmQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Sequence::ProteinCodingGene

=head1 NAME

Bio::Chado::Schema::Result::Sequence::ProteinCodingGene

=head1 ACCESSORS

=head2 feature_id

  data_type: 'integer'
  is_nullable: 1

=head2 dbxref_id

  data_type: 'integer'
  is_nullable: 1

=head2 organism_id

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 uniquename

  data_type: 'text'
  is_nullable: 1

=head2 residues

  data_type: 'text'
  is_nullable: 1

=head2 seqlen

  data_type: 'integer'
  is_nullable: 1

=head2 md5checksum

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 type_id

  data_type: 'integer'
  is_nullable: 1

=head2 is_analysis

  data_type: 'boolean'
  is_nullable: 1

=head2 is_obsolete

  data_type: 'boolean'
  is_nullable: 1

=head2 timeaccessioned

  data_type: 'timestamp'
  is_nullable: 1

=head2 timelastmodified

  data_type: 'timestamp'
  is_nullable: 1

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

