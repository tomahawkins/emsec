module CL
  ( Program  (..)
  , Function (..)
  , Expr     (..)
  , Value    (..)
  ) where

import IR (Var, Literal (..))

data Program = Program [Value] [Function]  -- All top level functions are (can be) recursive.

data Value = Value

data Fun = Fun Var [Var] Expr

data Expr
  = Var Var
  | App Expr [Expr]
  | Let Var Expr Expr
  | Ref Expr
  | Assign Expr Expr
  | Literal Literal

