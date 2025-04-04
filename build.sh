#!/bin/bash

build_for_termux() {
    echo "Building Astri Enhanced Multi-Tool for Termux..."
    go mod init astri
    go mod tidy
    go get -u github.com/fatih/color
    go get -u github.com/schollz/progressbar/v3
    go build -o astri
    chmod +x astri
    echo "Build complete! Run ./astri to start"
}

build_for_linux() {
    echo "Building Astri Enhanced Multi-Tool for Linux..."
    go mod init astri
    go mod tidy
    go get -u github.com/fatih/color
    go get -u github.com/schollz/progressbar/v3
    go build -o astri
    chmod +x astri
    echo "Build complete! Run ./astri to start"
}

build_for_windows() {
    echo "Building Astri Enhanced Multi-Tool for Windows..."
    go mod init astri
    go mod tidy
    go get -u github.com/fatih/color
    go get -u github.com/schollz/progressbar/v3
    GOOS=windows GOARCH=amd64 go build -o astri.exe
    echo "Build complete! Run astri.exe to start"
}

case "$1" in
    termux)
        build_for_termux
        ;;
    linux)
        build_for_linux
        ;;
    windows)
        build_for_windows
        ;;
    *)
        echo "Usage: $0 {termux|linux|windows}"
        exit 1
        ;;
esac
