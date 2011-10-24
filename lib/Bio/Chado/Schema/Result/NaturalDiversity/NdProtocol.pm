package Bio::Chado::Schema::Result::NaturalDiversity::NdProtocol;
BEGIN {
  $Bio::Chado::Schema::Result::NaturalDiversity::NdProtocol::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Result::NaturalDiversity::NdProtocol::VERSION = '0.09010';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("nd_protocol");


__PACKAGE__->add_columns(
  "nd_protocol_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nd_protocol_nd_protocol_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("nd_protocol_id");
__PACKAGE__->add_unique_constraint("nd_protocol_name_key", ["name"]);


__PACKAGE__->has_many(
  "nd_experiment_protocols",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentProtocol",
  { "foreign.nd_protocol_id" => "self.nd_protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Result::Cv::Cvterm",
  { cvterm_id => "type_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "nd_protocolprops",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolprop",
  { "foreign.nd_protocol_id" => "self.nd_protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "nd_protocol_reagents",
  "Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolReagent",
  { "foreign.nd_protocol_id" => "self.nd_protocol_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-09-22 08:45:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/s5ivY/IbdQpirevdhAGuw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Result::NaturalDiversity::NdProtocol

=head1 DESCRIPTION

A protocol can be anything that is done as part of the experiment.

=head1 NAME

Bio::Chado::Schema::Result::NaturalDiversity::NdProtocol

=head1 ACCESSORS

=head2 nd_protocol_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nd_protocol_nd_protocol_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

The protocol name.

=head2 type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head1 RELATIONS

=head2 nd_experiment_protocols

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdExperimentProtocol>

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Result::Cv::Cvterm>

=head2 nd_protocolprops

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolprop>

=head2 nd_protocol_reagents

Type: has_many

Related object: L<Bio::Chado::Schema::Result::NaturalDiversity::NdProtocolReagent>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

