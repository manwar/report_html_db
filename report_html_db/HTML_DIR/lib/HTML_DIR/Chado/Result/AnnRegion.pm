use utf8;
package HTML_DIR::Chado::Result::AnnRegion;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

HTML_DIR::Chado::Result::AnnRegion

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

=head1 TABLE: C<ann_region>

=cut

__PACKAGE__->table("ann_region");

=head1 ACCESSORS

=head2 cvterm_id

  data_type: 'bigint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns("cvterm_id", { data_type => "bigint", is_nullable => 1 });


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-10-13 15:50:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/u6/9Ck3NGPz8jBUiMhmKw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
