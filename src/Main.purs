module Main where

import Prelude
import Data.Int as Int
import Data.Maybe (Maybe(..))
import Effect.Class.Console as Console
import HTTPure as HTTPure
import Node.Process as Process

main :: HTTPure.ServerM
main = do
  portEnv <- Process.lookupEnv "PORT"
  case portEnv >>= Int.fromString of
    Nothing -> mempty
    Just port ->
      HTTPure.serve'
        { port, hostname: "0.0.0.0", backlog: Nothing }
        (\_ -> HTTPure.ok "hello world")
        (Console.log $ "Running on port: " <> show port)
