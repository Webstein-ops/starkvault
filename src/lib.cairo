use starknet::ContractAddress;
use starknet::storage::Map;

#[starknet::contract]
mod starkvault {
    use super::{ContractAddress, Map};

    #[storage]
    struct Storage {
        token_counter: u128,
        document_owner: Map<u128, ContractAddress>,
        document_hash: Map<u128, felt252>,
        document_score: Map<u128, u128>,
    }

    #[event]
    fn DocumentMinted(
        token_id: u128,
        owner: ContractAddress,
        file_hash: felt252,
        authenticity_score: u128,
    ) {}

    #[constructor]
    fn constructor(ref self: ContractState) {
        self.token_counter.write(0);
    }

    #[external(v0)]
    fn mint_document(
        ref self: ContractState,
        owner: ContractAddress,
        file_hash: felt252,
        authenticity_score: u128,
    ) -> u128 {
        let current_count = self.token_counter.read();
        let token_id = current_count + 1;

        self.document_owner.write(token_id, owner);
        self.document_hash.write(token_id, file_hash);
        self.document_score.write(token_id, authenticity_score);
        self.token_counter.write(token_id);

        DocumentMinted(token_id, owner, file_hash, authenticity_score);

        token_id
    }

    #[external(v0)]
    fn get_document(self: @ContractState, token_id: u128) -> (ContractAddress, felt252, u128) {
        let owner = self.document_owner.read(token_id);
        let hash = self.document_hash.read(token_id);
        let score = self.document_score.read(token_id);
        (owner, hash, score)
    }
}
