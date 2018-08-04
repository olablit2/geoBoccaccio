---
author: marco

---


# L'approccio digitale: orizzonti e metodi

Quello degli approcci digitali, informatici e computazionali allo studio letterario è un fertile terreno di ricerca, soprattutto negli ultimi anni e ha visto la crescita e la formazione di specifiche associazioni di studiosi nate con il compito di diffondere e discutere i modelli di tali conoscenze.



![Mappa complessiva dei luoghi citati in *Decameron* II](../../../data/out/maps/placesProva.png "Mappa complessiva dei luoghi citati in *Decameron* II"){height="auto" width="100%" ppi="600" dpi="600"}


* Approccio quantitativo/ qualitativo.
* ASTRAZIONE: trasformare un testo in lista di vettori
* Come si fa una sottrazione tra coordinate?
* Metodo di lavoro: l'approccio computazionale. Quali sono i vantaggi e i metodi.





## Testi, corpora, dati


[@owens2011]

bla

[@moretti2005]


## Gli strumenti usati

L'indagine preliminare ha previsto l'estrazione di una porzione iniziale del testo dell'opera, usata come *campione d'indagine* per testare la validità e la correttezza degli strumenti informatici a disposizione in rapporto con i risultati attesi e lo stile linguistico del testo in esame^[Risulta necessario sottolineare, e lo faremo in maniera più esplicita nel corso dell'articolo, quanto l'uso di software e librerie designate per l'analisi del linguaggio odierno possa creare delle problematicità evidenti se riferite a testi antichi.].
Tale campione estratto dal proemio alla prima giornata --di per sé non rappresentativo-- consta di 267 parole nell'edizione di riferimento ed i suoi confini sono rappresentati dalle espressioni: «Umana cosa», «guisa che sol di sé» ^[Le analisi sono state effettuate su laptop equipaggiato con processore Intel(R) Core(TM) I5 M480 2.67GHz 64bit, 8GB RAM DDR3, HD 1TB 5400rpm; OS: Linux Lubuntu 17.10, compilatori per diversi ambienti di sviluppo tra cui Python e R.].  

La prima operazione è stata quella di rintracciare gli strumenti informatici che meglio potessero supportare le operazioni necessarie all'estrazione delle informazioni ai fini dell'analisi in oggetto.
Le alternative principali che abbiamo valutato sono rappresentate da 4 tool di trattamento automatico del linguaggio (*Natural Language Processing* (NLP)), che andremo a discutere di seguito:

* UDPipe [@udpipe2017]  
Elaborato presso l'Università di Praga, UDPipe è un tool versatile che permette l'annotazione, il tagging, la lemmatizzazione e il parsing delle dipendenze sintattiche del documento, attraverso il caricamento di appositi dataset elaborati nella lingua-modello. Rilasciato con licenza aperta Mozilla Public License 2.0, accoglie nativamente la possibilità di lettura ed esportazione di file in formato standard CoNLL-U; è disponibile per Linux/ Windows/ OS X, come libreria per C++, Python, Perl, Java, C#, R e come servizio web.
Nella presente analisi è stato utilizzato come libreria per ambiente R.

* ItaliaNLP [@attardi-et-al2009]  
Il tool LinguA, ad opera del laboratorio ItaliaNLP dell'Istituto di Linguistica Computazionale “Antonio Zampolli” (ILC-CNR, presenta una pipeline che permette la lemmatizzazione, il tagging delle parti del discorso, il parsing delle dipendenze e la divisione del testo in frasi. Permette l'analisi e il download dei documenti nelle lingue in formato CoNNL tramite interfaccia web nelle lingue italiano e inglese.  

* TreeTagger [@schmid1994b]  
TreeTagger è un tagger di tipo probabilistico, disponibile per Windows/ Linux/ OS X e con contenitori per differenti ambienti --R, Python, Java-- e come applicazione standalone per Windows. La pipeline mostra un parser ed una serie di *modelli* di lingua da caricare nel motore per performare le analisi. 
Lo abbiamo utilizzato grazie all'agevole interfaccia web messa a disposizione dall'Università degli Studi di Perugia.

* PATTERN [@pattern2012]  
Specificatamente pensato per il *mining* di informazioni dal Web, prevede uno scraper di informazioni dalla DOM delle pagine HTML per l'estrazione del testo. Permette di avviare indagini di sentiment analysis, oltre alle operazioni più classiche di lemmatizzazione e POS-tagging; è disponibile per ambiente Python.

Si è proceduto dunque con l'operazione di lemmatizzazione automatica, comparando i vari tool. In questo modo le singole parole del testo, o *tokens*, vengono ricondotte dalla loro forma al lemma corrispondente. La tabella seguente mostra il tasso di uguaglianza tra i tool in termini assoluti sulle 267 forme:
 
|             |             |           |         | 
|-------------|-------------|-----------|---------| 
|             | ItaliaNLP 	| TT(UniPG) | PATTERN | 
| UDPIPE      | 240         | 203       | 223     | 
| ItaliaNLP	  |             | 219       | 231     | 
| TT(UniPG)   |             |           | 198     | 



Successivamente si è optata la scelta della valutazione manuale della correttezza dei tool, al fine di determinare quale tra gli strumenti in esame potesse meglio adattarsi all'analisi del documento in oggetto. La valutazione manuale, riportata di seguito, è stata elaborata sotto forma di percentuale rispetto al totale del campione, e vede UDPipe come quello che più fedelmente si è avvicinato ad un livello compatibile con i risultati attesi, nonostante la difficoltà di operare su un testo antico attraverso tool trainati su un uso linguistico contemporaneo.

![Grafico di comparazione della correttezza dei lemmi riconosciuti automaticamente](../charts/correctnessLibLemma2.png "Grafico di comparazione della correttezza dei lemmi riconosciuti automaticamente"){height="auto" width="100%" ppi="600" dpi="600"}


## La pipeline di lavoro

