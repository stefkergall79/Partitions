\version "2.24.4"

\header {
  title = "O FILII ET FILIÆ"
  composer = "Jean Tisserand (XVe)"
  arranger = "Harmonisation : J.B."
  % Supprimer le pied de page par défaut
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
}

global = {
  \key c \major
  \numericTimeSignature
  \time 3/4
  \tempo "Allegro"
  \partial 4
}

soprano = \fixed c' {
  \global
  % En avant la musique.
  \sectionLabel "Couplet"
  \repeat unfold 2 {a4 c'2 d'4 e'2 c'4 d'(c') b a2}
  4 2 b4 a( gis) a b2 4 e2 b4 c' b2 a\bar "||"\break
  \sectionLabel "Refrain"
  a4 2 b4 a( gis) a b2 4 e2 b4 c' b2 a\bar "||"
}

alto = \fixed c' {
  \global
  % En avant la musique.
  a4 e2 g4 2 a4 f(e) d c2
  e4 2 a4 gis2 a4 b(a) gis a2
  e4 d(e) f e2 4 2 dis4 e2 4 4 4.(d8) c2

  e4 f2 4 e2 4 2 dis4 e2 gis4 a2 gis4 e2
}

tenor = \fixed c {
  \global
  % En avant la musique.
  a4 c'2 b4 c'2 a4 2 gis4 a2
  c'4 2 b4 c'(b) a f'(e') d' c'2
  4 d'( c') d' c'(b) a gis2 fis4 gis2 4 a2 gis4 a2

  c'4 2 d'4 c'(b) a fis(gis) a gis2 e'4 4 4.(d'8) c'2
}

bass = \fixed c {
  \global
  % En avant la musique.
  a4 2 g4 c2 f4 d(e) e a,2
  a4 a g f e2 f4 d(e) e a,2
  a8(g) f4(e) d e4.(d8) c4 b,2 4 e2 8[d] c[d] e2 a,

  a4 f(e) d e(d) c b,2 4 e2 4 a,8[c] e2 a,2

}

verseOne = \lyricmode {
  \set stanza = "1."
  % Ajouter ici des paroles.
  O fi -- li -- i et fi -- li -- æ,
  Rex cæ -- lés -- tis, Rex gló -- ri -- æ,
  mór -- te sur -- ré -- xit hó -- di -- e. Al -- le -- lú -- ia.
  Al -- le -- lú -- ia, al -- le -- lú -- ia, al -- le -- lú -- ia.
}

verseTwo = \lyricmode {
  \set stanza = "3."
  % Ajouter ici des paroles.
  In ál -- bis sé -- dens An -- ge -- lus,
  re -- spón -- dit mu -- li -- é -- ri -- bus,
  qui -- a sur -- ré -- xit Dó -- mi -- nus. Al -- le -- lú -- ia.
}

verseThree = \lyricmode {
  \set stanza = "5."
  % Ajouter ici des paroles.
  Sed Io -- án -- nes A -- pós -- to -- lus
  cu -- cúr -- rit Pé -- tro cí -- ti -- us,
  ad se -- púl -- crum vé -- nit pri -- us. Al -- le -- lú -- ia.
}

\score {\new ChoirStaff <<
      \new Staff \with {
        midiInstrument = "choir aahs"
        instrumentName = \markup \center-column { "S." "A." }
      } <<
        \new Voice = "soprano" { \voiceOne \soprano }
        \new Voice = "alto" { \voiceTwo \alto }
      >>

      \new Lyrics \with { \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseOne
      \new Lyrics \with { \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseTwo
      \new Lyrics \with { \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseThree

      \new Staff \with {
        midiInstrument = "choir aahs"
        instrumentName = \markup \center-column { "T." "B." }
      } <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
  >> >>
  \layout { }
  \midi {\tempo 4=100}
}

\markup {
  \column {
      \line { \bold "1."
      \column {
      "O filii et filiæ,"
      "Rex cæléstis, Rex glóriæ,"
      "Mórte surréxit hódie. All."
      }}

      \vspace #1
      \italic \line { \bold "2."
      \column {
      "Et María Magdaléne,"
      "Et Jacóbi et Salóme,"
      "Venérunt córpus úngere. All."
      }}

      \vspace #1
      \line { \bold "3."
      \column {
      "In álbis sédens Angelus,"
      "Respóndit muliéribus,"
      "Quia surréxit Dóminus. All."
      }}

      \vspace #1
      \italic \line { \bold "4."
      \column {
      "A Magdaléna móniti,"
      "Ad óstium monuménti"
      "Dúo cúrrunt discípuli. All."
      }}
  }

  \hspace #1
  \column {
      \line { \bold "5."
      \column {
      "Sed Joánnes Apóstolus"
      "Cucúrrit Pétro cítius,"
      "Ad sepúlcrum vénit prius. All."
      }}

      \vspace #1
      \italic \line { \bold "6."
      \column {
      "Discípulis adstántibus,"
      "In médio stétit Chrístus,"
      "Dícens : Pax vóbis ómnibus. All."
      }}

      \vspace #1
      \line { \bold "7."
      \column {
      "Postquam audívit Dídymus,"
      "Quia surréxerat Jésus,"
      "Remánsit fíde dúbius. All."
      }}

      \vspace #1
      \italic \line { \bold "8."
      \column {
      "Víde, Thóma, víde látus ;"
      "Víde pédes, víde mánus,"
      "Nóli ese incrédulus. All."
      }}
  }


  \hspace #1
  \column {
      \line { \bold "9."
      \column {
      "Quando Thómas Chrísti látus,"
      "Pédes vídit atque mánus,"
      "Díxit : Tu es Déus méus. All."
      }}

      \vspace #1
      \italic \line { \bold "10."
      \column {
      "Beáti qui non vidérunt,"
      "Et fírmiter credidérunt :"
      "Vítam ætérnam habébunt. All."
      }}

      \vspace #1
      \line { \bold "11."
      \column {
      "In hoc fésto sanctíssimo,"
      "Sit laus et jubilátio :"
      "Benedicámus Dómino. All."
      }}

      \vspace #1
      \italic \line { \bold "12."
      \column {
      "De quíbus nos humíllimas,"
      "Devótas atque débitas"
      "Deo dicámus gratias. All."
      }}
  }
}

