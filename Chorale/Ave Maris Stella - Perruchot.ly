\version "2.24.3"
global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \partial 2
}

soprano = \fixed c' {
  \global
  d4 a a g4 8[f e f] e2
  f4 g a bes4 8[a g a] g2
  a4 d' b e'4 8[d' c' b] c'2
  d'4 bes! g a4 8[g f e] \partial 2 d2\bar"||"
  a4(d' c'8)[bes a g] a1\bar "|."
}

alto = \fixed c' {
  \global
  d4 f f e c4.(d8) cis2
  d4 e f e f2 e
  f4 f e e f(e) e2
  fis4 d e f d8[e](cis4) d2
  f(e) fis1
}

tenor = \fixed c {
  \global
  d'4 4 4 g a2 2
  4 c'4 4 bes c'(d') e'2
  c'4 b gis a a gis a2
  4 bes c'4 4 bes(a8.)[g16] f2
  d'1 1
}

bass = \fixed c {
  \global
  d4 8[c] bes4 c f(d) a,2
  d4 c f g f2 c
  f4 d e c d e a,2
  d4 g c f g(a8)[a,]d2
  4(bes, g,2) d1
}

verseOne = \lyricmode {
  \set stanza = "2."
  Sú -- mens íl -- lud A -- ve
  Ga -- bri -- é -- lis ó -- re,
  fún -- da nos in pá -- ce,
  mú -- tans Hé -- væ nó -- men.
}

verseTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 4.
  Móns -- tra t(e)_és -- se má -- trem_:
  Sú -- mat per te pré -- ces,
  qui pro nó -- bis ná -- tus
  tú -- lit és -- se tú -- us.
  \override LyricText.font-shape = #'roman
  A -- men.
}

verseThree = \lyricmode {
  \set stanza = "5."
  Ví -- tam prǽs -- ta pú -- ram,
  i -- ter pá -- ra tú -- tum,
  ut vi -- dén -- tes Jé -- sum,
  sem -- per col -- læ -- té -- mur.
}

\paper {
  tagline = ##f
}
\tocItem \markup "Ave Maris Stella"
\markup \column {
  \fill-line {\bold \fontsize #5 "AVE MARIS STELLA" }
  \vspace #0.2
  \fill-line { \null "Mgr Louis-Lazare Perruchot (1852-1930)"}
  \vspace #0.8
  \fill-line {
    \null
    \epsfile #X #60 #"../Grégorien/Ave Maris Stella.eps"
    \null
  }
  \vspace #1
}
\score {
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
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseThree
      
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

