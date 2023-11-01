#!/bin/bash

### Script for mriqc docker container
# Dylan Lawless
# Usage: run_mriqc: [--bidsdir] [--outdir] [--wrkdir] [--label_info]


# Initialize defaults
export outdir=/OUTPUTS

# Parse options
while [[ $# -gt 0 ]]; do
  key="${1}"
  case $key in
    --outdir)
      export outdir="${2}"; shift; shift ;;
    --project)
      export project="${2}"; shift; shift ;;
    --subject)
      export subject="${2}"; shift; shift ;;
    --session)
      export session="${2}"; shift; shift ;;
    --scan)
      export scan="${2}"; shift; shift ;;
    *)
      echo Unknown input "${1}"; shift ;;
  esac
done

#Convert outputs
cd ${outdir}

#Run py scripts to convert outputs
/opt/xnatwrapper/convert_outputs.py
