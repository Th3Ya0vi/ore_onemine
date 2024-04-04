#!/bin/sh

# Install Rust and Cargo
echo "Installing Rust and Cargo..."
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Ensure the cargo bin directory is in the PATH
source $HOME/.cargo/env

# Install Solana CLI and create a Solana keypair
echo "Installing Solana CLI..."
sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)"
echo "Updating PATH for Solana CLI..."
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
echo "Creating Solana keypair..."
solana-keygen new || { echo "Failed to create Solana keypair. Exiting."; exit 1; }

# Prompt the user to send 0.1 SOL to their account
echo "Please send 0.1 SOL to the above public key to start mining. Press enter once done."
read -p "Have you sent 0.1 SOL? (y/n) " -n 1 -r
echo    # Move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Mining cannot start without the initial SOL. Exiting."
    exit 1
fi

# Install Ore CLI
echo "Installing Ore CLI..."
cargo install ore-cli

# Start mining in detached mode
echo "Starting mining in detached mode..."
nohup ore \
--rpc https://api.mainnet-beta.solana.com \
--keypair ~/.config/solana/id.json \
--priority-fee 1 \
mine \
--threads 4 > output.log 2>&1 &

echo "Mining started. Output is logged to output.log"