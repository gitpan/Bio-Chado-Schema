package Bio::Chado::Schema::Organism::OrganismDbxref;
BEGIN {
  $Bio::Chado::Schema::Organism::OrganismDbxref::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Organism::OrganismDbxref::VERSION = '0.06301';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("organism_dbxref");


__PACKAGE__->add_columns(
  "organism_dbxref_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "organism_dbxref_organism_dbxref_id_seq",
  },
  "organism_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("organism_dbxref_id");
__PACKAGE__->add_unique_constraint("organism_dbxref_c1", ["organism_id", "dbxref_id"]);


__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YW9IBGLlJcAKuuDp+NMDLA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Organism::OrganismDbxref

=head1 NAME

Bio::Chado::Schema::Organism::OrganismDbxref

=head1 ACCESSORS

=head2 organism_dbxref_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'organism_dbxref_organism_dbxref_id_seq'

=head2 organism_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 organism

Type: belongs_to

Related object: L<Bio::Chado::Schema::Organism::Organism>

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

