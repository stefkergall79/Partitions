\version "2.26.0"

global = {
  \key d \major
  \time 4/4
}

soprano = \fixed c' {
  \global
  a2 d'4(fis) |
  a(gis)g2 |
  4(b)a(g) |
  4(fis)2 |
  e2. 4 |
  fis4 4 g g |
  2(fis4) 4 | e1 |
  2. a4 |
  4(gis) 2 |
  e4(gis2)b4 |
  4(a)4 4 |
  d'1(~4 cis')b a |
  2(gis4)4 a1 | R1*3
  a2. 4 |
  4(bes)2 |
  4(d')c'(bes) |
  4(a) 2 |
  g2. 4 |
  4(bes) a g |
  2(f8[e])f4 |
  e2 r2 |
  fis2. 4 |
  4(e)d(g) |
  2. 4 |
  4(fis)e a |
  1(~4 g)a b |
  fis2(e4.)fis8 |
  g2 2 |
  d'1(~2 dis' |
  e'4 b cis' d' |
  cis' b8[a])d'4 g |
  fis2(e4.)8 d1 |
  R1*3 \bar"|."
}

alto = \relative c' {
  \global
  
}

tenor = \relative c' {
  \global
  
}

bass = \relative c {
  \global
  
}

verse = \lyricmode {
  A -- ve, A -- ve ve -- rum Cor -- pus
  na -- tum de Ma -- ri -- a Vir -- gi -- ne.
  Ve -- re pas -- sum, im -- mo -- la -- tum
  in cru -- ce pro ho -- mi -- ne_:
  Cu -- jus la -- tus per -- fo -- ra -- tum
  un -- da flu -- xit cum san -- gui -- ne_:
  Es -- to no -- bis præ -- gus -- ta -- tum
  in mor -- tis e -- xa -- mi -- ne.
  In mor -- tis e -- xa -- mi -- ne.
}

rightOne = \relative c'' {
  \global
  
}

rightTwo = \relative c'' {
  \global
  
}

dynamics = {
  \global
  
}

leftOne = \relative c' {
  \global
 
}

leftTwo = \relative c' {
  \global
  
}

choirPart = \new ChoirStaff <<
  \new Staff \with {
    midiInstrument = "choir aahs"
    instrumentName = \markup \center-column { "S." "A." }
  } <<
    \new Voice = "soprano" { \voiceOne \soprano }
    \new Voice = "alto" { \voiceTwo \alto }
  >>
  \new Lyrics \with {
    \override VerticalAxisGroup.staff-affinity = #CENTER
  } \lyricsto "soprano" \verse
  \new Staff \with {
    midiInstrument = "choir aahs"
    instrumentName = \markup \center-column { "T." "B." }
  } <<
    \clef bass
    \new Voice = "tenor" { \voiceOne \tenor }
    \new Voice = "bass" { \voiceTwo \bass }
  >>
>>

pianoPart = \new PianoStaff \with {
  instrumentName = "Org."
} <<
  \new Staff = "right" \with {
    midiInstrument = "church organ"
  } << \rightOne \\ \rightTwo >>
  \new Dynamics \dynamics
  \new Staff = "left" \with {
    midiInstrument = "church organ"
  } { \clef bass << \leftOne \\ \leftTwo >> }
>>


\paper {
  print-all-headers = ##t
  tagline = \markup {
    \italic \with-color #blue 
    \with-url #"mailto:stef.kergall@gmail.com"
    "stef.kergall@gmail.com"
    "- Partitions sur commande"
  }
}
\tocItem \markup {
  \pad-to-box #'(0 . 40) #'(0 . 0)
  "Ave verum" "Mozart"
}
\score {
  \header {
    title = "AVE VERUM"
    composer = "Wolfgang Amadeus Mozart (1756-1791)"
  }
  <<
    \choirPart
    \pianoPart
  >>
  \layout {}
  \midi { \tempo 4=80 }
}
