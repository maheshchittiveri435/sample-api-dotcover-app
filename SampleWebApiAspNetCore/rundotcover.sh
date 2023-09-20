#!/bin/bash

# Set the path to dotCover.exe
DOTCOVER_PATH="/bin/Debug/net7.0/dotCover.sh"

# Set the path to the target executable
TARGET_EXECUTABLE="bin/Debug/net7.0/SampleWebApiAspNetCore.dll"

# Set the output file path for coverage results
OUTPUT_FILE="coveradoc.xml"

# Run dotCover with the specified parameters
"$DOTCOVER_PATH" cover --TargetExecutable="$TARGET_EXECUTABLE" --Output="$OUTPUT_FILE" --ReportType=XML --Instance=1
