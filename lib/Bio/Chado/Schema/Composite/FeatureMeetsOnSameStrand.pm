package Bio::Chado::Schema::Composite::FeatureMeetsOnSameStrand;
BEGIN {
  $Bio::Chado::Schema::Composite::FeatureMeetsOnSameStrand::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Composite::FeatureMeetsOnSameStrand::VERSION = '0.06301';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("feature_meets_on_same_strand");


__PACKAGE__->add_columns(
  "subject_id",
  { data_type => "integer", is_nullable => 1 },
  "object_id",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YiMS/G4c00y181GB13Citg


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Composite::FeatureMeetsOnSameStrand

=head1 DESCRIPTION

as feature_meets, but
featurelocs must be on the same strand. symmetric,reflexive

=head1 NAME

Bio::Chado::Schema::Composite::FeatureMeetsOnSameStrand

=head1 ACCESSORS

=head2 subject_id

  data_type: 'integer'
  is_nullable: 1

=head2 object_id

  data_type: 'integer'
  is_nullable: 1

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

