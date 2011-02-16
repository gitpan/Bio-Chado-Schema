package Bio::Chado::Schema::Result::Composite::Gff3view;
BEGIN {
  $Bio::Chado::Schema::Result::Composite::Gff3view::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Composite::Gff3view::VERSION = '0.08001'; # TRIAL
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("gff3view");


__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", is_nullable => 1 },
  "ref",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "type",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "fstart",
  { data_type => "integer", is_nullable => 1 },
  "fend",
  { data_type => "integer", is_nullable => 1 },
  "score",
  { data_type => "double precision", is_nullable => 1 },
  "strand",
  { data_type => "text", is_nullable => 1 },
  "phase",
  { data_type => "integer", is_nullable => 1 },
  "seqlen",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "organism_id",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-10-18 16:56:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+oeARx+zxVYZng5Uiveeyw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Composite::Gff3view

=head1 NAME

Bio::Chado::Schema::Result::Composite::Gff3view

=head1 ACCESSORS

=head2 feature_id

  data_type: 'integer'
  is_nullable: 1

=head2 ref

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 source

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 type

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 fstart

  data_type: 'integer'
  is_nullable: 1

=head2 fend

  data_type: 'integer'
  is_nullable: 1

=head2 score

  data_type: 'double precision'
  is_nullable: 1

=head2 strand

  data_type: 'text'
  is_nullable: 1

=head2 phase

  data_type: 'integer'
  is_nullable: 1

=head2 seqlen

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 organism_id

  data_type: 'integer'
  is_nullable: 1

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

