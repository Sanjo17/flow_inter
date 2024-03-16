import FungibleToken from 0x06
import KARAR from 0x06

pub fun main(account: Address) {

    // Attempt to borrow PublicVault capability
    let publicVault: &KARAR.Vault{FungibleToken.Balance, FungibleToken.Receiver, KARAR.CollectionPublic}? =
        getAccount(account).getCapability(/public/Vault)
            .borrow<&KARAR.Vault{FungibleToken.Balance, FungibleToken.Receiver, KARAR.CollectionPublic}>()

    if (publicVault == nil) {
        // Create and link an empty vault if capability is not present
        let newVault <- KARAR.createEmptyVault()
        getAuthAccount(account).save(<-newVault, to: /storage/VaultStorage)
        getAuthAccount(account).link<&KARAR.Vault{FungibleToken.Balance, FungibleToken.Receiver, KARAR.CollectionPublic}>(
            /public/Vault,
            target: /storage/VaultStorage
        )
        log("Empty vault created")
        
        // Borrow the vault capability again to display its balance
        let retrievedVault: &KARAR.Vault{FungibleToken.Balance}? =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&KARAR.Vault{FungibleToken.Balance}>()
        log(retrievedVault?.balance)
    } else {
        log("Vault already exists and is properly linked")
        
        // Borrow the vault capability for further checks
        let checkVault: &KARAR.Vault{FungibleToken.Balance, FungibleToken.Receiver, KARAR.CollectionPublic} =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&KARAR.Vault{FungibleToken.Balance, FungibleToken.Receiver, KARAR.CollectionPublic}>()
                ?? panic("Vault capability not found")
        
        // Check if the vault's UUID is in the list of vaults
        if KARAR.vaults.contains(checkVault.uuid) {
            log(publicVault?.balance)
            log("This is a RYZEN vault")
        } else {
            log("This is not a RYZEN vault")
        }
    }
}