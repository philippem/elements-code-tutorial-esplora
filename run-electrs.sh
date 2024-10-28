#!/bin/bash

# Run this in a separate terminal

set -e
set -x

git clone https://github.com/Blockstream/electrs.git || true
cd electrs

# Build electrs for Liquid (an elements chain). This will take several minutes
cargo build --features liquid --release

rm -rf ./db

export RUST_BACKTRACE=1
# Run an electrs. It will serve a REST API on port 3000, and make RPC requests to a local elements daemon
cargo run --features liquid --package electrs --bin electrs --release -- \
      -vvvv \
      --http-addr 0.0.0.0:3000 \
      --network liquidregtest  \
      --parent-network regtest \
      --jsonrpc-import \
      --address-search \
      --daemon-rpc-addr 0.0.0.0:18884 \
      --cookie user1:password1 # RPC auth parameters of the elements daemon
