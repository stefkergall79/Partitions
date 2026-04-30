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
  Su -- mens il -- lud A -- ve
  Ga -- bri -- e -- lis o -- re,
  fun -- da nos in pa -- ce,
  mu -- tans He -- væ no -- men.
}

verseTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 4.
  Mons -- tra te esse ma -- trem_:
  Su -- mat per te pre -- ces,
  qui pro no -- bis na -- tus
  tu -- lit es -- se tu -- us.
  \override LyricText.font-shape = #'roman
  A -- men.
}

verseThree = \lyricmode {
  \set stanza = "5."
  Vi -- tam præs -- ta pu -- ram,
  i -- ter pa -- ra tu -- tum,
  ut vi -- den -- tes Je -- sum,
  sem -- per col -- læ -- te -- mur.
}

verseFour = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 4.
  
}

verseFive = \lyricmode {
  \set stanza = "5."
  
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
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseFour
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseFive
      
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

