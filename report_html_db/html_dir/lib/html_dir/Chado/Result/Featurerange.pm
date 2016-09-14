use utf8;
package html_dir::Chado::Result::Featurerange;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

html_dir::Chado::Result::Featurerange

=head1 DESCRIPTION

In cases where the start and end of a mapped feature is a range, leftendf and rightstartf are populated. leftstartf_id, leftendf_id, rightstartf_id, rightendf_id are the ids of features with respect to which the feature is being mapped. These may be cytological bands.

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

=head1 TABLE: C<featurerange>

=cut

__PACKAGE__->table("featurerange");

=head1 ACCESSORS

=head2 featurerange_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'featurerange_featurerange_id_seq'

=head2 featuremap_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

featuremap_id is the id of the feature being mapped.

=head2 feature_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 leftstartf_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 leftendf_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 1

=head2 rightstartf_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 1

=head2 rightendf_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 rangestr

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "featurerange_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "featurerange_featurerange_id_seq",
  },
  "featuremap_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "feature_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "leftstartf_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "leftendf_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 1 },
  "rightstartf_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 1 },
  "rightendf_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "rangestr",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</featurerange_id>

=back

=cut

__PACKAGE__->set_primary_key("featurerange_id");

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

=head2 leftendf

Type: belongs_to

Related object: L<html_dir::Chado::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "leftendf",
  "html_dir::Chado::Result::Feature",
  { feature_id => "leftendf_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

=head2 leftstartf

Type: belongs_to

Related object: L<html_dir::Chado::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "leftstartf",
  "html_dir::Chado::Result::Feature",
  { feature_id => "leftstartf_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 rightendf

Type: belongs_to

Related object: L<html_dir::Chado::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "rightendf",
  "html_dir::Chado::Result::Feature",
  { feature_id => "rightendf_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 rightstartf

Type: belongs_to

Related object: L<html_dir::Chado::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "rightstartf",
  "html_dir::Chado::Result::Feature",
  { feature_id => "rightstartf_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-09-08 16:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+64KwI8mVJX+YBmi7r7sfA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
