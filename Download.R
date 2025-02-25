# set-up

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") # vector of identifiers for Genbank database
library(rentrez)  # installs package
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") # retrieves nucleotide sequence data

Sequences = strsplit(Bburg, split = "\n\n")
Sequences=unlist(Sequences)


# regex

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences=data.frame(Name=header,Sequence=seq)

Sequences$Sequence = gsub("\n", "", Sequences$Sequence)


# write to file

write.csv(Sequences, "Sequences.csv")
