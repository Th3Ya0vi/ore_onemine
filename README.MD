# Running the Mining Script

This README outlines the steps to run the [start_mining.sh](file:///Users/YOURPATH/ore_onemine/start_mining.sh#1%2C1-1%2C1) script for setting up and starting the mining process.

## Prerequisites

- Unix-like operating system (Linux, macOS, etc.)
- [curl](file:///Users/YOURPATH/ore_onemine/start_mining.sh#5%2C1-5%2C1) installed on your system
- Stable internet connection
- Access to a Solana wallet with funds for initial account funding

## Steps

1. **Save the Script**: Ensure the script is saved into a file named [start_mining.sh](file:///Users/YOURPATH/ore_onemine/start_mining.sh#1%2C1-1%2C1).

2. **Make the Script Executable**:
    - Open a terminal.
    - Navigate to the directory containing [start_mining.sh](file:///Users/YOURPATH/ore_onemine/start_mining.sh#1%2C1-1%2C1).
    - Run the command:
        ```shell
        chmod +x start_mining.sh
        ```

3. **Run the Script**:
    - In the terminal, execute the script by running:
        ```shell
        ./start_mining.sh
        ```

## Important Notes

- The script will prompt you to send 0.1 SOL to the newly created Solana keypair. Ensure you have completed this step to proceed with mining.
- Depending on your system's security settings, you might need to run the script with elevated permissions. If you encounter permission-related errors, consider running the script with `sudo`. Use this with caution and only if you understand the implications.

By following these steps, the script will install necessary dependencies, set up the environment, and start the mining process in detached mode, logging output to `output.log