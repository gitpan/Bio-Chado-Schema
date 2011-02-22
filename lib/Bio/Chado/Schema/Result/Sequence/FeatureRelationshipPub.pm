package Bio::Chado::Schema::Result::Sequence::FeatureRelationshipPub;
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::FeatureRelationshipPub::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::FeatureRelationshipPub::VERSION = '0.08002';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("feature_relationship_pub");


__PACKAGE__->add_columns(
  "feature_relationship_pub_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "feature_relationship_pub_feature_relationship_pub_id_seq",
  },
  "feature_relationship_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("feature_relationship_pub_id");
__PACKAGE__->add_unique_constraint(
  "feature_relationship_pub_c1",
  ["feature_relationship_id", "pub_id"],
);


__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Result::Pub::Pub",
  { pub_id => "pub_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "feature_relationship",
  "Bio::Chado::Schema::Result::Sequence::FeatureRelationship",
  { "feature_relationship_id" => "feature_relationship_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Yk6Pym2mZyY/AjnF92tO7w


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Sequence::FeatureRelationshipPub

=head1 DESCRIPTION

Provenance. Attach optional evidence to a feature_relationship in the form of a publication.

=head1 NAME

Bio::Chado::Schema::Result::Sequence::FeatureRelationshipPub

=head1 ACCESSORS

=head2 feature_relationship_pub_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'feature_relationship_pub_feature_relationship_pub_id_seq'

=head2 feature_relationship_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Pub::Pub>

=head2 feature_relationship

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Sequence::FeatureRelationship>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

