module Wiki.Main

import Wiki.BiologyScaleTransformSpec
import System

%default total

main : IO ()
main = do
  putStrLn "=========================================================================="
  putStrLn "   🧬 IDRIS2 DISCRETE SYSTEMS BIOLOGY WIKI VERIFICATION RUNNER 🧬"
  putStrLn "=========================================================================="
  putStrLn ""
  putStrLn "--- PART 1: BIOLOGY ScaleTransform & HYDROGEN BOND COUNT HOMOMORPHISM ---"
  p <- auditBiologyScaleTransformSpecProof
  if p
     then putStrLn "   -> PASS: DNA ScaleTransform -> Hydrogen Bond Count & Homomorphism verified (QuickCheck)."
     else do
       putStrLn "   -> FAIL: Biology ScaleTransform check failed."
       exitWith (ExitFailure 1)

  putStrLn ""
  putStrLn "=========================================================================="
  putStrLn "   ✨ ALL DISCRETE BIOLOGY SUITES PASSED WITH 100% TOTALITY! ✨"
  putStrLn "=========================================================================="
