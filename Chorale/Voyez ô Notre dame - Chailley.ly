\version "2.24.3"

\header {
  title = "VOYEZ Ô NOTRE-DAME"
  composer = "Mélodie populaire de Guyenne"
  arranger = "Harmonisation : Bernard Lallement (1936-2023)"
  poet = "Paroles : Jacques Chailley (1910-1999)"
  tagline = ##f
}

#(set-global-staff-size 21)

global = {
  \key c \major
  \time 9/8
  \partial 8
  \autoBeamOff
}

soprano = \fixed c' {
  \global
  % En avant la musique.
  e8 e[a] b c'4 b8 g4. a4 e8 8[a] b c'[b] g a4. r4
  e8 e[a] b c'[b] c' d' c' b a4 b16([a] g4.) e4. r4
  e8 e[a] b c'[b] c' d'4. c' a4 b16([a] g4.) a2. r4 \bar "|."
}

alto = \fixed c' {
  \global
  % En avant la musique.
  e8 4 g8 8[a] f e4(d8) c4 e8 4 g8 8[f] e e4. r4
  e8 4 g8 4 e8 f e d c4 f8(e4 d16[c]) b,4. r4
  e8 e4 g8 4 e8 f4. e c4 f8(e4 d8) c2. r4
}

tenor = \fixed c' {
  \global
  % En avant la musique.
  c8 4 d8 e4 d8 b,4. a,4 b,8 c4 d8 e[d] b, c4. r4
  c8 c4 d8 e4 c8 a,8 g,8 8 c4 d16([c] b,4.) g,4. r4
  c8 4 d8 e4 c8 a,4. g, c4 d16([c] b,4.) a,2. r4
}

bass = \fixed c {
  \global
  % En avant la musique.
  a8 4 g8 c4 d8 e4. f4 g8 a4 g8 c[d] e a,4. r4
  a8 4 g8 c[e] a d e e f4 d8(e4.) 4. r4
  a8 4 g8 c[e] a d4. e f4 d8(e4.) <e a,>2. r4

}

verseOne = \lyricmode {
  \set stanza = "1."
  % Ajouter ici des paroles.
  Voy -- ez ô No -- tre_- Da -- me, vos en -- fants de -- vant vous.
  Ils vien -- nent vous pri -- er, Gra -- ti -- a Ple -- na_;
  vous les é -- cou -- te -- rez, Ma -- ter Al -- ma.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Ajouter ici des paroles.
  Ils vou -- draient que leur â -- me soit tou -- jours belle pour vous_;
  et leur vie à vos yeux, Gra -- ti -- a Ple -- na,
  comme un re -- flet de Dieu, Ma -- ter Al -- ma.
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
        midiInstrument = "choir aahs"
        instrumentName = "S."
    } \new Voice = "soprano" \soprano
    \new Lyrics \with { \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
    \new Lyrics \with { \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseTwo

    \new Staff \with {
        midiInstrument = "choir aahs"
        instrumentName = "A."
    } \new Voice = "alto" \alto
    \new Lyrics \with { \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "alto" \verseOne
    \new Lyrics \with { \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "alto" \verseTwo

    \new Staff \with {
        midiInstrument = "choir aahs"
        instrumentName = "T."
    } {
      \clef "treble_8"
      \new Voice = "tenor" \tenor
    }
    \new Lyrics \with { \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "tenor" \verseOne
    \new Lyrics \with { \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "tenor" \verseTwo

    \new Staff \with {
        midiInstrument = "choir aahs"
        instrumentName = "B."
    } {
      \clef bass
      \new Voice = "bass" \bass
    }
  >>
  \layout { }
  \midi { \tempo 4=85 }
}

\markup {
  \column {
    \line { \bold 3. Ô vous l'Amour immense,}
          "    Rendez leur cœur plus grand,"
          "    Et d'amour débordant, Gratia Plena,"
          "    Comme un reflet de Dieu, Mater Alma."

      }
  \hspace #5
  \column {
    \line { \bold 4. Accordez-leur la grâce,}
          "    Leur service achevé,"
          "    D'accueillir ce moment, Gratia Plena,"
          "    Sans peur, sereinement, Mater Alma."
  }
}
