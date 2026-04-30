\version "2.24.3"

global = {
  \once \omit Staff.TimeSignature
  \key bes \major
  \autoBeamOff
}

soprano = \fixed c' {
  \global
  \cadenzaOn
  \sectionLabel "Chantre"
  d'8 8 8 bes es' c' \bar"|" d' c' bes c' d'4 \bar"||"\break
  \sectionLabel "Tous"
  d'8 8 8 bes es' c' \bar"|" d' c' bes c' d'4 \bar"||"\break
  \sectionLabel "Chantre"
  bes8 8 8 d' c' g\bar"|" bes a g a bes4 \bar"||"\break
  \sectionLabel "Tous"
  bes8 8 8 d' c' g\bar"|" bes a g a bes4 \bar"||"\break
  
  \break \sectionLabel "Refrain" \cadenzaOff \time 4/4
  c'2 4 d' g2 4 a4 bes2 a g \bar "||"
}

alto = \fixed c' {
  \global
  s1*6
  g2 4 f4  2 es4 4 d2 c bes,2
}

tenor = \fixed c {
  \global
  s1*6
  g2 4 as g2 4 fis g2 fis bes
}

bass = \fixed c {
  \global
  s1*6
  es2 4 bes, c2 4 4 d2 2 g,
}

verseOne = \lyricmode {
  \set stanza = "1."
  Ô Vier -- ge Ma -- ri -- e, Mè -- re du Très -_Haut,
  Mè -- re du Mes -- si -- e, le Di -- vin A -- gneau,
  Vierge in -- com -- pa -- ra -- ble, Es -- poir d'Is -- ra -- ël,
  Vier -- ge tout ai -- ma -- ble, clair par -- vis du Ciel,
  
  Vier -- ge Ma -- ri -- e, pri -- ez pour nous.
}

verseTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 2.
  Ô Mè -- re très pu -- re du Christ Ré -- demp -- teur,
  Mè -- re sans souil -- lu -- re, Mè -- re du Sau -- veur,
  Vier -- ge vé -- né -- ré -- e, Mys -- tique at -- tri -- but,
  Mè -- re très ai -- mé -- e, Por -- te du sa -- lut.
}

\paper {
  print-all-headers = ##t
  tagline = ##f
}
\tocItem \markup "Ô Vierge Marie"
\score {
  \header {
    title = "Ô VIERGE MARIE"
    composer = "Charles Bordes (1863-1909)"
  }
  \new ChoirStaff <<
      \new Staff \with {
        midiInstrument = "choir aahs"
        \consists Merge_rests_engraver
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
      
      \new Staff \with {
        midiInstrument = "choir aahs"
        \consists Merge_rests_engraver
      } <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \layout {\context{\Staff \RemoveAllEmptyStaves}}
    \midi {\tempo 4=70}
  }

\markup {
  \vspace #2
  \hspace #5
  \column {
    \line { \bold 3. Miroir de justice, Palais du grand Roi,}
    "    Mystique édifice, Arche de la Loi,"
    "    Ô Céleste tige, Branche de Jessé,"
    "    Illustre prodige au monde annoncé."
    \vspace #1
    \italic{
      \line { \bold 4. Reine immaculée, Fille d'Aaron,}
      "    Fleur de Galilée, Rose de Saron,"
      "    Tendre et chaste Mère, pleine de bonté,"
      "    Voyez ma misère, Lys de pureté."
    }
  }
  \hspace #5
  \column {
    \line { \bold 5. Reine des saints anges, Secours des chrétiens,}
    "    À vous nos louanges, Trésor de tous biens."
    "    Reine du Rosaire, Ô Temple immortel,"
    "    À vous ma prière, Parure du ciel."
    \vspace #1
    \italic{
      \line { \bold 6. Trône de sagesse, de grâce et d'honneur,}
      "    Source d'allégresse, notre vrai bonheur,"
      "    Reine d'espérance, guérissez nos cœurs ;"
      "    Notre délivrance, sauvez les pécheurs."
    }
  }
}
