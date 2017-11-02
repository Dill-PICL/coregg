if(@ARGV!=7)
{
	print "perl $0 <group_name_file> <dir> <R_input_file> <R_script_output> <sample/tissue name> <port number> <group name>\n";
	exit;
}
$dir=$ARGV[1];
$input=$ARGV[2];
$R_script_file=$dir."/".$ARGV[3];
$port= $ARGV[5];
$group=$ARGV[6];
$group=~tr/a-zA-Z0-9//cd;
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
library("shiny")
library("ggplot2")
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

$print=<<EOF;
	mean<-mean(log(housekeepinggenes[,2]+1))
	font_size<-10

	A<-ggplot($group, aes(sample=log(RNA+1)))+stat_qq()+theme(axis.text=element_text(size=font_size),axis.title=element_text(size=font_size))+
	theme(panel.background = element_blank(),panel.grid.minor =element_blank(), 
			panel.border = element_rect(colour = "black", fill=NA, size=1.5),
			legend.title = element_blank(),legend.text = element_blank())

	ggsave(plot=A,file="qqplotimg.png")
EOF
print R"$print\n";
system("Rscript $R_script_file");