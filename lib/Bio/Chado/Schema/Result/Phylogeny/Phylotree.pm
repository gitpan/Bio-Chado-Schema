package Bio::Chado::Schema::Result::Phylogeny::Phylotree;
BEGIN {
  $Bio::Chado::Schema::Result::Phylogeny::Phylotree::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Phylogeny::Phylotree::VERSION = '0.09020';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("phylotree");


__PACKAGE__->add_columns(
  "phylotree_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "phylotree_phylotree_id_seq",
  },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "analysis_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "comment",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("phylotree_id");


__PACKAGE__->has_many(
  "phylonodes",
  "Bio::Chado::Schema::Result::Phylogeny::Phylonode",
  { "foreign.phylotree_id" => "self.phylotree_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "phylonode_relationships",
  "Bio::Chado::Schema::Result::Phylogeny::PhylonodeRelationship",
  { "foreign.phylotree_id" => "self.phylotree_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "analysis",
  "Bio::Chado::Schema::Result::Companalysis::Analysis",
  { analysis_id => "analysis_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


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


__PACKAGE__->has_many(
  "phylotree_pubs",
  "Bio::Chado::Schema::Result::Phylogeny::PhylotreePub",
  { "foreign.phylotree_id" => "self.phylotree_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XkHgu1GpnhW/vPbRRGM3VA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Phylogeny::Phylotree

=head1 NAME

Bio::Chado::Schema::Result::Phylogeny::Phylotree - Global anchor for phylogenetic tree.

=head1 ACCESSORS

=head2 phylotree_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'phylotree_phylotree_id_seq'

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

Type: protein, nucleotide, taxonomy, for example. The type should be any SO type, or "taxonomy".

=head2 analysis_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 comment

  data_type: 'text'
  is_nullable: 1

=head1 RELATIONS

=head2 phylonodes

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phylogeny::Phylonode>

=head2 phylonode_relationships

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phylogeny::PhylonodeRelationship>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 analysis

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Companalysis::Analysis>

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::General::Dbxref>

=head2 phylotree_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Result::Phylogeny::PhylotreePub>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

