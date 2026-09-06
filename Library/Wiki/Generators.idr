module Wiki.Generators

import public QuickCheck
import Compound.BiophysicalAggregation
import Compound.BiologyScaleTransforms
import Core.BoxInt
import Core.Multiset

%default total

public export
Show DnaDoubleHelix where
  show (MkDnaDoubleHelix _ hb) = "DnaDoubleHelix(HBonds=" ++ show hb ++ ")"

public export
Arbitrary DnaDoubleHelix where
  arbitrary = do
    hb <- arbitrary {a = Nat}
    pure (MkDnaDoubleHelix emptyBox hb)

  coarbitrary (MkDnaDoubleHelix _ hb) gen = coarbitrary hb gen

public export
qc : (Arbitrary a, Show a, Testable prop) => (a -> prop) -> QCRes
qc f = quickCheck (MkFn f)

public export
qc2 : (Arbitrary a, Show a, Arbitrary b, Show b, Testable prop) => (a -> b -> prop) -> QCRes
qc2 f = quickCheck (MkFn (\x => MkFn (f x)))
