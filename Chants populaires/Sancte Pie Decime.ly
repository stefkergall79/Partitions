\version "2.24.3"

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
}

soprano = \fixed c' {
  \global
  \bar ".|:"c'4 b a g a8. 16 e2
  8. 16 a2 4 g4 c'2 d'
  e' a d' g4 c'4 2(b) c'1\bar ":|."
}

alto = \fixed c' {
  \global
  c'4 b a g a8. 16 e2
  8. 16 2 4 g4 2 b c' a b e4 g4 1 1
}

tenor = \fixed c {
  \global
  c'4 b a g a8. 16 e2
  8. 16 c'2 4 d' e'2 g'2
  2 c' g' c'8[d']e'[f'] d'1 e'
}

bass = \fixed c {
  \global
  c'4 b a g a8. 16 e2
  8. 16 a,2 4 b, c2 g,
  c f d c4 4 d2(g,) c1
}

verseOne = \lyricmode {
  San -- cte Pi -- e De -- ci -- me,
  glo -- ri -- o -- se Pa -- tro -- ne,
  o -- ra, o -- ra pro no -- bis_!
}

\paper {
  print-all-headers = ##t
  tagline = ##f
}
\tocItem \markup "Sancte Pie Decime"
\score {
  \header {
    title = "SANCTE PIE DECIME"
    composer = ""
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
    \midi {\tempo 4=85}
  }

