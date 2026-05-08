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

verseOneSoprano = \lyricmode {
  \set stanza = "1."
  
}

verseTwoSoprano = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 2.
  
}

verseThreeSoprano = \lyricmode {
  \set stanza = "3."
  
}

verseFourSoprano = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 4.
  
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
      instrumentName = "S."
      \consists "Ambitus_engraver"
    } \new Voice = "soprano" \soprano
    \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseOneSoprano
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseTwoSoprano
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseThreeSoprano
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseFourSoprano
      
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "A."
      \consists "Ambitus_engraver"
    } \new Voice = "alto" \alto
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "alto" \verseAlto
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "T."
      \consists "Ambitus_engraver"
    } {
      \clef "treble_8"
      \new Voice = "tenor" \tenor
    }
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "tenor" \verseTenor
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "B."
      \consists "Ambitus_engraver"
    } {
      \clef bass
      \new Voice = "bass" \bass
    }
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "bass" \verseBass
  >>
  \layout {}
  \midi {\tempo 4=70}
}
