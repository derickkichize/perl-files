#!/usr/bin/env perl

use warnings;
use strict;

sub perl_write_file {
    my $file_name = shift; #Recebe o nome do arquivo como argumento

    open(my $file_handle, '>', $file_name)
	or die "Error while opening a file";

    print $file_handle "Olá mundo!\n";
    
    close ($file_handle)
	or die "Not possible to close a file";
}

sub perl_read_file {
    my $file_name = shift;

    open(my $file_handle, '<', $file_name)
	or die "Error while opening a file";

    my $file_content = do { local $/; <$file_handle> };

    close ($file_handle)
	or die "Not possible to close a file";

    return $file_content;
}

# Não está expandindo!
sub perl_append_file {
    my $file_name = shift;

    open(my $file_handle, '>>', $file_name)
    	or die "Error while opening a file";

    print $file_handle "proxima linha\n";
    
    close ($file_handle)
	or die "Not possible to close a file";
}


if ($0 eq __FILE__) {
    my $file_name = "arquivo.txt";
    
    perl_write_file($file_name);
    perl_append_file($file_name);

    my $content = perl_read_file ($file_name);
    print $content;
}
