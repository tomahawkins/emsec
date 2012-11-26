module IR1
  ( Expr    (..)
  , Purity  (..)
  , Lit     (..)
  , Pat     (..)
  , Loc     (..)
  , Var
  ) where

-- | Source locations: file, line, column.
data Loc = Loc String Int Int

data Expr
  = Var     Loc Var
  | Lam     Loc Var Expr
  | PredCtc Loc Var Expr
  | FunCtc  Loc Purity Var Expr Expr  -- ^ purity, input var, domain, dependent codomain.
  | App     Loc Expr Expr
  | AppCtc  Loc Expr Expr  -- ^ value : contract
  | AppPrim Loc String [Expr]
  | Let     Loc Var Expr Expr
  | LetRec  Loc [(Var, Expr)] Expr
  | Lit     Loc Lit
  | Assign  Loc Expr Expr  -- ^ Assign a value to a ref cell, returns unit.
  | Ref     Loc Expr       -- ^ Get contents of ref cell.
  | Case    Loc Expr [(Pat, Expr)]

data Purity
  = Pure
  | Impure

data Lit
  = Unit
  | Bool Bool
  | Bits Int Integer  -- ^ Width and value.

type Var = String

data Pat
  = PVar Var
  | PLit Lit
  | PWildcard
  | PTuple [Pat]
  | PArray [Pat]
  | PAt Var Pat  -- ^ a@pattern
  | PCtor Var [Pat]

