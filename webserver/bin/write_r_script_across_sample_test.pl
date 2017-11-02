if(@ARGV!=9)
{
	print "perl $0 
		0 <file_1_name_file>
		1 <file_1_dir> 
		2 <file_1_R_input_file> 
		3 <file_2_name_file> 
		4 <file_2_dir>
		5 <file_2_R_input_file>
		6 <R_script_output>
		7 <group 1 name from file 1>
		8 <group 2 name from file 2>\n";
	exit;
}
$dir_1=$ARGV[1];
$dir_2=$ARGV[4];
$input_1=$ARGV[2];
$input_2=$ARGV[5];
$R_script_file=$dir_1."/".$ARGV[6];
open R,">$R_script_file";
open GROUP_1,"$dir_1/$ARGV[0]" or die;
while(<GROUP_1>)
{
	chomp;
# input format like 
#A group
#B group
#C group
	$group_1{$_}=$_;
}
open GROUP_2,"$dir_2/$ARGV[3]" or die;
while(<GROUP_2>)
{       
	        chomp;
# input format like 
#A group
#B group
#C group
		$group_2{$_}=$_;
}
# deal with file 1
my $print_1 = <<EOF;
setwd("$dir_1")
group_1<-read.csv("$input_1", header=F)
colnames(group_1) <- c("gene","RNA","group")
EOF
print R "$print_1\n";
foreach $key (keys %group_1)
{
	$name=$key;
	$name=~tr/a-zA-Z0-9//cd;
	$print_1=<<EOF;
	file_1_$name<-subset(group_1,group_1[,3]=="$key")
EOF
		print R"$print_1\n";
}

# deal with file 2
my $print_2 = <<EOF;
setwd("$dir_2")
group_2<-read.csv("$input_2", header=F)
colnames(group_2) <- c("gene","RNA","group")
EOF
print R "$print_2\n";
foreach $key (keys %group_2)
{
	$name=$key;
	$name=~tr/a-zA-Z0-9//cd;
	$print_2=<<EOF;
	file_2_$name<-subset(group_2,group_2[,3]=="$key")
EOF
	print R"$print_2\n";
}

$ARGV[7]=~tr/a-zA-Z0-9//cd;
$group_1_name=$ARGV[7];
$ARGV[8]=~tr/a-zA-Z0-9//cd;
$group_2_name=$ARGV[8];

$print=<<EOF;
	mean_1<-mean(log(file_1_housekeepinggenes[,2]+1))
	mean_2<-mean(log(file_2_housekeepinggenes[,2]+1))
t.test(log(file_1_$group_1_name\[,2])/mean_1,log(file_2_$group_2_name\[,2])/mean_2)
EOF
	print R"$print\n";
system("Rscript $R_script_file");
