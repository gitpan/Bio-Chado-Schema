package Bio::Chado::Schema::Phylogeny::Phylotree;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("phylotree");
__PACKAGE__->add_columns(
  "phylotree_id",
  {
    data_type => "integer",
    default_value => "nextval('phylotree_phylotree_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "analysis_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "comment",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("phylotree_id");
__PACKAGE__->has_many(
  "phylonodes",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { "foreign.phylotree_id" => "self.phylotree_id" },
);
__PACKAGE__->has_many(
  "phylonode_relationships",
  "Bio::Chado::Schema::Phylogeny::PhylonodeRelationship",
  { "foreign.phylotree_id" => "self.phylotree_id" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "analysis",
  "Bio::Chado::Schema::Companalysis::Analysis",
  { analysis_id => "analysis_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
);
__PACKAGE__->has_many(
  "phylotree_pubs",
  "Bio::Chado::Schema::Phylogeny::PhylotreePub",
  { "foreign.phylotree_id" => "self.phylotree_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-29 09:17:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:e1wRhmrLUQ3HPzgTR3bKyQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
