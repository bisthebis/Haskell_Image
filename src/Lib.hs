module Lib
    ( someFunc
    ) where

import Graphics.Image

checkerBoard :: Image VS RGB Word8
checkerBoard = makeImage (256,256) (\(x,y) -> if mod (div x 16 + div y 16) 2 == 0 then PixelRGB 0 0 0 else PixelRGB 255 255 255)

saveBMP :: Image VS RGB Word8 -> FilePath -> IO ()
saveBMP img path = writeImageExact BMP [] path img

someFunc :: IO ()
someFunc = do
    displayImage checkerBoard
    saveBMP checkerBoard "./pic.bmp"
    getLine
    return ()