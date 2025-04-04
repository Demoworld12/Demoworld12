#!/bin/bash

# Import required modules
install_dependencies() {
    echo "Installing dependencies..."
    go mod init astri
    go mod tidy
    go get -u github.com/fatih/color
    go get -u github.com/schollz/progressbar/v3
}

# Display a progress bar
show_progress_bar() {
    echo "Starting build process..."
    progressbar 20
    echo
}

# Progress bar function
progressbar() {
    local duration=${1}
    already_done() { for ((done=0; done<$elapsed; done++)); do printf "\u2587"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    for ((elapsed=1; elapsed<=$duration; elapsed++)); do
        already_done; remaining; percentage
        sleep 0.1
        printf "\r"
    done
    printf "\n"
}

# Build for Termux
build_for_termux() {
    echo "Building Astri Enhanced Multi-Tool for Termux..."
    install_dependencies
    go build -o astri
    chmod +x astri
    echo "Build complete! Run ./astri to start"
}

# Build for Linux
build_for_linux() {
    echo "Building Astri Enhanced Multi-Tool for Linux..."
    install_dependencies
    go build -o astri
    chmod +x astri
    echo "Build complete! Run ./astri to start"
}

# Build for Windows
build_for_windows() {
    echo "Building Astri Enhanced Multi-Tool for Windows..."
    install_dependencies
    GOOS=windows GOARCH=amd64 go build -o astri.exe
    echo "Build complete! Run astri.exe to start"
}

# Display the main menu
show_menu() {
    echo "======================================"
    echo "       Astri Enhanced Multi-Tool      "
    echo "======================================"
    echo "Select the target platform to build:"
    echo "1. Termux"
    echo "2. Linux"
    echo "3. Windows"
    echo "4. Exit"
    echo "======================================"
}

# Main script execution
main() {
    show_menu
    read -p "Enter your choice [1-4]: " choice
    case "$choice" in
        1)
            build_for_termux
            ;;
        2)
            build_for_linux
            ;;
        3)
            build_for_windows
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice! Please select a valid option."
            main
            ;;
    esac
}

main
