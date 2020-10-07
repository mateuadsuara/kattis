module MusicalNotationSpec where

import Test.Hspec
import Test.QuickCheck
import MusicalNotation
import MusicalNotation2 (musicalNotationCLI)
import Data.List

possibleSongs =
  concat $ map permutations $ subsequences possibleNotes

possibleNotes =
  [pitch:(if length > 1 then show length else "") | pitch <- ['A'..'G'] ++ ['a'..'g'], length <- [1..4]]

notes = do
  pitch <- elements (['A'..'G'] ++ ['a'..'g'])
  length <- elements [1..4]
  return $ pitch:(if length > 1 then show length else "")

songs = listOf1 notes `suchThatMap` \song ->
  Just $ ((show $ length song), (intercalate " " song))

spec :: Spec
spec = parallel $ do
  fdescribe "properties" $ do
    (flip mapM) (take 500000 $ drop 500000 possibleSongs) $ \notes ->
      let notesStr = (intercalate " " notes)
          song     = (show $ length notes) ++ "\n" ++ notesStr
      in it ("works for the song " ++ notesStr) $ do
        (io song) `shouldBe` (musicalNotationCLI notesStr)
    xit "works as version 2" $ do
      withMaxSuccess 1000000 $ property $ forAll songs $ \(length, notes) ->
        let song = length ++ "\n" ++ notes
        in (io song) == (musicalNotationCLI notes)
  describe "io" $ do
    it "no notes" $ do
      io "0\n"
      `shouldBe`
         "G: \n\
         \F: \n\
         \E: \n\
         \D: \n\
         \C: \n\
         \B: \n\
         \A: \n\
         \g: \n\
         \f: \n\
         \e: \n\
         \d: \n\
         \c: \n\
         \b: \n\
         \a: "
    it "one G note" $ do
      io "1\n\
         \G"
      `shouldBe`
         "G: *\n\
         \F: -\n\
         \E:  \n\
         \D: -\n\
         \C:  \n\
         \B: -\n\
         \A:  \n\
         \g: -\n\
         \f:  \n\
         \e: -\n\
         \d:  \n\
         \c:  \n\
         \b:  \n\
         \a: -"
    it "one F2 note" $ do
      io "1\n\
         \F2"
      `shouldBe`
         "G:   \n\
         \F: **\n\
         \E:   \n\
         \D: --\n\
         \C:   \n\
         \B: --\n\
         \A:   \n\
         \g: --\n\
         \f:   \n\
         \e: --\n\
         \d:   \n\
         \c:   \n\
         \b:   \n\
         \a: --"
    it "two notes" $ do
      io "2\n\
         \G F2"
      `shouldBe`
         "G: *   \n\
         \F: --**\n\
         \E:     \n\
         \D: ----\n\
         \C:     \n\
         \B: ----\n\
         \A:     \n\
         \g: ----\n\
         \f:     \n\
         \e: ----\n\
         \d:     \n\
         \c:     \n\
         \b:     \n\
         \a: ----"
