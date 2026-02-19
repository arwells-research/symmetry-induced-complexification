# Symmetry-Induced Complexification of Distinguishability Representation
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18692887.svg)](https://doi.org/10.5281/zenodo.18692887)

**Author:** A. R. Wells  
**Affiliation:** Dual-Frame Research Group  
**License:** CC BY 4.0 (paper), MIT (repository)  
**Contact:** No solicitation for correspondence or media contact  
**Paper email:** arwells.research@proton.me  

---

## Overview

This repository contains the LaTeX source and supporting documentation for the second paper in the Motion-First reconstruction sequence.

Working within the canonical real Hilbert representation of distinguishability established in Paper 1, this paper completes the structural analysis of an additional optional layer:

- a compatible complex Hilbert space structure induced by a cyclic distinguishability symmetry.

The focus is entirely representational.

---

## Central Results

Assuming a strongly continuous cyclic distinguishability symmetry represented by a one-parameter orthogonal group on the canonical real Hilbert representation, we establish:

- existence of a compatible complex structure on the active invariant subspace;
- uniqueness of the induced complex structure up to sign (complex conjugation);
- representation-theoretic intrinsicness across all minimal kernel representations;
- spectral-sector classification of the complexified subspace;
- precise obstruction to quaternionic structure under cyclic symmetry and minimal additional symmetry required for quaternionic generalization.

---

## Scope and Interpretation

This work derives representational structure only. It does **not** assume or derive:

- measurement postulates,
- the Born rule,
- observable algebras,
- Hamiltonian dynamics,
- spacetime structure,
- or probabilistic interpretation.

The symmetry parameter is treated purely as a symmetry parameter; no temporal interpretation is assumed.

---

## Repository Structure

```
symmetry-induced-complexification/
├── README.md
├── LICENSE
├── LICENSE-CCBY
├── CITATION.cff
├── build_paper.sh
└── paper/
    ├── main.tex
    ├── introduction.tex
    ├── cyclic_symmetry_structure.tex
    ├── complex_structure_construction.tex
    ├── complex_structure_uniqueness.tex
    ├── representation_intrinsicness.tex
    ├── spectral_classification.tex
    ├── quaternionic_obstruction.tex
    ├── discussion.tex
    └── references.bib
```

---

## Build

Requirements: `latexmk` with a standard LaTeX installation.

Build the paper:

```
./build_paper.sh
```

Or manually:

```
cd paper
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

## Citation

Recommended citation:

Wells, A. R. (2026).  
*Symmetry-Induced Complexification of Distinguishability Representation*.  
Zenodo. https://doi.org/10.5281/zenodo.18692887 

This work is released under Creative Commons Attribution 4.0 (CC BY 4.0).

