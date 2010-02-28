package Bio::Chado::Schema::Expression::FeatureExpressionprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Expression::FeatureExpressionprop

=head1 DESCRIPTION

Extensible properties for
feature_expression (comments, for example). Modeled on feature_cvtermprop.

=cut

__PACKAGE__->table("feature_expressionprop");

=head1 ACCESSORS

=head2 feature_expressionprop_id

  data_type: integer
  default_value: nextval('feature_expressionprop_feature_expressionprop_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 feature_expression_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: text
  default_value: undef
  is_nullable: 1

=head2 rank

  data_type: integer
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "feature_expressionprop_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('feature_expressionprop_feature_expressionprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "feature_expression_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "type_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "value",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("feature_expressionprop_id");
__PACKAGE__->add_unique_constraint(
  "feature_expressionprop_c1",
  ["feature_expression_id", "type_id", "rank"],
);

=head1 RELATIONS

=head2 feature_expression

Type: belongs_to

Related object: L<Bio::Chado::Schema::Expression::FeatureExpression>

=cut

__PACKAGE__->belongs_to(
  "feature_expression",
  "Bio::Chado::Schema::Expression::FeatureExpression",
  { "feature_expression_id" => "feature_expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HpIfdReV9u51i8yszotPJg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
