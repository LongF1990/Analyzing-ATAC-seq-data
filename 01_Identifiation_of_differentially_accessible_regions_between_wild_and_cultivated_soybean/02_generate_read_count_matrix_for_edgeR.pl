#! usr/bin/perl -w
%hash1=();
open(F1,$ARGV[0]) or die "$!";
while(my $line=<F1>){
			chomp $line;
			@arr=split/\t/,$line;
			$hash1{$arr[0]."\t".$arr[1]."\t".$arr[2]}=$arr[3];
}
close F1;
%hash2=();
open(F1,$ARGV[1]) or die "$!";
while(my $line=<F1>){
			chomp $line;
			@arr=split/\t/,$line;
			$hash2{$arr[0]."\t".$arr[1]."\t".$arr[2]}=$arr[3];
}
close F1;
%hash3=();
open(F1,$ARGV[2]) or die "$!";
while(my $line=<F1>){
			chomp $line;
			@arr=split/\t/,$line;
			$hash3{$arr[0]."\t".$arr[1]."\t".$arr[2]}=$arr[3];
}
close F1;
%hash4=();
open(F1,$ARGV[3]) or die "$!";
while(my $line=<F1>){
			chomp $line;
			@arr=split/\t/,$line;
			$hash4{$arr[0]."\t".$arr[1]."\t".$arr[2]}=$arr[3];
}
close F1;
%hash5=();
open(F1,$ARGV[4]) or die "$!";
while(my $line=<F1>){
			chomp $line;
			@arr=split/\t/,$line;
			$hash5{$arr[0]."\t".$arr[1]."\t".$arr[2]}=$arr[3];
}
close F1;

open(OUT,">W82_W05_matrix.txt") or die "$!";
print OUT "Gene","\t","W82R1","\t","W82R2","\t","W82R3","\t","W05R1","\t","W05R2","\t","W05R3","\n";
open(F1,$ARGV[5]) or die "$!";
while(my $line=<F1>){
			chomp $line;
			@arr=split/\t/,$line;
			$key=$arr[0]."\t".$arr[1]."\t".$arr[2];
			print OUT $arr[0].":".$arr[1]."-".$arr[2],"\t",$hash1{$key},"\t",$hash2{$key},"\t",$hash3{$key},"\t",$hash4{$key},"\t",$hash5{$key},"\t",$arr[3],"\n";
}
close F1;
close OUT;
