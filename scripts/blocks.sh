#!/usr/bin/env bash

# Default values
columns=6
rows=1
neutrals=false
pattern=""

# ANSI reset
r='\033[0m'

# Color arrays
colors=(31 32 33 34 35 36)  # red green yellow blue magenta cyan
neutral_colors=(30 37)  # black white
brights=(91 92 93 94 95 96)  # light versions
neutral_brights=(90 37)  # dark_gray light_gray

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -n|--neutrals)
            neutrals=true
            shift
            ;;
        -p|--pattern)
            pattern="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [columns] [rows] [--neutrals|-n] [--pattern|-p EXPR]"
            echo "  columns: number of columns (default: 6)"
            echo "  rows: number of rows (default: 1)"
            echo "  --neutrals|-n: include black and white colors"
            echo "  --pattern|-p: pattern expression (e.g., 'x+y', 'x*y')"
            exit 0
            ;;
        *)
            if [[ "$1" =~ ^[0-9]+$ ]]; then
                if [[ -z "$columns_set" ]]; then
                    columns=$1
                    columns_set=true
                elif [[ -z "$rows_set" ]]; then
                    rows=$1
                    rows_set=true
                fi
            fi
            shift
            ;;
    esac
done

# Function to generate a block
block() {
    local color=$1
    
    if [[ $color -lt 0 ]]; then
        echo "     "
        echo "     "
        echo "     "
        echo "     "
        return
    fi
    
    local -a list
    local -a blist
    
    if $neutrals; then
        list=("${colors[@]}" "${neutral_colors[@]}")
        blist=("${brights[@]}" "${neutral_brights[@]}")
    else
        list=("${colors[@]}")
        blist=("${brights[@]}")
    fi
    
    local n=$((color % ${#list[@]}))
    local c="\033[${list[$n]}m"
    local b="\033[${blist[$n]}m"
    
    echo -e "${c}████ ${r}"
    echo -e "${c}████${b}█${r}"
    echo -e "${c}████${b}█${r}"
    echo -e "${b} ▀▀▀▀${r}"
}

# Function to horizontally join two blocks
hjoin() {
    local -a block1=("${!1}")
    local -a block2=("${!2}")
    local -a result
    
    for i in "${!block1[@]}"; do
        result[$i]="${block1[$i]}  ${block2[$i]}"
    done
    
    for line in "${result[@]}"; do
        echo "$line"
    done
}

# Function to evaluate pattern
eval_pattern() {
    local x=$1
    local y=$2
    
    if [[ -z "$pattern" ]]; then
        echo $x
    else
        # Simple pattern evaluation - replace x and y with values
        local expr="${pattern//x/$x}"
        expr="${expr//y/$y}"
        echo $((expr))
    fi
}

# Main logic
declare -a all_blocks

for ((row=0; row<rows; row++)); do
    declare -a row_blocks
    
    for ((col=0; col<columns; col++)); do
        n=$(eval_pattern $col $row)
        
        # Generate block and store lines in array
        readarray -t block_lines < <(block $n)
        
        if [[ $col -eq 0 ]]; then
            # First block in row
            for i in "${!block_lines[@]}"; do
                row_blocks[$i]="${block_lines[$i]}"
            done
        else
            # Join with previous blocks
            declare -a new_row_blocks
            for i in "${!block_lines[@]}"; do
                new_row_blocks[$i]="${row_blocks[$i]}  ${block_lines[$i]}"
            done
            row_blocks=("${new_row_blocks[@]}")
        fi
    done
    
    # Add row blocks to all blocks
    for line in "${row_blocks[@]}"; do
        all_blocks+=("$line")
    done
done

# Print result
echo
for line in "${all_blocks[@]}"; do
    echo "  $line"
done