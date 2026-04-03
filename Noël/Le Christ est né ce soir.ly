\include "../settings.ly"

global = {
  \key d \major
  \time 6/8
  \autoBeamOff
  \partial 8
}

soprano = \fixed c' {
  \global
  fis8 4 b8 4 a8 b4. d' cis'4 b8 a4 b8 fis4. 8 r8
  8 4 b8 4 a8 b4. d' cis'4 b8 a4 b8 fis4. 4 r8
  b4. a4 fis8 g4 a8 fis4 g8 fis4 e8 d4 e8 fis4.~8 r
  fis8 4 b8 4 a8 b4. d' cis'4 e'8 d'4 cis'8 b4.\fermata \bar "|."
}

alto = \fixed c' {
  \global
  fis8 4 g8 4 fis8 4. b g4 fis8 e4 fis16[g] cis4. 8 r8
  d8 4 g8 4 fis8 4. b g4 fis8 e4 d16[cis] b,4. 4 r8
  fis4.~8 e d e4 8 d4 8 4 cis8 d4 b,8 a, r a, b,4
  cis8 d4. e fis g a4 cis'8 b4 a8 fis4.
}

tenor = \fixed c {
  \global
  d'8 4 8 e'4
}

bass = \fixed c {
  \global
  
}

verseOne = \lyricmode {
  \set stanza = "1."
  Le Christ est né ce soir de la Vier -- ge Ma -- ri -- e,
  sous le ciel é -- toi -- lé, hors de l’hô -- tel -- le -- ri -- e,
  et dé -- jà Ré -- demp -- teur en des -- cen -- dant du Ciel,
  il a de son ber -- ceau fait son pre -- mier au -- tel.
}

verseTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 2.
  
}

verseThree = \lyricmode {
  \set stanza = "3."
  
}

verseFour = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 4.
  
}

\score {
  \header {
    title = "LE CHRIST EST NÉ CE SOIR"
    composer = "Harmonisation : Bernard Lallement (1936-2023)"
  }

  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Soprano"
    } \new Voice = "soprano" \soprano
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseThree
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseFour
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Alto"
    } \new Voice = "alto" \alto
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseThree
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "alto" \verseFour
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Ténor"
    } {
      \clef "treble_8"
      \new Voice = "tenor" \tenor
    }
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "tenor" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "tenor" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "tenor" \verseThree
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "tenor" \verseFour
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Basse"
    } {
      \clef bass
      \new Voice = "bass" \bass
    }
  >>
  \layout {\context{\Staff \RemoveAllEmptyStaves}}
  \midi {\tempo 4=70}
}
