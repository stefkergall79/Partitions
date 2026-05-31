\version "2.24.3"

global = {
  \key bes \major
  \numericTimeSignature
  \time 6/8
  \partial 8
  \autoBeamOff
}

soprano = \fixed c' {
  \global
  \bar ".|:"
    d8 g4 8 bes g bes d'4(c'8) bes4.
    c'8 d' c' bes4 a8 g4. r4 s8
  \bar ":|."
  \break
  a8 bes c' bes4 a8 g4. f g8 8 8 bes g bes a4. r
  g8 8 8 bes g bes d'4(c'8) bes4. c'8 d' c' bes4 a8 g4. r4 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Ô Croix dres -- sée sur le mon -- de,
  ô Croix de Jé -- sus -_Christ_!
  Fleu -- ve dont l'eau fé -- con -- de
  du cœur ou -- vert a jail -- li_;
  par toi la vie su -- ra -- bon -- de,
  ô Croix de Jé -- sus -_Christ_!
}

verseTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 2.
  Ô Croix, su -- bli -- me fo -- li -- e,
  ô Croix de Jé -- sus -_Christ_!
  Dieu rend par toi la vi -- e
  et nous ra -- chète à grand prix_;
  l'a -- mour de Dieu est fo -- li -- e,
  ô Croix de Jé -- sus -_Christ_!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Ô Croix, sa -- ges -- se su -- prê -- me,
  ô Croix de Jé -- sus -_Christ_!
  Le Fils de Dieu lui -_mê -- me
  jus -- qu'à la mort o -- bé -- it_;
  ton dé -- nue -- ment est ex -- trê -- me,
  ô Croix de Jé -- sus -_Christ_!
}

verseFour = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = "4."
  Ô Croix, vic -- toire é -- cla -- tan -- te,
  ô Croix de Jé -- sus -_Christ_!
  Tu ju -- ge -- ras le mon -- de
  au jour que Dieu s'est choi -- si_;
  Croix à ja -- mais tri -- om -- phan -- te,
  ô Croix de Jé -- sus -_Christ
}

\paper {
  print-all-headers = ##t
  tagline = ##f
}
\tocItem \markup "Ô Coix dressée sur le monde"
\score {
  \header {
    title = "O CROIX DRESSÉE SUR LE MONDE"
    composer = "Jean Servel"
    poet = "Paroles : Saint Louis-Marie Grignon de Montfort"
  }
  \new Staff \with {
      midiInstrument = "choir aahs"
  }{ \soprano }
  \addlyrics {\verseOne}
  \addlyrics {\verseTwo}
  \addlyrics {\verseThree}
  \addlyrics {\verseFour}
  \layout {}
  \midi { \tempo 4.=60 }
}
