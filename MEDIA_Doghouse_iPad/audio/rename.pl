#!/usr/local/bin/perl
#
# Usage: rename perlexpr [files]

#($regexp = shift @ARGV) || die "Usage:  rename perlexpr [filenames]\n";


if (!@ARGV) {
   @ARGV = <STDIN>;
   chomp(@ARGV);

}



foreach $_ (@ARGV) {
   $old_name = $_;
   $new_name = "ipad_" . $old_name;
   print "New Name: $new_name \n"; 
   
   rename($old_name, $new_name);
}

exit(0);
