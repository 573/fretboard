module Guitar where

-- imports
import System.Exit
import Data.List.Split (splitOn)
import Control.Monad   (forever)

-- types
discourse :: [String]
rotate    :: Int -> [a] -> [a]
fret      :: String -> String
line      :: Int -> [String] -> String
isolate   :: Foldable t => t String -> [String]
fretboard :: Foldable t => t String -> IO ()
dispatch  :: Foldable t => String -> t String -> IO ()
menu      :: IO String
main      :: IO b

-- discourse
discourse   =
  ["a", "A", "b", "c", "C", "d", "D", "e", "f", "F", "g", "G"]
rotate n xs =
  case length xs of
    0 -> []
    otherwise -> zipWith const (drop n (cycle xs)) xs

-- display
fret note =
  "[" ++ note ++ "]-"
line n xs =
  concat (map fret (rotate n xs))

-- filter
isolate arg   =
  [if (elem e arg) then e else "_" | e <- discourse]
fretboard arg = do
  putStrLn " 0           3       5       7       9"
  putStrLn (line 7 (isolate arg))
  putStrLn (line 2 (isolate arg))
  putStrLn (line 9 (isolate arg))
  putStrLn (line 5 (isolate arg))
  putStrLn (line 0 (isolate arg))
  putStrLn (line 7 (isolate arg))
  putStrLn " 0           3       5       7       9"

-- control
dispatch command arguments =
  case command of
    "scale"   -> fretboard arguments
    "fret"    -> fretboard discourse
    "exit"    -> exitWith ExitSuccess
    otherwise -> return ()
menu = do
  putStr "> "
  input <- getLine
  return input
main = do
  forever $ do
    input <- menu
    let command : arguments = splitOn " " input
    dispatch command arguments