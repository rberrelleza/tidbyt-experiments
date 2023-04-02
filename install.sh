set -x

program=$1

rm ${program}.webp

pixlet render ${program}.star

pixlet push --installation-id $program bitterly-validating-champion-admiral-520 ${program}.webp