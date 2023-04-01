module PurerlAlias.ModuleUtilities
  ( pureScriptModuleToErlangModule
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Maybe as Maybe
import Data.Newtype (wrap)
import Data.String (CodePoint, Pattern)
import Data.String as String
import Effect (Effect)
import Erl.Atom (Atom)
import Erl.Atom as Atom
import Erl.Data.List (List)

pureScriptModuleToErlangModule :: String -> Atom
pureScriptModuleToErlangModule module' = do
  module'
    # stripPrefixIfPresent (wrap "Elixir.")
    # String.split (wrap ".")
    # map lowerCaseFirstLetter
    # String.joinWith "_"
    # (_ <> "@ps")
    # Atom.atom

stripPrefixIfPresent :: Pattern -> String -> String
stripPrefixIfPresent prefix s = do
  s # String.stripPrefix prefix # Maybe.fromMaybe s

lowerCaseFirstLetter :: String -> String
lowerCaseFirstLetter s = modifyFirstLetter lowerCaseLetter s

modifyFirstLetter :: (CodePoint -> CodePoint) -> String -> String
modifyFirstLetter f s =
  case String.uncons s of
    Just { head, tail } -> head # f # String.singleton # (_ <> tail)
    Nothing -> s

foreign import lowerCaseLetter :: CodePoint -> CodePoint
foreign import wildcard :: String -> Effect (List String)
