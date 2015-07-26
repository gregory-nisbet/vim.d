#!/usr/bin/env perl
use strict;
use warnings FATAL => 'all';
use autodie;
use Digest::file qw[digest_file_hex];
use File::Spec;
use Digest::SHA qw[sha256_hex];
use Data::Dumper;
use feature qw[say];

=begin
Compute the sha-256 (hex encoded) of a single file, and die if it matches the ignored files regex
=cut

sub sha256_file {
    @_ == 2 or die;
    my ($path, $options_r) = @_;
    die "this item should not have been considered" if exists $options_r->{ignore} and $path =~ $options_r->{ignore};
    return digest_file_hex($path, "SHA-256");
}

=begin
Recurse over items in a directory, computing the sha256 of each.
The sha256 of a directory is defined as the sha256 of interleaved pairs
of file or directory names and sha256 values.
the contents of the directory are sorted without regard for whether they are
files or directories.
Information such as permissions and date last modified is intentionally left out.
=cut

sub sha256_directory {
    @_ == 2 or die;
    my ($path, $options_r) = @_;
    opendir(my $dir, $path);
    my @items;
    my @dirs = sort readdir($dir);
    for my $name (@dirs) {
        $name eq "." and next;
        $name eq ".." and next;
        my $item_path = File::Spec->catfile($path, $name);
        # ignore some items.
        next if exists $options_r->{ignore} and $name =~ $options_r->{ignore};
        push @items, $name, sha256_generic($item_path, $options_r);
    }
    return sha256_hex(join q[], @items);
}

=begin
Determine whether a path points to a file or directory,
and take the appropraite action.
=cut

sub sha256_generic {
    @_ == 2 or die;
    my ($path, $options_r) = @_;
    die unless (-e $path);
    if (-d $path) {
        sha256_directory(@_);
    } else {
        sha256_file(@_);
    }
}

=begin
strip the .git folder and the .gitignore from a directory or file
gt the sha256 as a hex string
=cut

sub sha256_ignoring_git {
    @_ == 1 or die;
    my $git_r = qr[\.git];
    return sha256_generic($_[0], {ignore => $git_r});
}
