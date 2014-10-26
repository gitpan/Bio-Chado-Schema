package Bio::Chado::Schema;
BEGIN {
  $Bio::Chado::Schema::AUTHORITY = 'cpan:RBUELS';
}
BEGIN {
  $Bio::Chado::Schema::VERSION = '0.08200';
}

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-16 23:09:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JJ2AbsZoAN4cnM4vrYOxKA

use Bio::Chado::Schema::Util;


{
    my @after_load;
    $_->() for @after_load; #< note that this executes after load_classes above

    sub plugin_add_relationship {
        my ( $class, $target_moniker, $reltype, @args ) = @_;

        push @after_load, sub {
            no strict 'refs';
            my $target_class = $class->class( $target_moniker );
            $target_class->$reltype( @args );
            __PACKAGE__->register_class( $target_moniker => $target_class );
        };
    }
}


1;

__END__
=pod

=encoding utf-8

=head1 NAME

Bio::Chado::Schema

=head1 SYNOPSIS

  use Bio::Chado::Schema;

  my $chado = Bio::Chado::Schema->connect( $dsn, $user, $password );

  print "number of rows in feature table: ",
        $chado->resultset('Sequence::Feature')->count,
        "\n";

=head1 DESCRIPTION

This is a standard object-relational mapping layer for use with the
GMOD Chado database schema.  This layer is implemented with
L<DBIx::Class>, generated with the help of the very fine
L<DBIx::Class::Schema::Loader> module.

Chado is an open-source modular database schema for biological data.
It is divided into several notional "modules", which are reflected in
the namespace organization of this package.  Note that modules in the
Chado context refers to sets of tables, they are not modules in the
Perl sense.

To learn how to use this DBIx::Class ORM layer, a good starting
point is the L<DBIx::Class::Manual>.

=head1 NAME

Bio::Chado::Schema - A standard DBIx::Class layer for the Chado database schema.

=head1 CHADO MODULES COVERED BY THIS PACKAGE

L<Bio::Chado::Schema::CellLine>

L<Bio::Chado::Schema::Companalysis>

L<Bio::Chado::Schema::Composite>

L<Bio::Chado::Schema::Contact>

L<Bio::Chado::Schema::Cv>

L<Bio::Chado::Schema::Expression>

L<Bio::Chado::Schema::General>

L<Bio::Chado::Schema::Genetic>

L<Bio::Chado::Schema::Library>

L<Bio::Chado::Schema::Mage>

L<Bio::Chado::Schema::Map>

L<Bio::Chado::Schema::NaturalDiversity>

L<Bio::Chado::Schema::Organism>

L<Bio::Chado::Schema::Phenotype>

L<Bio::Chado::Schema::Phylogeny>

L<Bio::Chado::Schema::Project>

L<Bio::Chado::Schema::Pub>

L<Bio::Chado::Schema::Sequence>

L<Bio::Chado::Schema::Stock>

=head1 CLASS METHODS

=head2 plugin_add_relationship( 'ChadoModule::SourceName', 'reltype', @args )

Sometimes application-specific plugins need to add relationships to
the core BCS classes.  It can't just be done normally from inside the
classes of the plugins, you need to use this method.

Example: Bio::Chado::Schema::Result::MyApp::SpecialThing belongs_to
the core BCS Organism::Organism, and you would like to be able to call
C<$organism-E<gt>myapp_specialthings> on organisms to get their
associated SpecialThings.

    package Bio::Chado::Schema::MyApp::Result::SpecialThing;

    # ( do table and column definitions and so forth here )

    Bio::Chado::Schema->plugin_add_relationship(
        'Organism::Organism', 'has_many', (
            "myapp_specialthings",
            "Bio::Chado::Schema::MyApp::Result::Foo",
            { "foreign.organism_id" => "self.organism_id" },
            { cascade_copy => 0, cascade_delete => 0 },
        );
    );

=head1 AUTHOR

Robert Buels, <rmb32@cornell.edu>

=head1 CONTRIBUTORS

Aureliano Bombarely, <ab782@cornell.edu>

Naama Menda, <nm249@cornell.edu>

Jonathan "Duke" Leto, <jonathan@leto.net>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Boyce Thompson Institute for Plant Research

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Robert Buels <rbuels@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Robert Buels.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

