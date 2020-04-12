#!/bin/sh

# python

python2 -c "import numpy; import scipy; import matplotlib; import sympy" || echo "Error: python2"
python3 -c "import numpy; import scipy; import matplotlib; import sympy" || echo "Error: python3"
pip2 > /dev/null 2>&1 || echo "Error: pip2"
pip3 > /dev/null 2>&1 || echo "Error: pip3"

# evince
evince --version > /dev/null 2>&1 || echo "Error: evince"
