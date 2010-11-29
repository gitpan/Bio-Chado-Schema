package Bio::Chado::Schema::Expression::FeatureExpression;
BEGIN {
  $Bio::Chado::Schema::Expression::FeatureExpression::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Expression::FeatureExpression::VERSION = '0.07300';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("feature_expression");


__PACKAGE__->add_columns(
  "feature_expression_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "feature_expression_feature_expression_id_seq",
  },
  "expression_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "feature_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("feature_expression_id");
__PACKAGE__->add_unique_constraint(
  "feature_expression_c1",
  ["expression_id", "feature_id", "pub_id"],
);


__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
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
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "expression",
  "Bio::Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
  {
    cascade_copy   => 0,
    cascade_delete => 0,
    is_deferrable  => 1,
    on_delete      => "CASCADE",
    on_update      => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "feature_expressionprops",
  "Bio::Chado::Schema::Expression::FeatureExpressionprop",
  { "foreign.feature_expression_id" => "self.feature_expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-04-16 14:33:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:00BrIk/RgyPYIhH9+0Skaw


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Expression::FeatureExpression

=head1 NAME

Bio::Chado::Schema::Expression::FeatureExpression

=head1 ACCESSORS

=head2 feature_expression_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'feature_expression_feature_expression_id_seq'

=head2 expression_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 feature_id

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

Related object: L<Bio::Chado::Schema::Pub::Pub>

=head2 feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=head2 expression

Type: belongs_to

Related object: L<Bio::Chado::Schema::Expression::Expression>

=head2 feature_expressionprops

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::FeatureExpressionprop>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

