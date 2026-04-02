\version "2.24.4"

\header {
  title = "ADORÉMUS"
  composer = "Michael Georg Haller (1840-1915)"
  % Supprimer le pied de page par défaut
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
}

global = {
  \key d \major
  \time 4/4
}

soprano = \fixed c' {
  \global
  % En avant la musique.
  fis2.^\pp 4 g1\espressivo fis2 r4 a^\<~4 4 b2 cis'4\! 4 d'4. 8 cis'4 b2 a4 1^\> 1\!\fermata\bar "||"

  \break\cadenzaOn fis\breve \cadenzaOff \bar"||"
  b2 a4.( g8 fis1\fermata)\bar "||"
  \cadenzaOn fis\breve \cadenzaOff \bar"||"
  a4.~8 g4.( fis8 e1\fermata) \bar"|."
}

alto = \fixed c' {
  \global
  % En avant la musique.
  d2. 4 1 2 r4 fis~4 e4 fis(gis) a4 g4 fis4. 8 a4 g2 fis4 e1  fis1

  d\breve 2 cis(d1) d\breve cis4.~8 b,2(cis1)
}

tenor = \fixed c {
  \global
  % En avant la musique.
  a2. 4 b1\espressivo a2 r4 d'^\<~4 e'4 d'2 e'4\! 4 d'4. e'8 fis'4 d'2 4 4^\>(cis'8 b cis'2) d'1\!\fermata

 a\breve g2 e( s1)\fermata d\breve fis4.~8 d2(a1)\fermata
}

bass = \fixed c {
  \global
  % En avant la musique.
  d2. 4 g1 d2 r4 d'4~4 cis'4 b2 a4 4 b4. 8 fis4 g2 d4 a,1 d1

  d\breve g,2 a,(d1) b,\breve fis,4.~8 g,2(a,1)
}

verseOne = \lyricmode {
  % Ajouter ici des paroles.
  A2. -- do4 -- ré1 -- mus2. in2 æ4 -- tér2 -- num4 San -- ctís4. -- si8 -- mum4 Sa2 -- cra4 -- mén1 -- tum.1
  \set stanza = "      1."
  "Quam dilécta tabernácula tua  //  Dómine vir-       "\breve tú2 -- tum_;1.
  "concupíscit, et déficit ánima mea  //  in átria        "\breve Dó4. -- mi8 -- ni.1.
}

verseTwo = \lyricmode {
  1*8
  \set stanza = \markup { \italic 2.}
  \markup { \italic {Cor meum, et caro }}\breve \markup { \italic me}2 -- \markup { \italic a ;}1.
  \markup { \italic {exsultavérunt in Deum}}\breve \markup { \italic vi}2 -- \markup { \italic vum.}1.
}

verseThree = \lyricmode {
  1*8
  \set stanza = "3."
  "Etenim passer invénit sibi"\breve do2 -- mum_;1.
  "et turtur nidum sibi  //  ubi ponat pullos"\breve su2 -- os.1.
}

verseFour = \lyricmode {
  1*8
  \set stanza = \markup { \italic 4.}
  \markup { \italic {Altária tua, Dómine vir-}}\breve \markup { \italic tú}2 -- \markup { \italic tum ;}1.
  \markup { \italic {rex meus et Deus}}\breve \markup { \italic me}2 -- \markup { \italic us.}1.
}

verseFive = \lyricmode {
  1*8
  \set stanza = "5."
  "Beáti qui habítant in domo tua,"\breve Dó2 -- mi2 -- ne_;1
  "in sǽcula sæculórum lau-"\breve dá4. -- bunt8  te.1.
}


versete = \lyricmode {
  1*8
  \markup { \italic B.F. }
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      \consists Merge_rests_engraver
      instrumentName = \markup \center-column { "S." "A." }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    } \verseOne
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    }\verseTwo
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    }\verseThree
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    }\verseFour
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    }\verseFive
    \new Staff \with {
      midiInstrument = "choir aahs"
      \consists Merge_rests_engraver
      instrumentName = \markup \center-column { "T." "B." }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
    \new Lyrics\versete
  >>
  \layout { }
  \midi {
    \tempo 4=90
  }
}
