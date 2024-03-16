import FungibleToken from 0x06
import KARAR from 0x06

transaction() {

    // Define references
    let userVault: &KARAR.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, KARAR.CollectionPublic}?
    let account: AuthAccount

    prepare(acct: AuthAccount) {

        // Borrow vault capability and set account reference
        self.userVault = acct.getCapability(/public/Vault)
            .borrow<&KARAR.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, KARAR.CollectionPublic}>()

        self.account = acct
    }

    execute {
        if self.userVault == nil {
            // Create and link an empty vault if none exists
            let emptyVault <- KARAR.createEmptyVault()
            self.account.save(<-emptyVault, to: /storage/VaultStorage)
            self.account.link<&KARAR.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, KARAR.CollectionPublic}>(/public/Vault, target: /storage/VaultStorage)
            log("Empty vault created and linked")
        } else {
            log("Vault already exists and is properly linked")
        }
    }
}