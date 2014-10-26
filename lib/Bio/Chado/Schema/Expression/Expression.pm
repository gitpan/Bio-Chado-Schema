package Bio::Chado::Schema::Expression::Expression;
BEGIN {
  $Bio::Chado::Schema::Expression::Expression::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::Expression::Expression::VERSION = '0.06302';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';



__PACKAGE__->table("expression");


__PACKAGE__->add_columns(
  "expression_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "expression_expression_id_seq",
  },
  "uniquename",
  { data_type => "text", is_nullable => 0 },
  "md5checksum",
  { data_type => "char", is_nullable => 1, size => 32 },
  "description",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("expression_id");
__PACKAGE__->add_unique_constraint("expression_c1", ["uniquename"]);


__PACKAGE__->has_many(
  "expression_cvterms",
  "Bio::Chado::Schema::Expression::ExpressionCvterm",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "expression_images",
  "Bio::Chado::Schema::Expression::ExpressionImage",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "expressionprops",
  "Bio::Chado::Schema::Expression::Expressionprop",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "expression_pubs",
  "Bio::Chado::Schema::Expression::ExpressionPub",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "feature_expressions",
  "Bio::Chado::Schema::Expression::FeatureExpression",
  { "foreign.expression_id" => "self.expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gqG7utKODUjwkht6OOuFoQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema::Expression::Expression

=head1 NAME

Bio::Chado::Schema::Expression::Expression - The expression table is essentially a bridge table.

=head1 ACCESSORS

=head2 expression_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'expression_expression_id_seq'

=head2 uniquename

  data_type: 'text'
  is_nullable: 0

=head2 md5checksum

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 description

  data_type: 'text'
  is_nullable: 1

=head1 RELATIONS

=head2 expression_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::ExpressionCvterm>

=head2 expression_images

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::ExpressionImage>

=head2 expressionprops

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::Expressionprop>

=head2 expression_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::ExpressionPub>

=head2 feature_expressions

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::FeatureExpression>

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

