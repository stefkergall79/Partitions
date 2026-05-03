\version "2.24.3"

global = {
  \key d \major
  \autoBeamOff
  \partial 2.
  \once \omit Staff.TimeSignature
}

soprano = \fixed c' {
  \global
  \sectionLabel "Refrain"
  \cadenzaOn
  d'4 4 4 2 \bar"|"
  4 cis' d' b2 \bar"|"
  4 4 4 2 \bar"|"
  4 a b cis'2 \bar"|"
  d'4 4 2 \bar"|"
  4 cis'4. d'8 2 \bar "||" \break
  \cadenzaOff \time 3/4 \sectionLabel "Couplets" \once \omit Score.MetronomeMark \tempo 2.=60
  fis4 4 4 b2. cis'4 d' cis' b2.
  fis4 4 4 a2. g4 fis e d2
  fis4 4 e d d(cis) b, fis2. \bar "||"
}

alto = \fixed c' {
  \global
  fis4 g a b2
  a4 g fis g2
  dis4 e fis g2
  fis4 e gis a2
  fis4 \once \omit Accidental g a2 
  b4 a4(g8) fis8 2
}

bass = \fixed c {
  \global
  d4 e fis g2
  fis4 e d g2
  b,4 cis dis e2
  \once \omit Accidental d4 cis b, a,2
  d4 e fis2
  g4 a4. d8 2
  s4
}

verseOne = \lyricmode {
  Lau -- da, Si -- on, Sal -- va -- to -- rem,
  lau -- da du -- cem et pas -- to -- rem,
  in hym -- nis et can -- ti -- cis.
  \set stanza = "1."
  Quan -- tum po -- tes, tan -- tum au -- de,
  qui -- a ma -- jor om -- ni lau -- de
  nec lau -- da -- re suf -- fi -- cis.
}

verseTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \repeat unfold 23 \skip1
  \set stanza = \markup \italic 2.
  Lau -- dis the -- ma spe -- ci -- a -- lis,
  Pan -- is vi -- vus et vi -- ta -- lis
  ho -- di -- e pro -- po -- ni -- tur.
}

verseThree = \lyricmode {
  \repeat unfold 23 \skip1
  \set stanza = "3."
  Quem in sa -- cræ men -- sa ce -- næ
  tur -- bæ fra -- trum du -- o -- de -- næ
  da -- tum non am -- bi -- gi -- tur.
}

verseFour = \lyricmode {
  \override LyricText.font-shape = #'italic
  \repeat unfold 23 \skip1
  \set stanza = \markup \italic 4.
  Sit laus ple -- na, sit so -- no -- ra_;
  sit ju -- cun -- da, sit de -- co -- ra_;
  men -- tis ju -- bi -- la -- ti -- o.
}

verseFive = \lyricmode {
  \repeat unfold 23 \skip1
  \set stanza = "5."
  In hac men -- sa no -- vi Re -- gis,
  no -- vum Pa -- scha no -- væ le -- gis,
  pha -- se ve -- tus ter -- mi -- nat.
}

verseSix = \lyricmode {
  \override LyricText.font-shape = #'italic
  \repeat unfold 23 \skip1
  \set stanza = \markup \italic 6.
  Quod in ce -- na Chris -- tus ges -- sit,
  fa -- ci -- en -- dum hoc ex -- pres -- sit,
  in su -- i me -- mo -- ri -- am.
}

verseSeven = \lyricmode {
  \repeat unfold 23 \skip1
  \set stanza = "7."
  Doc -- ti sa -- cris ins -- ti -- tu -- tis,
  pa -- nem, vi -- num in sa -- lu -- tis
  con -- se -- cra -- mus hos -- ti -- am.
}

verseEight = \lyricmode {
  \override LyricText.font-shape = #'italic
  \repeat unfold 23 \skip1
  \set stanza = \markup \italic 8.
  Dog -- ma da -- tur chris -- ti -- a -- nis,
  quod in car -- nem tran -- sit pan -- is
  et vi -- num in san -- gui -- nem.
}

\paper {
  print-all-headers = ##t
  tagline = ##f
}
\tocItem \markup "Lauda Sion"
\score {
  \header {
    title = "LAUDA SION"
    composer = "Paroles : Saint Thomas d'Aquin (~1225-1274)"
  }
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
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseThree
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseFour
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseFive
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseSix
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseSeven
      \new Lyrics \with {
        \override VerticalAxisGroup.staff-affinity = #CENTER
      } \lyricsto "soprano" \verseEight
      
      \new Staff \with {
        midiInstrument = "choir aahs"
        \consists Merge_rests_engraver
      } << \clef bass \bass >>
  >>
  \layout {\context{\Staff \RemoveAllEmptyStaves}}
  \midi {\tempo 4=70}
}

