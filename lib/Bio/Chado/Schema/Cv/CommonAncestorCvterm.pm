package Bio::Chado::Schema::Cv::CommonAncestorCvterm;
BEGIN {
  $Bio::Chado::Schema::Cv::CommonAncestorCvterm::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Cv::CommonAncestorCvterm::VERSION = '0.07300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("common_ancestor_cvterm");


__PACKAGE__->add_columns(
  "cvterm1_id",
  { data_type => "integer", is_nullable => 1 },
  "cvterm2_id",
  { data_type => "integer", is_nullable => 1 },
  "ancestor_cvterm_id",
  { data_type => "integer", is_nullable => 1 },
  "pathdistance1",
  { data_type => "integer", is_nullable => 1 },
  "pathdistance2",
  { data_type => "integer", is_nullable => 1 },
  "total_pathdistance",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dyaUb6knm7HSAN8M+jYilA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Cv::CommonAncestorCvterm

=head1 DESCRIPTION

The common ancestor of any
two terms is the intersection of both terms ancestors. Two terms can
have multiple common ancestors. Use total_pathdistance to get the
least common ancestor

=head1 NAME

Bio::Chado::Schema::Cv::CommonAncestorCvterm

=head1 ACCESSORS

=head2 cvterm1_id

  data_type: 'integer'
  is_nullable: 1

=head2 cvterm2_id

  data_type: 'integer'
  is_nullable: 1

=head2 ancestor_cvterm_id

  data_type: 'integer'
  is_nullable: 1

=head2 pathdistance1

  data_type: 'integer'
  is_nullable: 1

=head2 pathdistance2

  data_type: 'integer'
  is_nullable: 1

=head2 total_pathdistance

  data_type: 'integer'
  is_nullable: 1

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

