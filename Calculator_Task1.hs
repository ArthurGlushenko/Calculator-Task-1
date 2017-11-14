--["1", "+", "1"] -> 2
--["1", "-", "1"] -> 0
--["2", "*", "3"] -> 6
--["4", "/", "2"] -> 2
--["1", "+", "30", "-", "2"] -> 29
--["2", "-", "1", "*", "2", "+", "-1"] -> -1

--Optional: Add support for ()
--Optional: Use raw string as a parameter and implement parsing yourself "2 - 1 * 2 + 1" -> 1


data Tree a = Node a (Tree a) (Tree a) | Leaf a deriving Show


-- calc l = calcTree (toTree l)


calc tree = calcTree $ toTree tree

toTree tree = toTree' $ reverse tree

toTree' (a:[]) = Leaf a
toTree' (a:op:rest) = Node op (toTree' rest) (Leaf a)


-- toTree l = Node (l !! 1) (Leaf (l !! 0)) (Leaf (l !! 2))




calcTree (Leaf a) = toNum a
calcTree (Node op a b) = (operation op)  (calcTree a) (calcTree b)

--calc (a, op, b) = (operation op) (toNum a) (toNum b)


toNum num = read num :: Integer

operation s
  | s == "+" = (+)
  | s == "-" = (-)
  | s == "*" = (*)
  | s == "/" = div
  
  
  
----- Не совсем рабочая -----
  
  


-- Проверка:
--  calc ["5", "+", "2"]
--  calc ["5", "-", "2"]
--  calc ["5", "*", "2"]
--  calc ["8", "/", "2"]
--  calc ["4", "+", "30", "-", "18"]