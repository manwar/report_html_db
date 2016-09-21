use utf8;
package html_dir::Chado::Result::Analysisprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

html_dir::Chado::Result::Analysisprop

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

=head1 TABLE: C<analysisprop>

=cut

__PACKAGE__->table("analysisprop");

=head1 ACCESSORS

=head2 analysisprop_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'analysisprop_analysisprop_id_seq'

=head2 analysis_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: 'text'
  is_nullable: 1

=head2 rank

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "analysisprop_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "analysisprop_analysisprop_id_seq",
  },
  "analysis_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "type_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "value",
  { data_type => "text", is_nullable => 1 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</analysisprop_id>

=back

=cut

__PACKAGE__->set_primary_key("analysisprop_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<analysisprop_c1>

=over 4

=item * L</analysis_id>

=item * L</type_id>

=item * L</rank>

=back

=cut

__PACKAGE__->add_unique_constraint("analysisprop_c1", ["analysis_id", "type_id", "rank"]);

=head1 RELATIONS

=head2 analysis

Type: belongs_to

Related object: L<html_dir::Chado::Result::Analysis>

=cut

__PACKAGE__->belongs_to(
  "analysis",
  "html_dir::Chado::Result::Analysis",
  { analysis_id => "analysis_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 type

Type: belongs_to

Related object: L<html_dir::Chado::Result::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "html_dir::Chado::Result::Cvterm",
  { cvterm_id => "type_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-09-08 16:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vOI4zZtxGHWVqQJfpJwf4Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;