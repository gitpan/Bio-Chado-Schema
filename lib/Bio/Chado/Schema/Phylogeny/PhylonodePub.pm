package Bio::Chado::Schema::Phylogeny::PhylonodePub;
BEGIN {
  $Bio::Chado::Schema::Phylogeny::PhylonodePub::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Phylogeny::PhylonodePub::VERSION = '0.06300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("phylonode_pub");


__PACKAGE__->add_columns(
  "phylonode_pub_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "phylonode_pub_phylonode_pub_id_seq",
  },
  "phylonode_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("phylonode_pub_id");
__PACKAGE__->add_unique_constraint("phylonode_pub_phylonode_id_key", ["phylonode_id", "pub_id"]);


__PACKAGE__->belongs_to(
  "phylonode",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "phylonode_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:asSZxjiryXxbX6/nSLHIJQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Phylogeny::PhylonodePub

=head1 NAME

Bio::Chado::Schema::Phylogeny::PhylonodePub

=head1 ACCESSORS

=head2 phylonode_pub_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'phylonode_pub_phylonode_pub_id_seq'

=head2 phylonode_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 phylonode

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylonode>

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

