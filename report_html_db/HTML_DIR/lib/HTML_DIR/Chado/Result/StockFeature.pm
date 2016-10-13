use utf8;
package HTML_DIR::Chado::Result::StockFeature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

HTML_DIR::Chado::Result::StockFeature - Links a stock to a feature.

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<stock_feature>

=cut

__PACKAGE__->table("stock_feature");

=head1 ACCESSORS

=head2 stock_feature_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'stock_feature_stock_feature_id_seq'

=head2 feature_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 stock_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "stock_feature_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "stock_feature_stock_feature_id_seq",
  },
  "feature_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "stock_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</stock_feature_id>

=back

=cut

__PACKAGE__->set_primary_key("stock_feature_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<stock_feature_c1>

=over 4

=item * L</feature_id>

=item * L</stock_id>

=item * L</type_id>

=item * L</rank>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "stock_feature_c1",
  ["feature_id", "stock_id", "type_id", "rank"],
);

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<HTML_DIR::Chado::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "HTML_DIR::Chado::Result::Feature",
  { feature_id => "feature_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 stock

Type: belongs_to

Related object: L<HTML_DIR::Chado::Result::Stock>

=cut

__PACKAGE__->belongs_to(
  "stock",
  "HTML_DIR::Chado::Result::Stock",
  { stock_id => "stock_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 type

Type: belongs_to

Related object: L<HTML_DIR::Chado::Result::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "HTML_DIR::Chado::Result::Cvterm",
  { cvterm_id => "type_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-10-13 15:50:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:amSMLeaL1SbA52LbJ592Pw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
