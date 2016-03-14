#! /usr/bin/env runhaskell
{-# LANGUAGE DeriveDataTypeable #-}

module Main (main) where

import System.Console.CmdArgs
import Control.Arrow

data WC = WC {chars :: Bool, lines_ :: Bool, words_ :: Bool}
  deriving (Show, Data, Typeable)

wc = WC
  { chars = def &= name "m" &= help "print the byte counts"
  , lines_ = def &= help "print the newline counts"
  , words_ = def &= help "print the word counts" }
  &= help ("Print newline, word, and byte counts for each FILE, " ++
             "and a total line if more than one FILE is specified." ++
             " With no FILE, or when FILE is -, read standard " ++
             "input.  A word is a non-zero-length sequence of " ++
             "characters delimited by white space.")
  &= summary "Like wc but not"


countChars = show . length
countLines = show . length . lines
countWords = show . length . words

flat (a,(b,c)) = " " ++ a ++ " " ++ b ++ " " ++ c

optHandler WC{chars=True} = countChars
optHandler WC{lines_=True} = countLines
optHandler WC{words_=True} = countWords
optHandler _ = flat . ( countLines &&& countWords &&& countChars )

main = cmdArgs wc >>= interact . optHandler
