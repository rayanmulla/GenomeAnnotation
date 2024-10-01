#!/bin/bash

# Define the Python script file
PYTHON_SCRIPT="amino_acid_calculator.py"

# Check if the .py file exists
if [[ -f $PYTHON_SCRIPT ]]; then
    # Run the Python script
    python3 $PYTHON_SCRIPT
else
    echo "Error: $PYTHON_SCRIPT not found."
fi
