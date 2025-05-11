# Building and Installing Local TanStack Query Packages

This guide explains how to build TanStack Query packages locally and install them in your React Native application.

## Prerequisites

- Node.js and pnpm installed
- A local clone of the TanStack Query repository

## Step 1: Clone the TanStack Query Repository (if not already done)

```bash
git clone https://github.com/TanStack/query.git react-query-clone
cd react-query-clone
pnpm install
```

## Step 2: Build and Pack the Packages

### Build query-core

```bash
cd packages/query-core
pnpm build
pnpm pack  # Creates tanstack-query-core-x.y.z.tgz
```

### Build react-query

```bash
cd ../react-query
pnpm build
pnpm pack  # Creates tanstack-react-query-x.y.z.tgz
```

## Step 3: Install the Local Packages in Your App

### Option 1: Manual Installation

```bash
# Remove existing TanStack Query packages
pnpm remove @tanstack/react-query @tanstack/query-async-storage-persister @tanstack/react-query-persist-client

# Install the locally built packages
pnpm add /path/to/react-query-clone/packages/query-core/tanstack-query-core-x.y.z.tgz
pnpm add /path/to/react-query-clone/packages/react-query/tanstack-react-query-x.y.z.tgz

# Reinstall the other TanStack packages that depend on these
pnpm add @tanstack/query-async-storage-persister@x.y.z @tanstack/react-query-persist-client@x.y.z
```

Replace `x.y.z` with the actual version number and `/path/to/` with the actual path to your clone.

### Option 2: Using a Script in package.json

Add this script to your package.json:

```json
"scripts": {
  "install-local-query": "pnpm remove @tanstack/react-query @tanstack/query-async-storage-persister @tanstack/react-query-persist-client && pnpm add /path/to/react-query-clone/packages/query-core/tanstack-query-core-x.y.z.tgz && pnpm add /path/to/react-query-clone/packages/react-query/tanstack-react-query-x.y.z.tgz && pnpm add @tanstack/query-async-storage-persister@x.y.z @tanstack/react-query-persist-client@x.y.z"
}
```

Then run:

```bash
pnpm install-local-query
```

## Updating the Local Packages

When you want to update your local packages after making changes:

1. Pull the latest changes from the TanStack Query repository (if needed)
2. Rebuild the packages following Step 2
3. Reinstall the packages following Step 3

## Why Two Packages Are Needed

TanStack Query is structured in a modular way:

- **@tanstack/query-core**: Contains the framework-agnostic core functionality
- **@tanstack/react-query**: Provides React-specific bindings and hooks

When installing local builds, you need to manually install both packages because you're bypassing the normal dependency resolution.

## Script for Your package.json

Here's a script you can copy and paste into your package.json to make this process easier:

```json
"scripts": {
  "update-query": "cd /path/to/react-query-clone && git pull && cd packages/query-core && pnpm build && pnpm pack && cd ../react-query && pnpm build && pnpm pack && cd /path/to/your-app && pnpm remove @tanstack/react-query @tanstack/query-async-storage-persister @tanstack/react-query-persist-client && pnpm add /path/to/react-query-clone/packages/query-core/tanstack-query-core-x.y.z.tgz && pnpm add /path/to/react-query-clone/packages/react-query/tanstack-react-query-x.y.z.tgz && pnpm add @tanstack/query-async-storage-persister@x.y.z @tanstack/react-query-persist-client@x.y.z"
}
```

Replace:
- `/path/to/react-query-clone` with the actual path to your clone
- `/path/to/your-app` with the path to your app
- `x.y.z` with the actual version number

## For Your Specific Setup

Based on your current setup, here's the exact command to use:

```bash
pnpm remove @tanstack/react-query @tanstack/query-async-storage-persister @tanstack/react-query-persist-client && pnpm add /Users/aj/Desktop/react-query-clone/packages/query-core/tanstack-query-core-5.74.4.tgz && pnpm add /Users/aj/Desktop/react-query-clone/packages/react-query/tanstack-react-query-5.74.4.tgz && pnpm add @tanstack/query-async-storage-persister@5.74.4 @tanstack/react-query-persist-client@5.74.4
```

And here's a script for your package.json:

```json
"scripts": {
  "install-local-query": "pnpm remove @tanstack/react-query @tanstack/query-async-storage-persister @tanstack/react-query-persist-client && pnpm add /Users/aj/Desktop/react-query-clone/packages/query-core/tanstack-query-core-5.74.4.tgz && pnpm add /Users/aj/Desktop/react-query-clone/packages/react-query/tanstack-react-query-5.74.4.tgz && pnpm add @tanstack/query-async-storage-persister@5.74.4 @tanstack/react-query-persist-client@5.74.4"
}
```

Note: If the version number changes, you'll need to update these commands with the new version numbers.
