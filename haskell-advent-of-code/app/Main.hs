module Main where

import Options.Generic
import Data.Text.IO as TIO

data Day = P1 | P2 deriving (Generic, Show)

instance ParseRecord Day

part1 :: Text -> Text
part1 = id

part2 :: Text -> Text
part2 = id

main :: IO ()
main = do
  options <- getRecord "Advent of Code"
  let fn = case (options :: Day) of
              P1 -> part1
              P2 -> part2
  TIO.getContents >>= print . fn
