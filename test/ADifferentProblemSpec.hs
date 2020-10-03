module ADifferentProblemSpec where

import Test.Hspec
import ADifferentProblem

spec :: Spec
spec = do
  describe "io" $ do
    it "sample 1" $ do
      io "10 12\n71293781758123 72784\n1 12345677654321"
        `shouldBe` "2\n71293781685339\n12345677654320\n"
