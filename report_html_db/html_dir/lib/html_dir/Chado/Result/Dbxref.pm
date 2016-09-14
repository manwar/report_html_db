use utf8;
package html_dir::Chado::Result::Dbxref;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

html_dir::Chado::Result::Dbxref

=head1 DESCRIPTION

A unique, global, public, stable identifier. Not necessarily an external reference - can reference data items inside the particular chado instance being used. Typically a row in a table can be uniquely identified with a primary identifier (called dbxref_id); a table may also have secondary identifiers (in a linking table <T>_dbxref). A dbxref is generally written as <DB>:<ACCESSION> or as <DB>:<ACCESSION>:<VERSION>.

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

=head1 TABLE: C<dbxref>

=cut

__PACKAGE__->table("dbxref");

=head1 ACCESSORS

=head2 dbxref_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'dbxref_dbxref_id_seq'

=head2 db_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 accession

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

The local part of the identifier. Guaranteed by the db authority to be unique for that db.

=head2 version

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "dbxref_id",
  {
    data_type         => "bigint",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "dbxref_dbxref_id_seq",
  },
  "db_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "accession",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "version",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "description",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</dbxref_id>

=back

=cut

__PACKAGE__->set_primary_key("dbxref_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<dbxref_c1>

=over 4

=item * L</db_id>

=item * L</accession>

=item * L</version>

=back

=cut

__PACKAGE__->add_unique_constraint("dbxref_c1", ["db_id", "accession", "version"]);

=head1 RELATIONS

=head2 analysis_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::AnalysisDbxref>

=cut

__PACKAGE__->has_many(
  "analysis_dbxrefs",
  "html_dir::Chado::Result::AnalysisDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 arraydesigns

Type: has_many

Related object: L<html_dir::Chado::Result::Arraydesign>

=cut

__PACKAGE__->has_many(
  "arraydesigns",
  "html_dir::Chado::Result::Arraydesign",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 assays

Type: has_many

Related object: L<html_dir::Chado::Result::Assay>

=cut

__PACKAGE__->has_many(
  "assays",
  "html_dir::Chado::Result::Assay",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 biomaterial_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::BiomaterialDbxref>

=cut

__PACKAGE__->has_many(
  "biomaterial_dbxrefs",
  "html_dir::Chado::Result::BiomaterialDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 biomaterials

Type: has_many

Related object: L<html_dir::Chado::Result::Biomaterial>

=cut

__PACKAGE__->has_many(
  "biomaterials",
  "html_dir::Chado::Result::Biomaterial",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::CellLineDbxref>

=cut

__PACKAGE__->has_many(
  "cell_line_dbxrefs",
  "html_dir::Chado::Result::CellLineDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cvterm

Type: might_have

Related object: L<html_dir::Chado::Result::Cvterm>

=cut

__PACKAGE__->might_have(
  "cvterm",
  "html_dir::Chado::Result::Cvterm",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cvterm_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::CvtermDbxref>

=cut

__PACKAGE__->has_many(
  "cvterm_dbxrefs",
  "html_dir::Chado::Result::CvtermDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 db

Type: belongs_to

Related object: L<html_dir::Chado::Result::Db>

=cut

__PACKAGE__->belongs_to(
  "db",
  "html_dir::Chado::Result::Db",
  { db_id => "db_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 dbxrefprops

Type: has_many

Related object: L<html_dir::Chado::Result::Dbxrefprop>

=cut

__PACKAGE__->has_many(
  "dbxrefprops",
  "html_dir::Chado::Result::Dbxrefprop",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 elements

Type: has_many

Related object: L<html_dir::Chado::Result::Element>

=cut

__PACKAGE__->has_many(
  "elements",
  "html_dir::Chado::Result::Element",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_cvterm_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::FeatureCvtermDbxref>

=cut

__PACKAGE__->has_many(
  "feature_cvterm_dbxrefs",
  "html_dir::Chado::Result::FeatureCvtermDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::FeatureDbxref>

=cut

__PACKAGE__->has_many(
  "feature_dbxrefs",
  "html_dir::Chado::Result::FeatureDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featuremap_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::FeaturemapDbxref>

=cut

__PACKAGE__->has_many(
  "featuremap_dbxrefs",
  "html_dir::Chado::Result::FeaturemapDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 features

Type: has_many

Related object: L<html_dir::Chado::Result::Feature>

=cut

__PACKAGE__->has_many(
  "features",
  "html_dir::Chado::Result::Feature",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::LibraryDbxref>

=cut

__PACKAGE__->has_many(
  "library_dbxrefs",
  "html_dir::Chado::Result::LibraryDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::NdExperimentDbxref>

=cut

__PACKAGE__->has_many(
  "nd_experiment_dbxrefs",
  "html_dir::Chado::Result::NdExperimentDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 nd_experiment_stock_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::NdExperimentStockDbxref>

=cut

__PACKAGE__->has_many(
  "nd_experiment_stock_dbxrefs",
  "html_dir::Chado::Result::NdExperimentStockDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 organism_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::OrganismDbxref>

=cut

__PACKAGE__->has_many(
  "organism_dbxrefs",
  "html_dir::Chado::Result::OrganismDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylonode_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::PhylonodeDbxref>

=cut

__PACKAGE__->has_many(
  "phylonode_dbxrefs",
  "html_dir::Chado::Result::PhylonodeDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylotrees

Type: has_many

Related object: L<html_dir::Chado::Result::Phylotree>

=cut

__PACKAGE__->has_many(
  "phylotrees",
  "html_dir::Chado::Result::Phylotree",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 project_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::ProjectDbxref>

=cut

__PACKAGE__->has_many(
  "project_dbxrefs",
  "html_dir::Chado::Result::ProjectDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 protocols

Type: has_many

Related object: L<html_dir::Chado::Result::Protocol>

=cut

__PACKAGE__->has_many(
  "protocols",
  "html_dir::Chado::Result::Protocol",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 pub_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::PubDbxref>

=cut

__PACKAGE__->has_many(
  "pub_dbxrefs",
  "html_dir::Chado::Result::PubDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_dbxrefs

Type: has_many

Related object: L<html_dir::Chado::Result::StockDbxref>

=cut

__PACKAGE__->has_many(
  "stock_dbxrefs",
  "html_dir::Chado::Result::StockDbxref",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stocks

Type: has_many

Related object: L<html_dir::Chado::Result::Stock>

=cut

__PACKAGE__->has_many(
  "stocks",
  "html_dir::Chado::Result::Stock",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 studies

Type: has_many

Related object: L<html_dir::Chado::Result::Study>

=cut

__PACKAGE__->has_many(
  "studies",
  "html_dir::Chado::Result::Study",
  { "foreign.dbxref_id" => "self.dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-09-08 16:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A4XCRT4Si14lxLBxaJeQ7Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
