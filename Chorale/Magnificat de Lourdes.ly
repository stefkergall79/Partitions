\version "2.24.3"

\header {
  title = "MAGNIFICAT"
  subtitle = \markup{\concat{VI \super ème} ton royal}
  composer = "Ton dit “de Lourdes” "
  arranger = "Harmonisation : J. Besnier"
  tagline = ##f
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \override Staff.Parentheses.font-size = 1
}

psalm = \fixed c' {
  \global
  \once \omit Staff.TimeSignature
  \sectionLabel "Psalmodia"
  f8 g8[a] a\breve c'8 bes a8 g2 \bar "|"
  g\breve a8 bes8[a] g4 f2 \bar "||"
}

soprano = \fixed c' {
  \global
  \sectionLabel "Falsus bordonus"
  c'\breve \bar "|" \cadenzaOff
  f'4(e' d'4 4) c'2. r4
  \cadenzaOn a\breve \bar "|"
  \cadenzaOff d'4(c' bes4 4) a1 \bar "||"
}

alto = \fixed c' {
  \global
  f\breve 4(g a g8[f]) e2. r4
  f\breve 2.(e4) f1^\fermata
}

tenor = \fixed c {
  \global
  a\breve 4(c'2 b4) c'2. r4
  \breve bes4(c' d' c'8[bes]) c'1\fermata
}

bass = \fixed c {
  \global
  f\breve d4(e f g) c2. r4
  f\breve bes4(a g4 4) f1
}

verseOne = \lyricmode {
  \set stanza = "1."
  Ma -- gní -- ficat, ma -- gní _ -- ficat ánima mé -- a Dó -- minum.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  "Et exultávit spíritus" mé -- us "in Déo salutári" mé -- o.
}

verseThree = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 3.
  Qui -- a "respéxit humilitátem an" -- cíl -- læ sú -- æ,
  "ecce enim ex hoc beátam me dícent ómnes gene - " -- ra -- ti -- ó -- nes.
}

verseFour = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 4.
  "Quia fécit míhi mágna qui"\breve pó2. -- tens4 est_:1
  "et sánctum nómen"\breve é1 -- jus.1
}

verseFive = \lyricmode {
  \set stanza = "5."
  Et mi -- "sericórdia éjus a progénie " in pro -- gé -- nies
  "timén" -- ti -- bus é -- um.
}

verseSix = \lyricmode {
  \set stanza = "6."
  "Fécit poténtiam in bráchio" sú -- o_:
  "dispérsit supérbos ménte córdis       " sú -- i.
}

verseSeven = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 7.
  De -- pó -- "suit po" -- téntes de sé -- de,
  "et exal" -- tá -- vit hú -- miles.
}

verseEight = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 8.
   "Esuriéntes implévit" bó -- nis_:
   "et dívites dimísit i" -- ná -- nes.
}

verseNine = \lyricmode {
  \set stanza = "9."
   Sus -- cé -- "pit Israël" púe -- rum sú -- um,
   "recordátus misericór" -- di -- æ sú -- æ.
}

verseTen = \lyricmode {
  \set stanza = "10."
  "Sicut locútus est ad pátres"\breve nós1 -- tros_:1
  "Abraham et sémini éjus in"\breve saé2. -- cu4 -- la.1
}

verseEleven = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 11.
  Gló -- ri -- a Pátri et Fí -- lio
  "et Spirí" -- tu -- i Sán -- cto.
}

verseTwelve = \lyricmode {
  \override LyricText.font-shape = #'italic
  \set stanza = \markup \italic 12.
  "Sicut érat in princípio, et nunc, et       " sém -- per,
  "et in saécula sæculórum." A -- men.
}

\score {
    \new Staff \with {
        midiInstrument = "choir aahs"
    }
      <<
          \new Voice = "psalm" { \voiceOne \psalm }
          \new Lyrics \with{\override LyricText.self-alignment-X = #LEFT
          } \lyricsto "psalm" \verseOne
          \new Lyrics \with{\override LyricText.self-alignment-X = #LEFT
          } \lyricsto "psalm" \verseThree
          \new Lyrics \with{\override LyricText.self-alignment-X = #LEFT
          } \lyricsto "psalm" \verseFive
          \new Lyrics \with{\override LyricText.self-alignment-X = #LEFT
          } \lyricsto "psalm" \verseSeven
          \new Lyrics \with{\override LyricText.self-alignment-X = #LEFT
          } \lyricsto "psalm" \verseNine
          \new Lyrics \with{\override LyricText.self-alignment-X = #LEFT
          } \lyricsto "psalm" \verseEleven

      >>
    \layout {}
    \midi{\tempo 4=90}
}

\markup {\vspace #1 }

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "S." "A." }
      \consists Merge_rests_engraver
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>

    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    } \lyricsto "soprano" \verseTwo
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    } \verseFour
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    }\lyricsto "soprano" \verseSix
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    }\lyricsto "soprano" \verseEight
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    } \verseTen
    \new Lyrics \with {\override LyricText.self-alignment-X = #LEFT
    }\lyricsto "soprano" \verseTwelve

    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "T." "B." }
      \consists Merge_rests_engraver
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout { }
  \midi { \tempo 4=90 }
}
