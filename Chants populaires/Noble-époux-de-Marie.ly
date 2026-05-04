\version "2.26.0"

\header {
  title = "NOBLE ÉPOUX DE MARIE"
  composer = "Jean-Noël Laprise (né en 1945)"
  arranger = "Harmonisation : Stéphane Kergall (né en 2007)"
  tagline = ##f
}

global = {
  \key d \major
  \numericTimeSignature
  \time 6/8
  \autoBeamOff
}

soprano = \fixed c' {
  \global
  % En avant la musique.
  \sectionLabel "Couplets"
  fis4 fis8 fis e fis
  a4(b8) a4.
  d4 d8 d cis d
  e4. r
  fis4 fis8 fis e fis
  a4(b8) a4.
  d'4 cis'8 b cis' b
  a4 r8\break \bar "||"
  \sectionLabel "Refrain"
  a4 fis8 a4 fis8
  a b a g4.
  g4 e8 g4 e8
  g a g fis4.
  d'4 cis'8 b4 a8
  a g e d4. \bar "|."
}

alto = \fixed c' {
  \global
  % En avant la musique.
  d4 d8 d cis d
  fis4. fis
  b,4 b,8 b, a, b,
  cis4. r
  d4 d8 d d d
  fis4. fis
  g4 e8 8 8 8
  e4 r8
  fis4 d8 fis4 d8
  fis g fis e4.
  e4 8 4 8
  e fis e d4.
  fis4 8 g4 fis8
  e a, a, a,4.
}

tenor = \fixed c {
  \global
  % En avant la musique.
  a4 a8 a a a
  d'4. cis'
  b4 g8 g a g
  a4. r
  a4 a8 a a a
  d'4. cis'
  b4 b8 8 cis'8 b8
  cis'4 r8
  
  d'4 8 4 8 a g a
  b4. b4 g8
  b4 g8 b a g
  a4. a4 a8
  d'4 8 cis' b a fis4.
}

bass = \fixed c {
  \global
  % En avant la musique.
  d4 8 8 8 8
  fis4. 4.
  b,4 8 d cis d
  e4. r
  d4 8 8 8 8
  a,4. 4.
  g,4 8 8 8 8
  a,4 r8 d4 d8
  d4 8 8 8 8
  b4. b,4 b,8
  b,4 b,8 b, cis8 8
  d4. 4 8
  4 8 cis8 8 8
  d4.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Noble é -- poux de Ma -- ri -- e,
  digne ob -- jet de nos chants,
  no -- tre cœur vous sup -- pli -- e,
  veil -- lez sur vos en -- fants_!
  Veil -- lez, veil -- lez sur vos en -- fants,
  veil -- lez, veil -- lez sur vos en -- fants,
  veil -- lez, veil -- lez sur vos en -- fants_!
}

verseTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 2.
  Le Sau -- veur_ sur la ter -- re,
  re -- çut vos soins tou -- chants_;
  vous qu'il nom -- ma son pè -- re,
  veil -- lez sur vos en -- fants_!
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
    \new Staff \with {
      midiInstrument = "choir aahs"
      \consists Merge_rests_engraver
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout { }
  \midi {\tempo 4.=60 }
}

\markup \fill-line {
  \null
  \column {
     \line { \bold \italic "3-"
       \column {
         "Témoin de sa naissance,"
         "Et de ses jeunes ans,"
         "Gardien de son enfance,"
         "Veillez sur vos enfants !"
     }}
     \vspace #1
     \line { \bold \italic "4-"
       \column {
         "Au jour de la colère,"
         \line {Vous \concat{ravît \italic \bold es } aux tyrans}
         "Le Sauveur et sa Mère ;"
         "Veillez sur vos enfants !"
      }}
      \vspace #1
      \line { \bold \italic "5-"
        \column {
          "Vous dont l'obéissance,"
          "En ces dangers pressants,"
          "Devint leur providence,"
          "Veillez sur vos enfants !"
        }}
  }
  \hspace #0.1
  \column {
    \line { \bold \italic "6-"
      \column {
        "Vous dont la main féconde"
        "A nourri si longtemps"
        "Le Créateur du monde,"
        "Veillez sur vos enfants !"
    }}
    \vspace #1
    \line { \bold \italic "7-"
      \column {
        "Que votre main bénisse,"
        "Ô Patron des mourrants,"
        "Mon dernier sacrifice ;"
        "Veillez sur vos enfants !"
    }}
    \vspace #1
    \line { \bold \italic "8-"
      \column {
        "Votre amour nous rassemble :"
        "Gardez-nous innocents !"
        "Nous vous prions ensemble :"
        "Veillez sur vos enfants !"
    }}
  }
  \null
}