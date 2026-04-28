\version "2.24.4"

\header {
  title = "L‘ours"
}

global = {
  \key f \major
  \time 2/4
  \autoBeamOff
  \partial 4.
}

soprano = \fixed c' {
  \global
  a8 a a a4. g8 f[bes] 4 2
  r8 a8 a a a4. g8 f g g a g8. f16 e8 d c
  a8 a a a4. g8[f]bes8 4 2
  r8 a8 a a g4 f8 e8~8 f8 8 8 2\bar"||"\break
  
  a8 a a 
}

alto = \fixed c' {
  \global
  % En avant la musique.
  
}

tenor = \fixed c' {
  \global
  % En avant la musique.
  
}

verse = \lyricmode {
  Dans no -- tre vil -- lage au -- tre -- fois,
  un ours é -- nor -- me dé -- vas -- tait le bois, la la la la.
  Il fai -- sait peur aux bû -- che -- rons,
  et des ber -- gers man -- geaient tous les mou -- tons.
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Soprano"
    } \new Voice = "soprano" \soprano
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verse
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Alto"
    } \new Voice = "alto" \alto
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "alto" \verse
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Ténor"
    } {
      \clef "treble_8"
      \new Voice = "tenor" \tenor
    }
  >>
  \layout { }
  \midi {\tempo 4=130}
}
