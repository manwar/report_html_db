use utf8;
package html_dir::Chado::Result::Phylonode;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

html_dir::Chado::Result::Phylonode

=head1 DESCRIPTION

This is the most pervasive
       element in the phylogeny module, cataloging the "phylonodes" of
       tree graphs. Edges are implied by the parent_phylonode_id
       reflexive closure. For all nodes in a nested set implementation the left and right index will be *between* the parents left and right indexes.

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

=head1 TABLE: C<phylonode>

=cut

__PACKAGE__->table("phylonode");

=head1 ACCESSORS

=head2 phylonode_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'phylonode_phylonode_id_seq'

=head2 phylotree_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 parent_phylonode_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 1

Root phylonode can have null parent_phylonode_id value.

=head2 left_idx

  data_type: 'integer'
  is_nullable: 0

=head2 right_idx

  data_type: 'integer'
  is_nullable: 0

=head2 type_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 1

Type: e.g. root, interior, leaf.

=head2 feature_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 1

Phylonodes can have optional features attached to them e.g. a protein or nucleotide sequence usually attached to a leaf of the phylotree for non-leaf nodes, the feature may be a feature that is an instance of SO:match; this feature is the alignment of all leaf features beneath it.

=head2 label

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 distance

  data_type: 'double precision'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "phylonode_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "phylonode_phylonode_id_seq",
  },
  "phylotree_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "parent_phylonode_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 1 },
  "left_idx",
  { data_type => "integer", is_nullable => 0 },
  "right_idx",
  { data_type => "integer", is_nullable => 0 },
  "type_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 1 },
  "feature_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 1 },
  "label",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "distance",
  { data_type => "double precision", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</phylonode_id>

=back

=cut

__PACKAGE__->set_primary_key("phylonode_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<phylonode_phylotree_id_key>

=over 4

=item * L</phylotree_id>

=item * L</left_idx>

=back

=cut

__PACKAGE__->add_unique_constraint("phylonode_phylotree_id_key", ["phylotree_id", "left_idx"]);

=head2 C<phylonode_phylotree_id_key1>

=over 4

=item * L</phylotree_id>

=item * L</right_idx>

=back

=cut

__PACKAGE__->add_unique_constraint("phylonode_phylotree_id_key1", ["phylotree_id", "right_idx"]);

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<html_dir::Chado::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "html_dir::Chado::Result::Feature",
  { feature_id => "feature_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=head2 parent_phylonode

Type: belongs_to

Related object: L<html_dir::Chado::Result::Phylonode>

=cut

__PACKAGE__->belongs_to(
  "parent_phylonode",
  "html_dir::Chado::Result::Phylonode",
  { phylonode_id => "parent_phylonode_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);

=head2 phylonode_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::PhylonodeDbxref>

=cut

__PACKAGE__->has_many(
  "phylonode_dbxrefs",
  "html_dir::Chado::Result::PhylonodeDbxref",
  { "foreign.phylonode_id" => "self.phylonode_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylonode_organism

Type: might_have

Related object: L<html_dir::Chado::Result::PhylonodeOrganism>

=cut

__PACKAGE__->might_have(
  "phylonode_organism",
  "html_dir::Chado::Result::PhylonodeOrganism",
  { "foreign.phylonode_id" => "self.phylonode_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylonode_pubs

Type: has_many

Related object: L<html_dir::Chado::Result::PhylonodePub>

=cut

__PACKAGE__->has_many(
  "phylonode_pubs",
  "html_dir::Chado::Result::PhylonodePub",
  { "foreign.phylonode_id" => "self.phylonode_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylonode_relationship_objects

Type: has_many

Related object: L<html_dir::Chado::Result::PhylonodeRelationship>

=cut

__PACKAGE__->has_many(
  "phylonode_relationship_objects",
  "html_dir::Chado::Result::PhylonodeRelationship",
  { "foreign.object_id" => "self.phylonode_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylonode_relationship_subjects

Type: has_many

Related object: L<html_dir::Chado::Result::PhylonodeRelationship>

=cut

__PACKAGE__->has_many(
  "phylonode_relationship_subjects",
  "html_dir::Chado::Result::PhylonodeRelationship",
  { "foreign.subject_id" => "self.phylonode_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylonodeprops

Type: has_many

Related object: L<html_dir::Chado::Result::Phylonodeprop>

=cut

__PACKAGE__->has_many(
  "phylonodeprops",
  "html_dir::Chado::Result::Phylonodeprop",
  { "foreign.phylonode_id" => "self.phylonode_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylonodes

Type: has_many

Related object: L<html_dir::Chado::Result::Phylonode>

=cut

__PACKAGE__->has_many(
  "phylonodes",
  "html_dir::Chado::Result::Phylonode",
  { "foreign.parent_phylonode_id" => "self.phylonode_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylotree

Type: belongs_to

Related object: L<html_dir::Chado::Result::Phylotree>

=cut

__PACKAGE__->belongs_to(
  "phylotree",
  "html_dir::Chado::Result::Phylotree",
  { phylotree_id => "phylotree_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 type

Type: belongs_to

Related object: L<html_dir::Chado::Result::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "html_dir::Chado::Result::Cvterm",
  { cvterm_id => "type_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-09-08 16:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uQnXmkSMVSr7pNfabQxe3Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
