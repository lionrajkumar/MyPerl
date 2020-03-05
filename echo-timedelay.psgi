#!/usr/bin/perl
use strict;
use warnings;
 
use Plack::Request;
 
my $app = sub {
    my $env = shift;
    my $html = get_html();
    my $request = Plack::Request->new($env);
    if ($request->param('field')) {
        #$html .= 'You said: ' . $request->param('field');
		$html .= 'Start: ' . time . '<br>';
        sleep 2;
        $html .= 'You said: ' . $request->param('field') . '<br>';
        $html .= 'End: ' . time . '<br>';
    }
    return [
        '200',
        [ 'Content-Type' => 'text/html' ],
        [ $html ],
    ];
}; 
 
sub get_html {
    return q{
        <form>
        <input name="field">
        <input type="submit" value="Echo">
        </form>
        <hr>
    }
}