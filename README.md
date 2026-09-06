# Idris 2 Biology-Wiki

[![Idris 2 Verification](https://img.shields.io/badge/Idris_2-0.8.0-blue.svg)](https://www.idris-lang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Verification suite and literate documentation chapter for **Idris2-Biology**, formalizing genetic translation, cellular dynamics, and hierarchical matter emergence.

## Overview

`Idris2-Biology-Wiki` formalizes biological laws using exact multiset algebra:

- **Ribosomal Translation & Codons**: 3D Voxel codon chains ($AUG \to Met$, $GCU \to Ala$) mapped to amino acid sequences.
- **Hierarchical Matter Ascent**: 7-phase cosmological matter progression verified via `%macro auditHierarchicalMatterAscent`.
- **Universal Algebra TRS**: Term Rewriting System soundness proofs verified via `%macro auditUniversalAlgebraSoundness`.

## Verification & Build

To compile the literate verification suite and execute the test runner binary:

```bash
idris2 --build Idris2-Biology-Wiki.ipkg
./build/exec/lbiology-wiki
```

## Related Repositories

- [Idris2-Biology](https://github.com/justinkelly-ie/Idris2-Biology)
- [Idris2-Universe-Wiki](https://github.com/justinkelly-ie/Idris2-Universe-Wiki)
