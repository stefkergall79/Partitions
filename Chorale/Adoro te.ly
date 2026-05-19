\version "2.26.0"

global = {
  \key es \major
  \time 4/4
  \autoBeamOff 
  \partial 4
}

soprano = \fixed c' {
  \global
  bes4 4 as g g |
  as g f bes |
  4 a bes r |
  bes g as bes |
  c' bes as g |
  f f es r |
  bes as g g |
  as g f bes |
  4 a bes r |
  bes g as bes |
  c' bes as g |
  f f es r |
  es' d' c' bes |
  es' d' c' bes |
  g2 as |
  f g4 bes |
  4 g as bes |
  c' bes as g |
  f f es2 |
}

alto = \fixed c' {
  \global
  g4 4 f es4 4 |
  c8[d]es4 4 d |
  c es d r |
  g es c es |
  as g f es |
  es d es r |
  g f es4 4|
  c8[d]es4 4 d |
  c es d r |
  g es c es|
  as g f es |
  4 d es r |
  es f8[g]as4 g |
  es f4 8[es]d4 |
  es(g)f(es) |
  4(d) es d |
  es des c es |
  4 e f es |
  4 d es2\bar"|." |
}

tenor = \relative c' {
  \global
  r4 R1*12
  g4 as8[bes]c[d]es4 |
  g, bes a bes |
  2 c |
  bes2 4 8[as] |
  bes4 4 as g |
  as bes c bes |
  c bes8[as] g2 |
}

bass = \fixed c {
  \global
  r4 R1*12
  es4 4 4 4 |
  c d8[es] f4 bes, |
  es2 as, |
  bes, es4 bes8[as] |
  g4 es f es |
  as g f g |
  as bes8[bes,]es2|
}

verseOne = \lyricmode {
  \set stanza = "1."
  
}

verseTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 2.
  
}

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
  "Adoro te devote" ""
}
\score {
  \header {
    title = "ADORO TE"
    composer = "1625"
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

