package website::Model::Basic;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'website::Basic',
    
    connect_info => {
        dsn => 'dbi:SQLite:/home/wendelhlc/git/report_html_db/report_html_db/test3/website/database.db',
        user => '',
        password => '',
        on_connect_do => q{PRAGMA foreign_keys = ON;PRAGMA encoding='UTF-8'},
    }
);

=head1 NAME

website::Model::Basic - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<website>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<website::Basic>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.65

=head1 AUTHOR

Wendel Hime L. Castro

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
