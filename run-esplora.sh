#!/bin/bash

set -e
set -x

# Run this in a separate terminal

git clone https://github.com/Blockstream/esplora.git || true
cd esplora

npm install
export API_URL=http://localhost:3000/


npm run dev-server

# open http://localhost:5000/

