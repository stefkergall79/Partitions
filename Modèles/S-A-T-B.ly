\version "2.26.0"

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
}

soprano = \fixed c' {
  \global
  
}

alto = \fixed c' {
  \global
  
}

tenor = \fixed c {
  \global
  
}

bass = \fixed c {
  \global
  
}

verseSoprano = \lyricmode {
  
}

verseAlto = \lyricmode {
  
}

verseTenor = \lyricmode {
  
}

verseBass = \lyricmode {
  
}

\paper {
  print-all-headers = ##t
  tagline = ##f
}
\tocItem \markup {
  \pad-to-box #'(0 . 40) #'(0 . 0)
  "" ""
}
\score {
  \header {
    title = ""
    composer = ""
  }
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Soprano"
    } \new Voice = "soprano" \soprano
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseSoprano
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Alto"
    } \new Voice = "alto" \alto
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "alto" \verseAlto
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Ténor"
    } {
      \clef "treble_8"
      \new Voice = "tenor" \tenor
    }
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "tenor" \verseTenor
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Basse"
    } {
      \clef bass
      \new Voice = "bass" \bass
    }
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "tenor" \verseBass
  >>
  \layout {\context{\Staff \RemoveAllEmptyStaves}}
  \midi {\tempo 4=70}
}
