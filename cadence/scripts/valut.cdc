import FungibleToken from 0x06
import FlowToken from 0x06

pub fun main(account: Address) {

    // Borrow the public vault capability and handle errors
    let publicVault = getAccount(account).getCapability(/public/FlowVault).borrow<&FlowToken.Vault{FungibleToken.Balance}>()?? panic("Vault not found, setup might be incomplete")

    log("Vault setup verified successfully")
}