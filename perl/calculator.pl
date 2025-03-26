#!/usr/bin/perl
use strict;
use warnings;

my %variables;  # Değişkenleri saklamak için hash

while (1) {
    print "Enter expression (or 'exit' to quit): ";
    my $input = <STDIN>;
    chomp $input;

    last if $input eq 'exit';

    if ($input =~ /^\s*([a-zA-Z_]\w*)\s*=\s*(.+)$/) {  
        # Değişken atama işlemi
        my $var = $1;
        my $expr = $2;
        my $result = evaluate($expr);
        if ($result =~ /^Error:/) {
            print "$result\n";
        } else {
            $variables{$var} = $result;
            print "[Assignment] $var = $variables{$var}\n";
        }
    } else {
        # Direkt matematiksel ifade değerlendirme
        print "[Result] " . evaluate($input) . "\n";
    }
}

sub evaluate {
    my ($expr) = @_;

    # Değişkenleri sayılarla değiştir
    $expr =~ s/\b([a-zA-Z_]\w*)\b/exists $variables{$1} ? $variables{$1} : "[Error] Undefined variable: $1"/eg;

    # Eğer değişkenlerden biri hata mesajı içeriyorsa işlemi iptal et
    return $expr if $expr =~ /\[Error\]/;

    # Sıfıra bölme kontrolü
    if ($expr =~ /\/\s*0\b/) {
        return "[Error] Division by zero is not allowed!";
    }

    # Matematiksel ifadeyi değerlendir
    my $result = eval "$expr";

    if ($@) {
        return "[Error] Invalid expression: $expr";
    }

    return defined $result ? $result : "[Error] Unknown evaluation error!";
}
