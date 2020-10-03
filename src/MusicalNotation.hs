module MusicalNotation where

import Data.List

staffLines = [('G', ' ')
             ,('F', '-')
             ,('E', ' ')
             ,('D', '-')
             ,('C', ' ')
             ,('B', '-')
             ,('A', ' ')
             ,('g', '-')
             ,('f', ' ')
             ,('e', '-')
             ,('d', ' ')
             ,('c', ' ')
             ,('b', ' ')
             ,('a', '-')
             ]

readInput input = (amount, notes)
  where (amountStr:notesStr) = words input
        amount = (read amountStr)::Int
        notes = map readNote notesStr
        readNote (pitch:[])       = (pitch, 1)
        readNote (pitch:duration) = (pitch, (read duration)::Int)

formatNotes _ [] = []
formatNotes line@(pitchInLine, separator) ((pitch, duration):remainingNotes) =
  noteStr ++ remainingStr
  where noteChar = if pitchInLine == pitch then '*' else separator
        noteStr = replicate duration noteChar
        remainingStr = formatNotes line remainingNotes

io input = intercalate "\n" (map formatLine staffLines)
  where (amount, notes) = readInput input
        formatLine line@(pitchInLine, separator) = pitchInLine : ':' : ' ' : formatNotes line notes
