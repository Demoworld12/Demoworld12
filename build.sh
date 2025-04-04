#!/bin/bash

echo "Building Astri Enhanced Multi-Tool for Termux..."
go mod init astri
go mod tidy
go get -u github.com/fatih/color
go get -u github.com/schollz/progressbar/v3
go build -o astri
chmod +x astri
echo "Build complete! Run ./astri to start"