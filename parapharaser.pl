#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use WWW::Google::Translate;


my $USAGE = <<'END_USE';
translate.pl --(translate|detect|languages) --key <key> --target <lang> --source <lang> --q <text>
END_USE

my ( $key, $method, $source, $target, $q ) = ("") x 5;

my @arr = ();
push(@arr, 'fr');
push(@arr, 'da');
push(@arr, 'ja');
push(@arr, 'nl');
push(@arr, 'ru');
push(@arr, 'en');

$key = 'AIzaSyAku8jAZ6DfT2FS0G5fuI7hDm_-geXh1ug';
$method = 'translate';
$q = <STDIN>;
chomp $q;
$source = 'en';
print "\n","\n";

my $i = 0;
my $r;

while($i lt 6){
	
	$target = $arr[$i];
	
	my $gt = WWW::Google::Translate->new(
		{   key            => $key,
			default_source => ( $source || 'en' ),
			default_target => ( $target || 'ja' ),
		}
	);

	$r = $gt->translate( { q => $q } );
	
	for my $trans_rh (@{ $r->{data}->{translations} })
	{
		$q = $trans_rh->{translatedText};
	}
	
	$source = $target;
	$i = $i + 1;
}


print $q,"\n";
__END__
