if(@ARGV!=7)
{
	print "perl $0 <uploaded TPM input> <which col to use> <sample/tissue name> <upload annotation file> <session> <port> <housekeeping gene file>\n";
	exit;
}
$upload_TPM_file=$ARGV[0];
$upload_annotation_file=$ARGV[3];
$name=$ARGV[2];
$col=$ARGV[1];
$session=$ARGV[4];
$port=$ARGV[5];
$upload_housekeeping_gene_file=$ARGV[6];
$root="/Users/readmanhe/Desktop/webserver";# change root directive #
$test_dir=$session;
`perl $root/bin/feed_R_note_figure_1.pl $test_dir/$upload_TPM_file $col $test_dir/$upload_annotation_file $name $test_dir $root $upload_housekeeping_gene_file`;
$s="perl $root/bin/feed_R_note_figure_1.pl $test_dir/$upload_TPM_file $col $test_dir/$upload_annotation_file $name $test_dir";
`perl $root/bin/write_r_script_figure.pl $test_dir/group_name_file $test_dir $name\_$col\_R_input $name.r $name $port`;
`Rscript $test_dir/$name.r`;
