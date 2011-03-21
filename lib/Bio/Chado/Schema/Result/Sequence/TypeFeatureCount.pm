package Bio::Chado::Schema::Result::Sequence::TypeFeatureCount;
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::TypeFeatureCount::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::TypeFeatureCount::VERSION = '0.08100';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("type_feature_count");


__PACKAGE__->add_columns(
  "type",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "num_features",
  { data_type => "bigint", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QkdqPltX2VVoNXroihBiWw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Sequence::TypeFeatureCount

=head1 NAME

Bio::Chado::Schema::Result::Sequence::TypeFeatureCount - per-feature-type feature counts

=head1 ACCESSORS

=head2 type

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 num_features

  data_type: 'bigint'
  is_nullable: 1

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

