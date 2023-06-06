#! usr/bin/perl -w
@name=split/\./,$ARGV[1];
open(OUT,">$name[0]_footprints_specific.bed") or die "$!";
#Gm01	101341	101366	Unnamed100124	-62.70012283325195	+
open(F1,$ARGV[0]) or die "$!";
%hash=();
while(my $line=<F1>){
	chomp $line;
	@arr=split/\t/,$line;
	$pos=$arr[1]+1;
	while($pos<=$arr[2]){
			$hash{$arr[0]."\t".$pos}=1;
			$pos+=1;
			}
	}
close F1;
#Gm01	101340	101365	Unnamed107608	-54.12645721435547	+
open(F1,$ARGV[1]) or die "$!";
while(my $line=<F1>){
	chomp $line;
	@arr=split/\t/,$line;
	$sum=0;
	$pos=$arr[1]+1;
	while($pos<=$arr[2]){
			if(exists($hash{$arr[0]."\t".$pos})){$sum+=1;}
			$pos+=1;
			}
	$ratio=$sum/($arr[2]-$arr[1]);
	if($ratio<=0.2){print OUT $line,"\n";}
}
close F1;
close OUT;
