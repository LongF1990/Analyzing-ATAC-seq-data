#! usr/bin/perl -w

open(OUT,">W05_ATAC.wig") or die "$!";
print OUT "track type=wiggle_0"," ","name=W05_ATAC","\n";
#Tn5 binding sites
open(F1,$ARGV[0]) or die "$!";
%hash=();
while(my $line=<F1>){
	chomp $line;
	@arr=split/\t/,$line;
	$hash{$arr[0]."\t".$arr[1]}+=1;
	}
close F1;
#soybean_T2T_genome_assembly.fa_length.txt -- chromosome length
open(F1,$ARGV[1]) or die "$!";
while(my $line=<F1>){
	chomp $line;
	@arr=split/\t/,$line;
	print OUT "variableStep"," ","chrom=",$arr[0],"\n";
	$pos=1;
	while($pos<=$arr[1]){
			if(exists($hash{$arr[0]."\t".$pos})){print OUT $pos,"\t",$hash{$arr[0]."\t".$pos},"\n";}
			$pos+=1;
			}
}
close F1;close OUT;
