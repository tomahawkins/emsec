module Main 
  ( main
  , Expr    (..)
  , Purity  (..)
  , Literal (..)
  , Var
  ) where

import Data.Int

main :: IO ()
main = return ()

data Expr
  = Lam     Var Expr
  | PredCtc Var Expr
  | FunCtc  Purity Var Expr Expr
  | App     Expr Expr
  | AppCtc  Expr Expr  -- ^ value : contract
  | AppPrim String [Expr]
  | Let     Var Expr Expr
  | LetRec  [(Var, Expr)] Expr
  | Literal Literal
  | Assign  Expr Expr  -- ^ Assign a value to a ref cell.
  | Ref     Expr       -- ^ Get contents of ref cell.

data Purity
  = Pure
  | Impure

data Literal
  = Bool  Bool
  | Int8  Int8
  | Int16 Int16
  | Int32 Int32
  | Int64 Int64

type Var = String

