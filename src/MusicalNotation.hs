module MusicalNotation where

import Data.List

notes = ['G', 'F', 'E', 'D', 'C', 'B', 'A',
         'g', 'f', 'e', 'd', 'c', 'b', 'a']

io _ = intercalate "\n" (map format notes)
  where format note = note : ": "
