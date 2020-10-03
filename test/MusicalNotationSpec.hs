module MusicalNotationSpec where

import Test.Hspec
import MusicalNotation

spec :: Spec
spec = do
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
