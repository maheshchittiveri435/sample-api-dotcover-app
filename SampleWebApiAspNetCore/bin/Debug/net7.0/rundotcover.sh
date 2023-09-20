#!/bin/bash

# Set the path to dotCover.exe
DOTCOVER_PATH="/app/dotCover.sh"

# Set the path to the target executable
TARGET_EXECUTABLE="/app/SampleWebApiAspNetCore.dll"

# Set the output file path for coverage results
OUTPUT_FILE="report/coveradoc.xml"

# Run dotCover with the specified parameters
"$DOTCOVER_PATH" cover-dotnet --TargetArguments="$TARGET_EXECUTABLE" --Output="$OUTPUT_FILE" --ReportType=XML --Instance=1 --LogLevel=Verbose --LogFile=dotcoverlog.log
