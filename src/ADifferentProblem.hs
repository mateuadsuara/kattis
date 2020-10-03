module ADifferentProblem where

readInput = (map read) . words

solve [] = []
solve (a:b:rest) = abs(a - b):(solve rest)

writeOutput = unlines . (map show)

io = (writeOutput . solve . readInput)

main = interact io
