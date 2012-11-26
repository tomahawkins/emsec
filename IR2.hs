-- | Post contract verification.
module IR2
  ( Expr    (..)
  , Lit     (..)
  , Pat     (..)
  , Loc     (..)
  , Var
  , multiArgConvert
  , lambdaLift
  ) where

import IR1 (Loc (..), Lit (..), Pat (..), Var)

import qualified IR1 as IR1 (Expr (..))

data Expr
  = Var     Loc Var
  | App     Loc Expr [Expr]                -- ^ Function applications with multiple arguments.
  | AppPrim Loc String [Expr]
  | Let     Loc Var Expr Expr
  | LetRec  Loc [(Var, [Var], Expr)] Expr  -- ^ Lambda defs w/ multiple arguments.
  | Lit     Loc Lit
  | Assign  Loc Expr Expr                  -- ^ Assign a value to a ref cell, returns unit.
  | Ref     Loc Expr                       -- ^ Get contents of ref cell.
  | Case    Loc Expr [(Pat, Expr)]

-- | Consolidate arguments in function definitions and applications.
multiArgConvert :: Expr -> Expr
multiArgConvert = undefined

-- | Lift lambdas to top.
lambdaLift :: Expr -> Expr
lambdaLift = undefined

