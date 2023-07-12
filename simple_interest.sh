#!/bin/bash

# Simple Interest Calculation Script

# Read input from the user
read -p "Enter principal amount: " principal
read -p "Enter rate of interest: " rate
read -p "Enter time in years: " time

# Calculate simple interest
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

# Print the result
echo "Simple Interest: $interest"
