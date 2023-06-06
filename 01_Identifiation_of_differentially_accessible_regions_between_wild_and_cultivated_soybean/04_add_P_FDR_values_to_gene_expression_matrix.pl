#! usr/bin/perl -w
@name=split/\./,$ARGV[1];
open(OUT,">$name[0]_add_P_FDR.txt") or die "$!";
#p_fdr.txt
%hash=();
open(F1,$ARGV[0]) or die "$!";
while(my $line=<F1>){
			chomp $line;
			if($line!~/FDR/){
					@arr=split/\t/,$line;
					@id=split/\"/,$arr[0];
					$hash{$id[1]}=$arr[-2]."\t".$arr[-1];
					}
}
close F1;
#matrix
open(F1,$ARGV[1]) or die "$!";
while(my $line=<F1>){
			chomp $line;
			if($line=~/Gene/){print OUT $line,"\t","P_value","\t","FDR","\n";}
			else{
				@arr=split/\t/,$line;
				print OUT $line,"\t",$hash{$arr[0]},"\n";
				}
}
close F1;
close OUT;
