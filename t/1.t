# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 19;
BEGIN { use_ok('Image::LibRSVG') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $rsvg = new Image::LibRSVG();

ok( defined $rsvg );

## convert
ok( $rsvg->convert( "examples/artscontrol.svg", "examples/test.png" ) );
ok( ! $rsvg->convert( "examples/artscontrol.sv", "examples/test.png" ) );

## convertAtZoom
ok( $rsvg->convertAtZoom( "examples/artscontrol.svg", "examples/test.png", 1.5, 1.5 ) );
ok( ! $rsvg->convertAtZoom( "examples/artscontrol.sv", "examples/test.png", 1.5, 1.5 ) );

## convertAtMaxSize
ok( $rsvg->convertAtMaxSize( "examples/artscontrol.svg", "examples/test.png", 200, 300 ) );
ok( ! $rsvg->convertAtMaxSize( "examples/artscontrol.sv", "examples/test.png", 200, 300 ) );

## convertAtSize
ok( $rsvg->convertAtSize( "examples/artscontrol.svg", "examples/test.png", 200, 300 ) );
ok( ! $rsvg->convertAtSize( "examples/artscontrol.sv", "examples/test.png", 200, 300 ) );

## convertAtZoomWithMax
ok( $rsvg->convertAtZoomWithMax( "examples/artscontrol.svg", "examples/test.png", 1.5, 1.5, 200, 300 ) );
ok( ! $rsvg->convertAtZoomWithMax( "examples/artscontrol.sv", "examples/test.png", 1.5, 1.5, 200, 300 ) );

## loading & saving
ok( $rsvg->loadImage( "examples/artscontrol.svg" ) );
ok( $rsvg->saveAs( "examples/test.png" ) );

ok( ! $rsvg->loadImage( "examples/artscontrol.sv" ) );
ok( ! $rsvg->saveAs( "examples/test.png" ) );

## formats
ok( ref( Image::LibRSVG->getKnownFormats() ) eq "ARRAY" );
ok( ref( Image::LibRSVG->getSupportedFormats() ) eq "ARRAY" );
ok( Image::LibRSVG->isFormatSupported("png") );