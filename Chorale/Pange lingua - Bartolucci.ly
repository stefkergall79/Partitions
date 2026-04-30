\version "2.24.3"

global = {
  \key as \major
  \numericTimeSignature
  \time 4/2
  \partial 2
}

soprano = \fixed c' {
  \global
  % En avant la musique.
  f4 g as2 2 bes4 as bes2 \partial 1 c'1 bes4 as g f as2 g4( f4) 1.\breathe
  4 g as2 2 bes4 as bes2 \partial 1 c'1 4 bes as g bes2 as4( g) g1.\breathe
  as4 bes c'2 2 d'4 c' d'2 es'1 des'4 c' bes as c'2 bes4( as) as1
  bes4 as g f as2 g4( f) f\breve \bar "||"
  g1( f) f\breve\bar "|."
}

alto = \fixed c' {
  \global
  % En avant la musique.
  c4 4 f2 c es4 c es2 \partial 1 1 des4 4 4 4 2 2 c1.
  c4 4 f2 c es4 c es2 \partial 1 1 es4 4 4 4 2 2 1.
  4 4 as2 2 f4 4 as2 g1 f4 4 4 4 2 2 es( des4 c) des4 4 4 4 2 2 c\breve 
  es1( des) c\breve
}

tenor = \fixed c {
  \global
  % En avant la musique.
  as4 bes c'2 as g4 f g2 \partial 1 as1 f4 f bes bes f2 g as1.
  4 bes c'2 as g4 f g2 \partial 1 as1 g4 g c' c' g2 as bes1.\breathe
  c'4 des' es'2 f' c'4 4 2 1 as4 4 des'4 4 as2 bes c'( bes4 as)
  f f bes bes f2 g as\breve
  bes a
}

bass = \fixed c {
  \global
  % En avant la musique.
  f4 f4 2 2 es4 4 2 \partial 1 as,1 bes,4 4 4 4 2 2 f1.\breathe
  4 4 2 2 es4 4 2 \partial 1 as,1 c4 4 4 4 2 2 es1.
  as4 4 2 f as4 4 f2 c1 des4 4 4 4 2 2 as(f)
  bes,4 4 4 4 2 2 f\breve 
  es1( bes,) f\breve
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Ajouter ici des paroles.
  Pan -- ge lin -- gua glo -- ri -- ó -- si
  Cor -- pó -- ris mys -- té -- ri -- um,
  San -- gui -- nís -- que pre -- ti -- ó -- si,
  quem in mun -- di pré -- ti -- um,
  fruc -- tus ven -- tris ge -- ne -- ró -- si,
  rex ef -- fú -- dit gén -- ti -- um, rex ef -- fú -- dit gén -- ti -- um.
}

verseTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 2.
  No -- bis da -- tus, no -- bis na -- tus
  ex in -- tác -- ta Vír -- gi -- ne,
  et in mun -- do con -- ver -- sá -- tus,
  spar -- so ver -- bi sé -- mi -- ne,
  Su -- i mo -- ras in -- co -- lá -- tus
  mi -- ro clau -- sit ór -- di -- ne,
  mi -- ro clau -- sit ór -- di -- ne.
  \override LyricText.font-series = #'bold
  A -- men.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Ajouter ici des paroles.
  In su -- pré -- mae noc -- te ce -- nae
  re -- cúm -- bens cum frá -- tri -- bus,
  ob -- ser -- vá -- ta le -- ge ple -- ne
  ci -- bis in le -- gá -- li -- bus,
  ci -- bum tur -- bae du -- o -- dé -- nae
  Se dat su -- is má -- ni -- bus, Se dat su -- is má -- ni -- bus.
}
\paper {
  print-all-headers = ##t
  tagline = ##f
}
\tocItem \markup "Pange Lingua"
\score {
  \header {
    title = "PANGE LINGUA"
    composer = "Dom Domenico Bartolucci (1917-2013)"
  }
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "S." "A." }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseThree
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "T." "B." }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout { }
  \midi { \tempo 2=80 }
}


\markup{
  \column \italic {
    \line {\bold 4. Verbum caro, panem verum}
    "    Verbo carnem éfficit ;"
    "    Fitque sanguis Christi merum,"
    "    Et, si sensus déficit,"
    "    Ad firmándum cor sincérum"
    "    Sola fides súfficit."
  }
  \hspace #4
  \column {
    \line {\bold 5. Tantum ergo Sacraméntum}
    "    Venerémur cérnui,"
    "    Et antíquum documéntum"
    "    Novo cedat rítui ;"
    "    Præstet fides supplémentum"
    "    Sénsuum deféctui."
  }
  \hspace #4
  \column \italic {
    \line {\bold 6. Genitóri Genitóque}
    "    Laus et jubilátio,"
    "    Salus, honor, virtus quoque"
    "    Sit et benedíctio ;"
    "    Procedénti ab utróque"
    "    Compar sit laudátio."
    \line \bold { "    Amen."}
  }
}