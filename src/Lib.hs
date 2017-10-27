module Lib
    ( someFunc
    ) where

import Graphics.Image

checkerBoard :: Image VS RGB Word8
checkerBoard = makeImage (256,256) (\(x,y) -> if mod (div x 16 + div y 16) 2 == 0 then PixelRGB 0 0 0 else PixelRGB 255 255 255)

save :: IO ()
save = writeImageExact BMP [] "./pic.bmp" checkerBoard

someFunc :: IO ()
someFunc = do
    displayImage checkerBoard
    save
    getLine
    return ()