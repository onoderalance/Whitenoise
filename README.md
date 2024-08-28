# Whitenoise
  An harmonic skiing game controlled wholly by MIDI-input.

# Concept
  Whitenoise is a harmonic skiing game based on MIDI-input through the [GMSSimpleMIDI]https://github.com/RhyminGarfunkle/GMSSimpleMIDI GameMaker implementation of RtMidi. The player controls a skier descending a slope, as well as the terrain of the slope through two octaves of midi control. One octave, the harmony, controls the generation of the terrain based on intervals played. The other octave, the melody, controls the skier who must navigate the generated obstacles of the harmony. Musical ideas played on the keyboard are thus represented on screen by the melodic skier navigating or interating with the harmonic landscape of the mountain.

# How To Play
  Step 1:
  - Unzip Whitenoise.zip
  
  Step 2:
  - Before running Whitenoise.exe, ensure a MIDI keyboard on Channel 1 with at least two channels is plugged in
  
  Step 3:
  - Run Whitenoise.exe
  
  Step 4:
  - The game will ask for notes on the keyboard to be played in four stages before running the main gameplay loop:
  First, play any note so that the keyboard is recognized
  Second, play a note in the harmony octave (the lower of the two octaves you will use generally)
  Third, play a note in the melody octave (the higher of the two octaves you will use generally)
  Fourth, play a note in both octaves simultaneously
  NOTE: The next stage will only proceed once the note is released, so do not hold notes during this stage
  
  Step 5:
  - Have fun!
