#!/bin/bash
csv_file="employee_data.csv"

age_array=($(awk -F ',' '{print $6}' "$csv_file"))

# Function to count employees old enough for social security benefits
count_eligible_employees() {
    local count=0
    for age in "${age_array[@]}"; do
        if [ "$age" -ge 65 ]; then
            ((count++))
        fi
    done
    echo "Number of employees eligible for social security benefits: $count"
}

count_eligible_employees
