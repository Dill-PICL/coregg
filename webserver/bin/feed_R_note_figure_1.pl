if(@ARGV!=7)
{
	print "perl $0 <input_file_TPM> <which col of TPM> <pre-defined_gene_group> <sample/tissue_name> <upload_data_dir> <bin_dir> <housekeeping file>\n";
	exit;
}
$dir=$ARGV[4];
$bin_dir=$ARGV[5];
#open HOUSEKEEPING,"$bin_dir/Annotation/maize_house_keeping_gene_rnaseq" or die;
open HOUSEKEEPING,"$dir/$ARGV[6]" or die;
while(<HOUSEKEEPING>)
{
	chomp;
	@a=split /\s+/,$_;
	$hk{$a[0]}=1;#print "HSP\t$a[0]\n";
}
$col=$ARGV[1];
open IN,"$ARGV[2]" or die;
while(<IN>)
{
	chomp;
	@a=split /,/,$_;
#gene_1,house keeping genes
#gene_2,xxx
#gene_3,xxx
#gene_4,xxx
	$pre_defined{$a[0]}=$a[1];
	$group{$a[1]}=1;
}
open IN,"$ARGV[0]" or die;
while(<IN>)
{
	@a=split /\s+/,$_;
	$sum+=$a[$col];
}
$sum=int($sum);
print "$sum\n";
if($sum>999998 && $sum<1000002)
{
open FPKM,"$ARGV[0]" or die;
while(<FPKM>)
{
	chomp;
	unless(/^#/ or /^Gene/)
	{
	@a=split /\s+/,$_;
	for($i=1;$i<=@a;$i++)
	{
		$raw{$i}+=$a[$i];
	}
	}

}
open TPMOUT,">$ARGV[0].tpm";
open FPKM,"$ARGV[0]" or die;
while(<FPKM>)
{
	chomp;
	unless(/^#/ or /^Gene/)
	{
		@a=split /\s+/,$_;
		print TPMOUT"$a[0]\t";
		for($i=1;$i<=@a;$i++)
		{
			$total=$raw{$i};print "$total\n";
			if($total>0)
			{
				$tpm=($a[$i]/$total)*1000000;
			}
			if($total==0)
			{
				$tpm=0;
			}
			print TPMOUT"$tpm\t";
		}
		print TPMOUT"\n";
	}
}

open TPM,"$ARGV[0].tpm" or die;
}
if($sum>100002 or $sum<999998)
{
open TPM,"$ARGV[0]" or die;
}
open OUT,">$dir/$ARGV[3]_$col\_R_input";
while(<TPM>)
{       
	chomp;
	@a=split /\s+/,$_;
	if(exists $hk{$a[0]})
	{       
		print OUT"$a[0],$a[$col],housekeeping genes\n";
	}
	if(exists $pre_defined{$a[0]})
	{
		print OUT"$a[0],$a[$col],$pre_defined{$a[0]}\n";
	}
}
open GROUP,">$dir/group_name_file";
@group_name=keys %group;
foreach $key(keys %group)
{
	print GROUP"$key\n";
}
