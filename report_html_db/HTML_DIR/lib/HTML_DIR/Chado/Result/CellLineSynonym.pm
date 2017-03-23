use utf8;
package HTML_DIR::Chado::Result::CellLineSynonym;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

HTML_DIR::Chado::Result::CellLineSynonym

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

=head1 TABLE: C<cell_line_synonym>

=cut

__PACKAGE__->table("cell_line_synonym");

=head1 ACCESSORS

=head2 cell_line_synonym_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'cell_line_synonym_cell_line_synonym_id_seq'

=head2 cell_line_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 synonym_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 pub_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 is_current

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 is_internal

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "cell_line_synonym_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "cell_line_synonym_cell_line_synonym_id_seq",
  },
  "cell_line_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "synonym_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "pub_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "is_current",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "is_internal",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</cell_line_synonym_id>

=back

=cut

__PACKAGE__->set_primary_key("cell_line_synonym_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<cell_line_synonym_c1>

=over 4

=item * L</synonym_id>

=item * L</cell_line_id>

=item * L</pub_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "cell_line_synonym_c1",
  ["synonym_id", "cell_line_id", "pub_id"],
);

=head1 RELATIONS

=head2 cell_line

Type: belongs_to

Related object: L<HTML_DIR::Chado::Result::CellLine>

=cut

__PACKAGE__->belongs_to(
  "cell_line",
  "HTML_DIR::Chado::Result::CellLine",
  { cell_line_id => "cell_line_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 pub

Type: belongs_to

Related object: L<HTML_DIR::Chado::Result::Pub>

=cut

__PACKAGE__->belongs_to(
  "pub",
  "HTML_DIR::Chado::Result::Pub",
  { pub_id => "pub_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 synonym

Type: belongs_to

Related object: L<HTML_DIR::Chado::Result::Synonym>

=cut

__PACKAGE__->belongs_to(
  "synonym",
  "HTML_DIR::Chado::Result::Synonym",
  { synonym_id => "synonym_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-10-18 14:49:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8A4vVj2yC82rXnorXEHDxw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;