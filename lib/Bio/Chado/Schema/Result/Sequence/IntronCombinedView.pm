package Bio::Chado::Schema::Result::Sequence::IntronCombinedView;
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::IntronCombinedView::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Sequence::IntronCombinedView::VERSION = '0.08001'; # TRIAL
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("intron_combined_view");


__PACKAGE__->add_columns(
  "exon1_id",
  { data_type => "integer", is_nullable => 1 },
  "exon2_id",
  { data_type => "integer", is_nullable => 1 },
  "fmin",
  { data_type => "integer", is_nullable => 1 },
  "fmax",
  { data_type => "integer", is_nullable => 1 },
  "strand",
  { data_type => "smallint", is_nullable => 1 },
  "srcfeature_id",
  { data_type => "integer", is_nullable => 1 },
  "intron_rank",
  { data_type => "integer", is_nullable => 1 },
  "transcript_id",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BH+ootLdSRc/fvgWEYLCYg


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Sequence::IntronCombinedView

=head1 NAME

Bio::Chado::Schema::Result::Sequence::IntronCombinedView

=head1 ACCESSORS

=head2 exon1_id

  data_type: 'integer'
  is_nullable: 1

=head2 exon2_id

  data_type: 'integer'
  is_nullable: 1

=head2 fmin

  data_type: 'integer'
  is_nullable: 1

=head2 fmax

  data_type: 'integer'
  is_nullable: 1

=head2 strand

  data_type: 'smallint'
  is_nullable: 1

=head2 srcfeature_id

  data_type: 'integer'
  is_nullable: 1

=head2 intron_rank

  data_type: 'integer'
  is_nullable: 1

=head2 transcript_id

  data_type: 'integer'
  is_nullable: 1

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
