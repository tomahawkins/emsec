module IR
  ( Expr    (..)
  , Purity  (..)
  , Literal (..)
  , Var
  ) where

data Expr
  = Var     Var
  | Lam     Var Expr
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
  = Bits Int Integer  -- ^ Width and value.

type Var = String

