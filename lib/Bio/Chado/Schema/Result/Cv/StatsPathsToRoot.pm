package Bio::Chado::Schema::Result::Cv::StatsPathsToRoot;
BEGIN {
  $Bio::Chado::Schema::Result::Cv::StatsPathsToRoot::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Cv::StatsPathsToRoot::VERSION = '0.08002';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("stats_paths_to_root");


__PACKAGE__->add_columns(
  "cvterm_id",
  { data_type => "integer", is_nullable => 1 },
  "total_paths",
  { data_type => "bigint", is_nullable => 1 },
  "avg_distance",
  { data_type => "numeric", is_nullable => 1 },
  "min_distance",
  { data_type => "integer", is_nullable => 1 },
  "max_distance",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:v8mWhXZfhr7ZZktKhJpeDg


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Cv::StatsPathsToRoot

=head1 DESCRIPTION

per-cvterm statistics on its
placement in the DAG relative to the root. There may be multiple paths
from any term to the root. This gives the total number of paths, and
the average minimum and maximum distances. Here distance is defined by
cvtermpath.pathdistance

=head1 NAME

Bio::Chado::Schema::Result::Cv::StatsPathsToRoot

=head1 ACCESSORS

=head2 cvterm_id

  data_type: 'integer'
  is_nullable: 1

=head2 total_paths

  data_type: 'bigint'
  is_nullable: 1

=head2 avg_distance

  data_type: 'numeric'
  is_nullable: 1

=head2 min_distance

  data_type: 'integer'
  is_nullable: 1

=head2 max_distance

  data_type: 'integer'
  is_nullable: 1

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

