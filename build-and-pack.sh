#!/bin/bash

# Navigate to the root of the repository
cd "$(dirname "$0")"

echo "Building and packing packages..."

# Build and pack query-devtools
echo "Building and packing query-devtools..."
cd packages/query-devtools
pnpm build
pnpm pack
mv tanstack-query-devtools-*.tgz ../../

# Build and pack react-query-devtools
echo "Building and packing react-query-devtools..."
cd ../react-query-devtools
pnpm build
pnpm pack
mv tanstack-react-query-devtools-*.tgz ../../

# Return to root directory
cd ../../

echo "Done! Tarballs are available in the root directory:"
ls -la tanstack-query-devtools-*.tgz tanstack-react-query-devtools-*.tgz
