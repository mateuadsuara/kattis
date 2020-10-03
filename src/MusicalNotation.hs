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
        readNote (note:[])     = (note, 1)
        readNote (note:length) = (note, (read length)::Int)

formatNotes _ [] = []
formatNotes line@(noteInLine, separator) ((note, length):remainingNotes) =
  noteStr : remainingStr
  where noteStr = if noteInLine == note then '*' else separator
        remainingStr = formatNotes line remainingNotes

io input = intercalate "\n" (map formatLine staffLines)
  where (amount, notes) = readInput input
        formatLine line@(noteInLine, separator) = noteInLine : ':' : ' ' : formatNotes line notes
