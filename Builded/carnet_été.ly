\version "2.26.0"
\paper {
  tocTitleMarkup = \markup \column {
    \vspace #-3
    \huge \bold \fill-line {Sommaire}
    \vspace #2 
  }
  tagline = ##f
  tocItemMarkup = \markup \fill-line {
    \normal-text \fromproperty #'toc:text
    \normal-text \fromproperty #'toc:page
  }
}

\markuplist \table-of-contents

\pageBreak
\tocItem \markup {\bold "Carême" \vspace #1 }
\include "../Chants populaires/Jésus-Christ monte au Calvaire.ly" \pageBreak
\include "../Chants populaires/Vive Jésus, vive sa Croix.ly"
\include "../Chants populaires/Ô Croix dressée sur le monde.ly" \markup \vspace #3
\include "../Chorale/Stabat Mater - Zoltán Kodály.ly" \pageBreak
\include "../Chorale/In monte Oliveti - Martini.ly"

\pageBreak
\tocItem \markup {\bold "Général" \vspace #1 }
\include "../Chants populaires/Benedictus.ly" \pageBreak
\include "../Chants populaires/Règne à jamais.ly" \pageBreak
\include "../Chorale/Adoramus te - Dubois.ly"
\include "../Chants populaires/Sancte Pie Decime.ly" \pageBreak
\include "../Chorale/Alta Trinita.ly"
\include "../Chorale/Cantate Domino - Pitoni.ly"
\include "../Chorale/Jesu salvator - Menegali.ly"
\include "../Chorale/Jesu Rex admirabilis - Palestrina.ly" \pageBreak
\include "../Chorale/Tollite Hostias - Saint-Saëns.ly" \pageBreak

\pageBreak
\tocItem \markup {\bold "Saint-Sacrement" \vspace #1 }
\include "../Chants populaires/Lauda Sion.ly" \pageBreak
\include "../Chants populaires/Lauda Jerusalem.ly" \pageBreak
\include "../Chorale/Adoremus - Haller.ly" \pageBreak
\include "../Chorale/O salutaris - Mozart.ly" \pageBreak
\include "../Chorale/O memoriale - Palestrina.ly"
\include "../Chorale/Pange lingua - Bartolucci.ly" \pageBreak
\include "../Chorale/Panis angelicus - Baini.ly" \pageBreak
\include "../Chorale/Tantum ergo - Bach.ly"

\pageBreak
\tocItem \markup {\bold "Sainte-Vierge" \vspace #1 }
\include "../Chants populaires/Je mets ma confiance.ly"
\include "../Chants populaires/O Vierge Marie.ly" \pageBreak
\include "../Chorale/Ave Maris Stella - Perruchot.ly" \pageBreak
\include "../Chorale/O Gloriosa Virginum 3 voix.ly"
\include "../Chorale/O Sanctissima - Sicilien.ly"
\include "../Chorale/O Sanctissima - Roussel.ly"
