package Bio::Chado::Schema::Cv::CvLeaf;
BEGIN {
  $Bio::Chado::Schema::Cv::CvLeaf::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Cv::CvLeaf::VERSION = '0.07300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("cv_leaf");


__PACKAGE__->add_columns(
  "cv_id",
  { data_type => "integer", is_nullable => 1 },
  "cvterm_id",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1VCW73X/l+A4ncb5QuUosA


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Cv::CvLeaf

=head1 DESCRIPTION

the leaves of a cv are the set of terms
which have no children (terms that are not the object of a
relation). All cvs will have at least 1 leaf

=head1 NAME

Bio::Chado::Schema::Cv::CvLeaf

=head1 ACCESSORS

=head2 cv_id

  data_type: 'integer'
  is_nullable: 1

=head2 cvterm_id

  data_type: 'integer'
  is_nullable: 1

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

