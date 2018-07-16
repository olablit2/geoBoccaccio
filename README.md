# Nuove prospettive per lo studio della toponomastica nel Decameron

**Marcello Bolpagni**ℵ, **Marco Petolicchio**ℶ
ℵ    Dept. of General Linguistics, Palacky University Olomouc 
     marcello.bolpagni@gmail.com
ℶ   Dept. of Romance Languages, Palacky University Olomouc 
     marco.petolicchio01@upol.cz    |    ORCID: 0000-0001-7017-7862

## Methods

**Abstract**

This research aims to investigate over a coherent way to extract geographical information by the Decameron’s novels of Boccaccio using modern tools.

### Objectives

This research aims to investigate over a coherent way to extract geographical information in the narrative storytelling of Decameron 2nd day novelle by the perspective of the narration (extra-diegetic / fabula).

### Pipeline

Preliminary steps
* [DONE] Collect the corpus in a textual form (e.g. liberliber)
* [DONE] Clean the corpus
* [DONE] Divide the corpus into partials  (e.g. 0207.txt, 0203.txt | namefile: NNnn.txt where NN=02)
* Tools testing
* [DONE] POS and Lemmatization correctness rate => UDPIPE wins

### Geographic information

* [DONE] Use UDPIPE with the 10 subcorpora. Write the relative CONLL-U files of each partials
* [IN PROGRESS] Extract all the PROPN | SP tokens for each partials 

Using R
```
	infile <- read.csv(CONNLU)
	df <- infile[infile[,4] == "PROPN", ]
	write.csv(df, outfile)
```

(Using G Spreadsheet)

```
	=query({IMPORTRANGE("https://docs.google.com/spreadsheets/d/1Qh7mGzfW2ow8RzOniqO_-60JST6pbT71dfzaz_GtV0k";"prova!A1:J15000")}; "SELECT * WHERE Col5 CONTAINS'SP'";0)
```

## Merge the various csv

All the csv in the folder are merged into a total one

```
mlr --csv --rs lf --csv sort -f date,code *.csv > total/final.csv
```
* The given spreadsheets  yields for a list of items of PNs. Order the list alphabetically. Insert a manual column where the token is standardized and give the relevant coords:

Item        | Std       | Long			| Lat         |
------------|-----------|---------------|-------------|
Vinegia     | Venezia   | 45.4042008	| 12.1015609  |

* Don’t delete PNs which are not strictly relevant to the actual recognition: they serve as  tools for tracing out the correctness rate or other info.
* Give parallel spreadsheets for each partials which yields  a structured array of PNs in texts. When merged with the previous one, it will results for 3 columns of each term: the ones which have coords field are the locations
* Add a manual field to the spreadsheet which explicits the actors of that location

Item        | Std       | Long			| Lat         | Actor 		|
------------|-----------|---------------|-------------|-------------|
Vinegia     | Venezia   | 45.4042008	| 12.1015609  | Buffalmacco	|

* Plot locations in map
* Use the frequency list for the whole day 

## Questions
* Lo spostamento dei personaggi e/o della narrazione all’interno di una novella prevede direzioni più frequenti di altre? (es. est-ovest, nord-sud)
* Quali le conseguenze narratologiche e morali di uno spostamento?
* Possiamo identificare delle tendenze migratorie nella seconda giornata?



