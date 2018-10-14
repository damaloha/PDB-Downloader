#!/usr/bin/perl
# David Martin LopezHazas
print "Enter PDB code with '.pdb':\t";
my $file = <STDIN>;
my $url = 'https://files.rcsb.org/download/'.$file;
my $carl = "curl -o temp_file.pdb";
system "$carl $url";



open(PDB,"temp_file.pdb") || die "Error al abrir\t".$file;

while($linea=<PDB>){
	chomp($linea);
	if($linea =~/^HEADER\s+(\w+)\s+(\w+.\w+.\w+)\s+(\w+)/){

		print  "\tTYPE:\t".$1."\n";
		print  "DATE:\t".$2."\n";
		print  "ID:\t".$3."\n";
		print "\t==========================================================\n";
	}
	if ($linea =~/^TITLE\s+(.*)\s/) {
		print "TITLE:\t".$1."\n";
		print "\n";
	}
	if ($linea =~/^SEQRES\s+(.*)\s/) {
		print "SEQRES:\t".$1."\n";
	}
	if ($linea =~/^HELIX\s(.*\d)/) {
		print "HELIX:\t".$1."\n";
	}
}
		#print STDOUT "El número total de proteinas con secuencia <=50 aa es de: \"$contador_proteinas_menor_50\"\n";


		#next;


close PDB;
rename "temp_file.pdb",$file;
chomp($file);