package Bio::Chado::Schema::Sequence::FeaturepropPub;
BEGIN {
  $Bio::Chado::Schema::Sequence::FeaturepropPub::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Sequence::FeaturepropPub::VERSION = '0.07100';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("featureprop_pub");


__PACKAGE__->add_columns(
  "featureprop_pub_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "featureprop_pub_featureprop_pub_id_seq",
  },
  "featureprop_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("featureprop_pub_id");
__PACKAGE__->add_unique_constraint("featureprop_pub_c1", ["featureprop_id", "pub_id"]);


__PACKAGE__->belongs_to(
  "featureprop",
  "Bio::Chado::Schema::Sequence::Featureprop",
  { featureprop_id => "featureprop_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SW83lefhZfS7QG10FX2YOA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Sequence::FeaturepropPub

=head1 DESCRIPTION

Provenance. Any featureprop assignment can optionally be supported by a publication.

=head1 NAME

Bio::Chado::Schema::Sequence::FeaturepropPub

=head1 ACCESSORS

=head2 featureprop_pub_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'featureprop_pub_featureprop_pub_id_seq'

=head2 featureprop_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 featureprop

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Featureprop>

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

