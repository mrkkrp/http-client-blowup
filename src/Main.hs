{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Data.Foldable
import qualified Data.ByteString.Lazy.Char8 as BS8
import           Data.Default
import           Network.HTTP.Client
import           Network.HTTP.Client.TLS
import Network.HTTP.Types.Status (statusCode)

main :: IO ()
main = do
  manager <- newManager tlsManagerSettings
  request <- parseRequest "https://www.avito.ru/ekaterinburg/avtomobili/chevrolet_cruze_2012_1030458230"
  response <- httpLbs request manager
  putStrLn $ "The status code was: " ++ (show $ statusCode $ responseStatus response)
  BS8.putStrLn (responseBody response)
