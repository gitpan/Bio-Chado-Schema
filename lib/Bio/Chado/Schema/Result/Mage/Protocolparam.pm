package Bio::Chado::Schema::Result::Mage::Protocolparam;
BEGIN {
  $Bio::Chado::Schema::Result::Mage::Protocolparam::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::Mage::Protocolparam::VERSION = '0.08000'; # TRIAL
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("protocolparam");


__PACKAGE__->add_columns(
  "protocolparam_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "protocolparam_protocolparam_id_seq",
  },
  "protocol_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "datatype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "unittype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "value",
  { data_type => "text", is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("protocolparam_id");


__PACKAGE__->belongs_to(
  "unittype",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "unittype_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "protocol",
  "Bio::Chado::Schema::Result::Mage::Protocol",
  { protocol_id => "protocol_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "datatype",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "datatype_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    join_type      => "LEFT",
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xbiUm/m9u0lm1awlqADtpQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::Mage::Protocolparam

=head1 DESCRIPTION

Parameters related to a
protocol. For example, if the protocol is a soak, this might include attributes of bath temperature and duration.

=head1 NAME

Bio::Chado::Schema::Result::Mage::Protocolparam

=head1 ACCESSORS

=head2 protocolparam_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'protocolparam_protocolparam_id_seq'

=head2 protocol_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 datatype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 unittype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 value

  data_type: 'text'
  is_nullable: 1

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 RELATIONS

=head2 unittype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 protocol

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Mage::Protocol>

=head2 datatype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

