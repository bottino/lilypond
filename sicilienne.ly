\version "2.18.2"

\header {
  title = "SICILIENNE"
  composer = "Gabriel Fauré"
  arranger = "arang. B. Ottino / D. Owens"
  opus = "Opus 78"
  dedication = "à Monsieur William Henry Squire"
}

up = {\change Staff = "up"}
down = {\change Staff = "down"}

pedal_fis = _\markup \concat \vcenter {F\sharp}
pedal_f = _\markup \concat \vcenter {F\natural}
pedal_ees = _\markup \concat \vcenter {E\flat}
pedal_e = _\markup \concat \vcenter {E\natural}
pedal_aes = _\markup \concat \vcenter {A\flat}
pedal_a = _\markup \concat \vcenter {A\natural}
pedal_bes = _\markup \concat \vcenter {B\flat}
pedal_b = _\markup \concat \vcenter {B\natural}

damp = ^\markup{ \center-column {
  {\override #'(thickness . 1.8)
    \combine \draw-line #'(-1.5 . 0)
    \combine \draw-line #'(0 . -1.5)
    \combine \draw-line #'(0 . 1.5)
    \combine \draw-line #'(1.5 . 0)
    \draw-circle #0.8 #0.2 ##f
 }}} 

stemOff = { \hide Staff.Stem }
stemOn = { \undo \hide Staff.Stem } 

#(define-markup-command (pedal layout props text) (markup?)
  #:properties ((word-space 0.0))
  "Draws a pedal indication"
  (interpret-markup layout props
    #{\markup \vcenter { #text } #}))

\layout {
  \context {
	\PianoStaff
	\consists #Span_stem_engraver
  }
}

cello = \new Staff
  \with {
	instrumentName = #"Cello "
	fontSize = #-3
	\override StaffSymbol.staff-space = #(magstep -3)
  }
{
  \relative {
	\time 6/8 \key g \minor
	\clef "bass" r4 r8 r4 d8\p | g4( bes8) d4( g8) \clef "tenor" |
	bes8.( a16 g8) a4( d,8~)( | d8. c16 e8) d8.( c16 e8) |
	d 4.~ d8 r8 \clef "bass" d,8 | g4( bes8) d4( f8) \clef "tenor" |
	aes8.( g16 f8) g4 \clef "bass" g,8~( | g8. fis16 a8) g8.( fis16 bes8) |
	g4.~ g8 r8 r8 | g,8\p^"pizz." r8 r8 f'8 r8 r8 |
	e8 r8 r8 f8 r8 d'8^"arco"~)( | d8. c16 e8) d8.( c16 e8) |
	d4.~ d8 r8 d,8 | g4( bes8) d4( f8) \clef "tenor" |
	aes8.( g16 f8) g4( f8)\pp | e4( ees8) d4( fis,8) |
	g4.~ g8 r8 r8 |
  }
}

dampD = << \new CueVoice { \stemOff d,16\damp \glissando d'16 d,,16\damp \glissando d'16 \stemOn} {r8 r8} >>
harp = \new PianoStaff 
  \with {
	instrumentName = #"Harp "
  }
<<
  \new Staff = "up" {
	\relative {
	  \key g \minor
	  \clef "treble" \time 6/8
	  s16 \clef "bass" s16 s4  s4. |
	  s4. s4. \clef "treble" |
	  s4. s4. |
	  r8 <f' bes,>8 <e c>8  r8 <f bes,>8 <e c>8 |
	  <fis a, fis>4. fis4.-1 \clef "bass" |
	  s4. s4. |
	  s4. s4. \clef "treble" |
	  e4 ees8\pedal_ees d4 fis8 |
	  g4. r8 r8 d8 |
	  g4 <bes-1 d,-3>8 <d, d'>4 g8 |
	  bes8. a16 g8 a4 d,8 |
	  r8 <f bes,>8 <e c>8  r8 <f bes,>8 <e c>8 |
	   <fis a, fis>4. fis4.-1 \clef "bass" |
	}
  }
  \new Staff = "down" {
	\relative {
	  \time 6/8 \key g \minor \clef "bass" 
	  g,16_\markup { \harp-pedal #"--^|----" } d'16 \up g16 bes16 d8 \down g,,16 d'16 \up g16 bes16 d8 |
	  \down g,,16 d'16 \up g16 bes16 d8 \down f,16 g16 \up bes16 d16 g8 |
	  \down e,16 bes'16 \up d16 g16 bes8 \down f,16 a16 \up d16 f16 a8 \down |
	  bes,,16-4 f'16-2 f8-2 g8-1 bes,16-4 f'16-2 f8-2 g8-1 |
	  d,16\pedal_fis a'16 d16 f16-4 a16-3 d16-2 \dampD r8 |
	  g,16\pedal_f d'16 \up g16 bes16 d8 \down f,16\pedal_ees d'16 \up g,16 bes16 d8 |
	  \down ees,16\pedal_aes f16 \up aes16 c16 f8 \down d,16\pedal_b f16 \up g16 b16 f'8 |
	  \down c,16-4\pedal_bes\pedal_e bes'16-1 bes4-2 d,16 c'16 c4\pedal_fis |
	  g,16 d'16 g16 g16 bes16 d16 g,,16 d'16 bes'16 g16 \up d'8 |
	  \down g,,16 d'16 g16 bes16-4 \up d8 \down f,16\pedal_f g16 bes16 d16-4 \up g8-2 |
	  \down e,16\pedal_e g16 bes16\pedal_a d16 r8 f,16 a16 d16 f16 r8 |
	  bes,,16 f'16 f8 g8 bes,16 f'16 f8 g8 |
	  d,16\pedal_fis a'16 d16 f16-4 a16-3 d16-2 \dampD r8 |
	}
  }
>>

{
  <<
	\cello
	\harp
  >>
}
