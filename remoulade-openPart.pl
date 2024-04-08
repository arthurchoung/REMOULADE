#!/usr/bin/perl

$path = shift @ARGV;
$part = shift @ARGV;
$mimeType = shift @ARGV;

if (not $path or not $part or not $mimeType) {
    die('no path, part or mimeType');
}

$str = "path $path part $part mimeType $mimeType";
if ($mimeType eq 'text/plain') {
    system("remoulade-extractPart $path $part >/tmp/remoulade.txt");
    system("chromium /tmp/remoulade.txt");
} elsif ($mimeType eq 'text/html') {
    system("remoulade-extractPart $path $part >/tmp/remoulade.html");
    system("chromium /tmp/remoulade.html");
} elsif ($mimeType eq 'application/pdf') {
    system("remoulade-extractPart $path $part >/tmp/remoulade.pdf");
    system("mupdf /tmp/remoulade.pdf");
} elsif ($mimeType eq 'image/png') {
    system("remoulade-extractPart $path $part >/tmp/remoulade.png");
    system("chromium /tmp/remoulade.png");
} else {
    system("remoulade", "showAlert:", "$path $part $mimeType");
}

