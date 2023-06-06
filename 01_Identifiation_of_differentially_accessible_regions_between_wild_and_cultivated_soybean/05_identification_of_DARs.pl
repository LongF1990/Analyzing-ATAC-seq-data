#! usr/bin/perl -w
@name=split/\./,$ARGV[0];
open(OUT,">$name[0]_DE_regions.txt") or die "$!";

open(F1,$ARGV[0]) or die "$!";
while(my $line=<F1>){
	chomp $line;
	if($line!~/Gene/){
	@arr=split/\t/,$line;
	$cpm1=$arr[1]/496786872*1000000;
	$cpm2=$arr[2]/516450052*1000000;
	$cpm3=$arr[3]/321680044*1000000;
	$cpm4=$arr[4]/238358310*1000000;
	$cpm5=$arr[5]/390526808*1000000;
	$cpm6=$arr[6]/201216098*1000000;
	$sum1=$cpm1+$cpm2+$cpm3;
	$sum2=$cpm4+$cpm5+$cpm6;
	if($sum1==0){$sum1=0.001;}
	if($sum2==0){$sum2=0.001;}
	$raito=log($sum1/$sum2)/log(2);
	if($arr[-1]<0.01 && $arr[-2]<0.01 && ($raito>=1 || $raito<=-1)){print OUT $arr[0],"\t",$cpm1,"\t",$cpm2,"\t",$cpm3,"\t",$cpm4,"\t",$cpm5,"\t",$cpm6,"\t",$raito,"\t",$arr[-2],"\t",$arr[-1],"\n";}
}
}
close OUT;
