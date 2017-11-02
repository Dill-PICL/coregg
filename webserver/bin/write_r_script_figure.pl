if(@ARGV!=6)
{
	print "perl $0 <group_name_file> <dir> <R_input_file> <R_script_output> <sample/tissue name> <port number>\n";
	exit;
}
$dir=$ARGV[1];
$input=$ARGV[2];
$R_script_file=$dir."/".$ARGV[3];
$port= $ARGV[5];
open R,">$R_script_file";
open GROUP,"$ARGV[0]" or die;
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
library("grid")



	multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {


# Make a list from the ... arguments and plotlist
		plots <- c(list(...), plotlist)

			numPlots = length(plots)

# If layout is NULL, then use 'cols' to determine layout
			if (is.null(layout)) {
# Make the panel
# ncol: Number of columns of plots
# nrow: Number of rows needed, calculated from # of cols
				layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
						ncol = cols, nrow = ceiling(numPlots/cols))
			}

		if (numPlots==1) {
			print(plots[[1]])

		} else {
# Set up the page
			grid.newpage()
				pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

# Make each plot, in the correct location
				for (i in 1:numPlots) {
# Get the i,j matrix positions of the regions that contain this subplot
					matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

						print(plots[[i]], vp = viewport(layout.pos.row = matchidx\$row,
									layout.pos.col = matchidx\$col))
				}
		}
	}
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
print R"all<-rbind(";
@num=keys %group;
$num=@num;
foreach $key (keys %group)
{
	$i++;
	$name=$key;
	$name=~tr/a-zA-Z0-9//cd;
	print R"$name";
	if($i!=$num)
	{
		print R",";
	}
	if($i==$num)
	{
		print R")\n";
	}
}

$print=<<EOF;
	mean<-mean(log(housekeepinggenes[,2]+1))
	font_size<-10
	B<-ggplot(all,aes(log(RNA),))+
	geom_density(size=1)+theme(axis.text=element_text(size=font_size),axis.title=element_text(size=font_size))+
	theme(panel.background = element_blank(),panel.grid.minor =element_blank(), 
			panel.border = element_rect(colour = "black", fill=NA, size=1.5),
			legend.title = element_blank(),legend.text = element_blank())+
	xlab("RNA expression level")+ylab("Percentage of genes %")

	A<-ggplot(all, aes(sample=log(RNA+1)))+stat_qq()+theme(axis.text=element_text(size=font_size),axis.title=element_text(size=font_size))+
	theme(panel.background = element_blank(),panel.grid.minor =element_blank(), 
			panel.border = element_rect(colour = "black", fill=NA, size=1.5),
			legend.title = element_blank(),legend.text = element_blank())



	C<- ggplot(all,aes(log10(RNA)/mean, color=group))+
	geom_density(size=1)+theme(axis.text=element_text(size=font_size),axis.title=element_text(size=font_size))+
	theme(panel.background = element_blank(),panel.grid.minor =element_blank(), 
			panel.border = element_rect(colour = "black", fill=NA, size=1.5))+
	xlab("RNA expression level")+ylab("Percentage of genes %")
	layout <- matrix(c(1,2,2,1,3,3,1,3,3), nrow = 3)
	ggsave(plot=multiplot(A,B,C, layout = layout),file="tpmimg.png")
EOF
print R"$print\n";
