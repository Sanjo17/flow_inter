import FungibleToken from 0x06
import  KARAR from 0x06

transaction(receiver: Address, amount: UFix64) {

    prepare(signer: AuthAccount) {
        // Borrow the RYZEN Minter reference
        let minter = signer.borrow<&KARAR.Minter>(from: /storage/MinterStorage)
            ?? panic("You are not the KARAR minter")
        
        // Borrow the receiver's RYZEN Vault capability
        let receiverVault = getAccount(receiver)
            .getCapability<&KARAR.Vault{FungibleToken.Receiver}>(/public/Vault)
            .borrow()
            ?? panic("Error: Check your KARAR Vault status")
        
        // Minted tokens reference
        let mintedTokens <- minter.mintToken(amount: amount)

        // Deposit minted tokens into the receiver's RYZEN Vault
        receiverVault.deposit(from: <-mintedTokens)
    }

    execute {
        log("stackToken minted and deposited successfully")
        log("Tokens minted and deposited: ".concat(amount.toString()))
    }
}