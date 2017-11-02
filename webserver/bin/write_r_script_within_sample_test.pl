if(@ARGV!=6)
{
	print "perl $0 <group_name_file> <dir> <R_input_file> <R_script_output> <group 1 name> <group 2 name>\n";
	exit;
}
$dir=$ARGV[1];
$input=$ARGV[2];
$R_script_file=$dir."/".$ARGV[3];
open R,">$R_script_file";
open GROUP,"$dir/$ARGV[0]" or die;
while(<GROUP>)
{
	chomp;
# input format like 
	#A group
	#B group
	#C group
	$group{$_}=$_;
}

my $print = <<EOF;
setwd("$dir")
all<-read.csv("$input", header=F)
colnames(all) <- c("gene","RNA","group")
EOF
print R "$print\n";
foreach $key (keys %group)
{
	$name=$key;
	$name=~tr/a-zA-Z0-9//cd;
	$print=<<EOF;
	$name<-subset(all,all[,3]=="$key")
EOF
	print R"$print\n";
}
	$ARGV[4]=~tr/a-zA-Z0-9//cd;
	$group1=$ARGV[4];
	$ARGV[5]=~tr/a-zA-Z0-9//cd;
	$group2=$ARGV[5];

$print=<<EOF;
mean<-mean(log(housekeepinggenes[,2]+1))
t.test(log($group1\[,2])/mean,log($group2\[,2])/mean,paired=F)
EOF
print R"$print\n";
system("Rscript $dir/$ARGV[3]");
