module Basic.AdditionSpec (main, spec) where

import Test.Hspec
import Basic.Addition

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Addition" $ do
    it "sums the adding to itself" $ do
      (solve 1) `shouldBe` 2