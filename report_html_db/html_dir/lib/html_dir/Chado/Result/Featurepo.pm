use utf8;
package html_dir::Chado::Result::Featurepo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

html_dir::Chado::Result::Featurepo

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

=head1 TABLE: C<featurepos>

=cut

__PACKAGE__->table("featurepos");

=head1 ACCESSORS

=head2 featurepos_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'featurepos_featurepos_id_seq'

=head2 featuremap_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0
  sequence: 'featurepos_featuremap_id_seq'

=head2 feature_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 map_feature_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

map_feature_id
links to the feature (map) upon which the feature is being localized.

=head2 mappos

  data_type: 'double precision'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "featurepos_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "featurepos_featurepos_id_seq",
  },
  "featuremap_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
    sequence          => "featurepos_featuremap_id_seq",
  },
  "feature_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "map_feature_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "mappos",
  { data_type => "double precision", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</featurepos_id>

=back

=cut

__PACKAGE__->set_primary_key("featurepos_id");

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<html_dir::Chado::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "html_dir::Chado::Result::Feature",
  { feature_id => "feature_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 featuremap

Type: belongs_to

Related object: L<html_dir::Chado::Result::Featuremap>

=cut

__PACKAGE__->belongs_to(
  "featuremap",
  "html_dir::Chado::Result::Featuremap",
  { featuremap_id => "featuremap_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 featureposprops

Type: has_many

Related object: L<html_dir::Chado::Result::Featureposprop>

=cut

__PACKAGE__->has_many(
  "featureposprops",
  "html_dir::Chado::Result::Featureposprop",
  { "foreign.featurepos_id" => "self.featurepos_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 map_feature

Type: belongs_to

Related object: L<html_dir::Chado::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "map_feature",
  "html_dir::Chado::Result::Feature",
  { feature_id => "map_feature_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-09-08 16:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/z/Mntu6hvkJLwqT2CGpoA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
