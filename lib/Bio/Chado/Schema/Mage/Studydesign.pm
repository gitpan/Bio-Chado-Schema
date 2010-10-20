package Bio::Chado::Schema::Mage::Studydesign;
BEGIN {
  $Bio::Chado::Schema::Mage::Studydesign::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Mage::Studydesign::VERSION = '0.06302';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("studydesign");


__PACKAGE__->add_columns(
  "studydesign_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "studydesign_studydesign_id_seq",
  },
  "study_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("studydesign_id");


__PACKAGE__->belongs_to(
  "study",
  "Bio::Chado::Schema::Mage::Study",
  { study_id => "study_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "studydesignprops",
  "Bio::Chado::Schema::Mage::Studydesignprop",
  { "foreign.studydesign_id" => "self.studydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "studyfactors",
  "Bio::Chado::Schema::Mage::Studyfactor",
  { "foreign.studydesign_id" => "self.studydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rRzfi8h7x2cAkVdfdhn8jQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Mage::Studydesign

=head1 NAME

Bio::Chado::Schema::Mage::Studydesign

=head1 ACCESSORS

=head2 studydesign_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'studydesign_studydesign_id_seq'

=head2 study_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head1 RELATIONS

=head2 study

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Study>

=head2 studydesignprops

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Studydesignprop>

=head2 studyfactors

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Studyfactor>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

