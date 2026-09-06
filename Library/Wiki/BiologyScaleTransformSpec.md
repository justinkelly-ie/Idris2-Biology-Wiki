# 🧬 Biology ScaleTransform Specification

Documents and verifies the open `ScaleTransform` typeclass properties for DNA Double Helices mapped to Hydrogen Bond Counts.

```idris
module Wiki.BiologyScaleTransformSpec

import Core.ScaleTransform
import Core.Multiset
import Compound.BiophysicalAggregation
import Compound.BiologyScaleTransforms
import Wiki.Generators

%default total

||| Property 1: DNA Double Helix ScaleTransform Matches Hydrogen Bond Count
public export
prop_dnaScaleTransformMatch : DnaDoubleHelix -> Bool
prop_dnaScaleTransformMatch helix@(MkDnaDoubleHelix _ hb) =
  let count : Nat = scaleTransform helix
  in cast {from=Nat} {to=Integer} count == cast {from=Nat} {to=Integer} hb

||| Property 2: ScaleTransform Monoid Additivity: T(h1 + h2) == T(h1) + T(h2)
public export
prop_dnaScaleTransformAdditivity : Nat -> Nat -> Bool
prop_dnaScaleTransformAdditivity hb1 hb2 =
  let h1 = MkDnaDoubleHelix emptyBox hb1
      h2 = MkDnaDoubleHelix emptyBox hb2
      hSum = MkDnaDoubleHelix emptyBox (hb1 + hb2)
      tSum = scaleTransform hSum
      t1 = scaleTransform h1
      t2 = scaleTransform h2
  in cast {from=Nat} {to=Integer} tSum == cast {from=Nat} {to=Integer} (t1 + t2)

||| QuickCheck execution runner for Biology ScaleTransform Spec
public export
auditBiologyScaleTransformSpecProof : IO Bool
auditBiologyScaleTransformSpecProof = do
  let r1 = qc prop_dnaScaleTransformMatch
  let r2 = qc2 prop_dnaScaleTransformAdditivity
  pure (r1.pass == Just True && r2.pass == Just True)
```
