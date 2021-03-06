% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/contiBAIT.R
\name{contiBAIT}
\alias{contiBAIT}
\title{contiBAIT -- master function to process strand-seq libraries into ordered linkage groups}
\usage{
contiBAIT(path = ".", cluster = 1, clusterParam = NULL,
  saveName = FALSE, filter = FALSE, readQual = 10, readLimit = 10,
  pairedEnd = TRUE, makePlots = FALSE, verbose = TRUE)
}
\arguments{
\item{path}{String denoting location of Strand-seq bam files (default is ".")}

\item{cluster}{Integer denoting the number of reclusterings to be performed for creating linkage groups (default is 1)}

\item{clusterParam}{Number of parallel processors to use when clustering contigs. Default is NULL.}

\item{saveName}{String denoting the file name for saved data. If FALSE, no intermediate files are saved (default is FALSE)}

\item{filter}{additional file to split chromosomes based on locations. If this parameter is blank,
a filter table will be automatically generated from the header of the first file in bamFileList}

\item{readQual}{Integer dictating the minimal mapping quality required for a read to be accepted. Default is 10.}

\item{readLimit}{Minimum number of reads on a contig to make a strand call. Default is 10}

\item{pairedEnd}{Whether the bam files being read are in paired end format. Default is TRUE. Note,
since paired reads will be the same direction, only first mate read of pair is used in output}

\item{makePlots}{Logical determining whether plots should be created. Default is TRUE}

\item{verbose}{prints messages to the terminal (default is TRUE)}
}
\value{
ordered contigs in bed format. Depending on options, intermediate files and plots will also be generated
}
\description{
contiBAIT -- master function to process strand-seq libraries into ordered linkage groups
}
\examples{
#Get a list of BAM files containing libraries for cells from the same organism, aligned to the same genome
#In this case these are the example BAM files provided with the package (hence the call to system.file);
data("exampleDividedChr")
library(BiocParallel)

example.dir <- file.path(system.file(package='contiBAIT'), 'extdata')

orderedContigs <- contiBAIT(path=example.dir, 
							cluster=1, 
							clusterParam=MulticoreParam(), 
							filter=exampleDividedChr, 
							pairedEnd=FALSE)
}

