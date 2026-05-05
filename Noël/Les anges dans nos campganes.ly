\version "2.26.0"

global = {
  \key g \major
  \time 2/2
  \autoBeamOff
}

soprano = \fixed c' {
  \global
  \sectionLabel"Couplets"
  \repeat unfold 2 {
    b4 4 4 8[d']4. c'8 b4 g
    b4 8 a b4 8[d']4. c'8 b4 r
  }
  \bar"||" \break \sectionLabel "Refrain"
  d'2 e'8[d' c' b]c'2 d'8[c' b a]b2 c'8[b a g] a4. 8 d4 r
  g-. a-. b-. c'-. b2 a\breathe
  d'2 e'8[d' c' b]c'2 d'8[c' b a]b2 c'8[b a g] a4. 8 d4 r
  g-. a-. b-. c'-. b2(a)g \bar"|."
  
}

alto = \fixed c' {
  \global
  g4 4 4 8[b]4 fis g8[e]d4
  g4 8 8 8[fis]e[d]4 fis g r
  g4 4 4 8[b]4 fis g8[e]d4
  d4 dis8 8 8[e]g[fis]e4 fis d r
  r2 g a8[g fis e]fis2 g8[fis e d]e4.
  8 fis[e d e] fis[g a fis]d4\breathe
  e8 fis g4 a~4 g2 fis4\breathe
  b8[a g fis]e2~4 a8[g fis e]d4~4
  g8[fis e d]c4~8[cis]d[cis]d[e fis d]\breathe
  4-. fis-. g-. a4~4 g(fis2)d
}

tenor = \fixed c {
  \global
  g'4 fis' e' d'4 4. 8 8[c']b4
  d'4 8 8 g4 8[a]4 8[d']4\breathe
  e'8 fis' g'4 fis' e' d'4 4. 8 8[c']b4
  4 a8 8 8[g]8[b]e'4 fis' d' r
  
  R1*3 r4 d'2 c'8 8 b4 c'8[a]e'[d']c'4 d'4 4\breathe
  8[c' b a]b2. e'8[d']c'[b]a2 d'8[c']b[a] g2
  c'8[b]a[g]fis[g]a[b c' a]\breathe
  d'4-. c'-. d'-. e'-. d'2~8[c' b c']b2
}

bass = \fixed c {
  \global
  R1 r2 r4 g4~4 fis8 8 e4 8[fis]4 d g r4
  R1 r2 r4 g4 4 fis4 8[e]e[b,]c4 d g r4
  R1*6 r2
  g2 a8[ g fis e]fis2 g8[fis e d]e2
  fis8[e d e]fis[g a fis]b[c' b a]a4-. c-.\breathe
  d4(g8[b] d'2) g
}

verseSopranoOne = \lyricmode {
  \set stanza = "1."
  Les an -- ges dans nos cam -- pa -- gnes
  ont en -- ton -- né l’hym -- ne des cieux,
  et l’é -- cho de nos mon -- ta -- gnes
  re -- dit ce chant mé -- lo -- di -- eux_:
  \repeat unfold 2 {
    Gló __ _ _ _ _ _ _ ri -- a
    in ex -- cél -- sis Dé -- o_!
  }
}
verseSopranoTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 2.
  Ber -- gers, quit -- tez vos re -- trai -- tes,
  u -- nis -- sez -_vous à leurs con -- certs,
  et que vos ten -- dres mu -- set -- tes
  fas -- sent re -- ten -- tir dans les airs_:
}

verseAltoOne = \lyricmode {
  \set stanza = "1."
  Les an -- ges dans nos cam -- pa -- gnes
  ont en -- ton -- né l’hym -- ne des cieux,
  et l’é -- cho de nos mon -- ta -- gnes
  re -- dit ce chant mé -- lo -- di -- eux_:
  Gló __ _ _ _ _ _ _ ri -- a
  in ex -- cél -- sis Dé -- o_!
  Gló __ _ _ _ _ _ ri -- a
  in ex -- cél -- sis Dé -- o_!
}

verseTenorOne = \lyricmode {
  \set stanza = "1."
  Les an -- ges dans nos cam -- pa -- gnes
  ont en -- ton -- né l’hym -- ne des cieux,
  et l’é -- cho, l'é -- cho de nos mon -- ta -- gnes
  re -- dit ce chant mé -- lo -- di -- eux_:
  Gló -- ri -- a
  in ex -- cél -- sis Dé -- o_!
  Gló __ _ _ _ _ _ _ _ _ _ ri -- a
  in ex -- cél -- sis Dé -- o_!
}
verseTenorTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 2.
  Ber -- gers, quit -- tez vos re -- trai -- tes,
  u -- nis -- sez -_vous à leurs con -- certs,
  et que vos, que vos ten -- dres mu -- set -- tes
  fas -- sent re -- ten -- tir dans les airs_:
}

verseBassOne = \lyricmode {
  Ont en -- ton -- né l’hym -- ne des cieux,
  Re -- dit ce chant mé -- lo -- di -- eux_:
  Gló __ _ _ _ _ _ _ _ ri -- a
  Dé -- o_!
}
verseBassTwo = \lyricmode {
  \override LyricText.font-shape = #'italic
  U -- nis -- sez -_vous à leurs con -- certs,
  fas -- sent re -- ten -- tir dans les airs_:
}
  
\paper {
  print-all-headers = ##t
  tagline = ##f
}
\tocItem \markup {
  \pad-to-box #'(0 . 40) #'(0 . 0)
  "Les anges dans nos campagnes" ""
}
\score {
  \header {
    title = "LES ANGES DANS NOS CAMPAGNES"
    composer = ""
  }
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Soprano"
    } \new Voice = "soprano" \soprano
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseSopranoOne
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseSopranoTwo
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Alto"
    } \new Voice = "alto" \alto
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "alto" \verseAltoOne
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "alto" \verseSopranoTwo
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Ténor"
    } {
      \clef "treble_8"
      \new Voice = "tenor" \tenor
    }
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "tenor" \verseTenorOne
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "tenor" \verseTenorTwo
    
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = "Basse"
    } {
      \clef bass
      \new Voice = "bass" \bass
    }
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "bass" \verseBassOne
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "bass" \verseBassTwo
    
  >>
  \layout {\context{\Staff \RemoveAllEmptyStaves}}
  \midi {\tempo 2=60}
}
