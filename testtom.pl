use ExtUtils::testlib;

use Image::LibRSVG;

my $rsvg = new Image::LibRSVG();

open( FILE, "< examples/artscontrol.svg" );
my $content = join "", <FILE>;
#print $content;
close( FILE );

$rsvg->loadImage( "examples/artscontrol.svg" );
$rsvg->getImageBitmap();
