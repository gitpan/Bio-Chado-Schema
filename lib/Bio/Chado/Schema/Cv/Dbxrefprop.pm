package Bio::Chado::Schema::Cv::Dbxrefprop;
BEGIN {
  $Bio::Chado::Schema::Cv::Dbxrefprop::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Cv::Dbxrefprop::VERSION = '0.06301';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("dbxrefprop");


__PACKAGE__->add_columns(
  "dbxrefprop_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "dbxrefprop_dbxrefprop_id_seq",
  },
  "dbxref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "value",
  { data_type => "text", default_value => "", is_nullable => 0 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("dbxrefprop_id");
__PACKAGE__->add_unique_constraint("dbxrefprop_c1", ["dbxref_id", "type_id", "rank"]);


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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:e/5OIVBQ/HHbXZ+puLRs3Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Cv::Dbxrefprop

=head1 DESCRIPTION

Metadata about a dbxref. Note that this is not defined in the dbxref module, as it depends on the cvterm table. This table has a structure analagous to cvtermprop.

=head1 NAME

Bio::Chado::Schema::Cv::Dbxrefprop

=head1 ACCESSORS

=head2 dbxrefprop_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'dbxrefprop_dbxrefprop_id_seq'

=head2 dbxref_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: 'text'
  default_value: (empty string)
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

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

