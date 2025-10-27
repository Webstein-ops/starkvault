# StarkVault

StarkVault is a smart contract built on **StarkNet** for managing and verifying digital documents. It allows users to mint documents as unique tokens, store metadata, and retrieve them securely.

---

## Features

- **Mint Document:** Create a new document token with owner, hash, and authenticity score.
- **Get Document:** Retrieve the owner, file hash, and authenticity score of a document by token ID.
- **Event Emission:** Emits an event when a document is minted.
- **Secure Storage:** All data is stored on-chain using StarkNet's storage maps.

---

## Smart Contract Overview

- `token_counter`: Tracks total minted documents.
- `document_owner`: Maps token IDs to owner addresses.
- `document_hash`: Maps token IDs to the document's file hash.
- `document_score`: Maps token IDs to authenticity scores.

### Key Functions

- `constructor()`: Initializes the token counter.
- `mint_document(owner, file_hash, authenticity_score) -> token_id`: Mints a new document.
- `get_document(token_id) -> (owner, file_hash, authenticity_score)`: Returns document info.

### Event

- `DocumentMinted(token_id, owner, file_hash, authenticity_score)`: Triggered when a new document is minted.

---

## Deployment

The smart contract is written in Cairo (StarkNet v0.12+ compatible).  

Example deployment steps (frontend developer or devops):

1. Build the contract:  
   ```bash
   scarb build
