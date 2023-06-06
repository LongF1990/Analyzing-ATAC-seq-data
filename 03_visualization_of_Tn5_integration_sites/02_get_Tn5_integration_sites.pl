#! usr/bin/perl -w
@name=split/\./,$ARGV[0];
open(OUT,">$name[0]_Tn5_binding_sites.txt") or die "$!";
# all reads aligning to the + strand were offset by +4 bps, and all reads aligning tothe – strand were offset −5 bps
open(F1,$ARGV[0]) or die "$!";
while(my $line=<F1>){
chomp $line;
@arr=split/\t/,$line;
if ($arr[5] eq "+"){print OUT $arr[0],"\t",$arr[1]+1+4,"\n";} #bed file, 0 base
if ($arr[5] eq "-"){print OUT $arr[0],"\t",$arr[2]-5,"\n";}
}
close F1;
close OUT;
