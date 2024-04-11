echoDup :: IO ()
echoDup = getChar >>= (\c -> putChar c >>= (\() -> putChar c))


echoDup' :: IO ()
echoDup' = getChar >>= \c ->
           putChar c >>
           putChar c


echo :: IO ()

--echo = getChar >>= putChar
-- scritture di echo equivalenti
echo = getChar >>= (\c -> putChar c)

echoTwice = echo >> echo

getTwoChars :: IO (Char, Char)
getTwoChars = getChar >>= \c1 ->
              getChar >>= \c2 ->
              return (c1,c2)
