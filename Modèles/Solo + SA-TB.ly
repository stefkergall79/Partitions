\version "2.26.0"

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
}

soloVoice = \fixed c' {
  \global
  \dynamicUp
}
verseSolo = \lyricmode {
  
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

verseOne = \lyricmode {
  \set stanza = "1."
  
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

verseFive = \lyricmode {
  \set stanza = "5."
  
}

sopranoVoicePart = \new Staff \with {
  instrumentName = "Solo"
  shortInstrumentName = "Sl."
  midiInstrument = "choir aahs"
} { \soloVoice }
\addlyrics { \verseSolo }

choirPart =  \new ChoirStaff <<
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
  <<
    \sopranoVoicePart
    \choirPart
  >>
  \layout {\context{\Staff \RemoveAllEmptyStaves}}
  \midi {\tempo 4=70}
}
