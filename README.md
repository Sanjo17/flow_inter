# Flow Fungible Token Project



This repository is dedicated to the implementation of a comprehensive Fungible Token contract on the Flow blockchain. It includes a suite of transactions and scripts, organized into different sections, addressing various aspects of token management and interactions.



#### Contract - FlowToken:

- Owner-controlled minting process.
- Vault resource for maintaining token balances.
- Array of transactions and scripts for robust token management.

**Code Insights:**
- Highlights the deposit function within the Vault resource for secure token transfer and preventing double-counting.



#### Transactions:

1. **MINT:**
   - Facilitates the minting of tokens to designated recipients.
   
2. **SETUP:**
   - Streamlines the initialization of a user's vault in account storage.

3. **TRANSFER:**
   - Enables users to transfer tokens to different addresses.

#### Scripts:

1. **READ BALANCE:**
   - Retrieves the token balance in a user’s vault.
   
2. **SETUP VALIDATION:**
   - Confirms correct vault setup.
   
3. **TOTAL SUPPLY CHECK:**
   - Reports the total circulating supply of tokens.



- Improving SETUP transaction for remedying improperly set up vaults.
- Enhancing READ BALANCE script for compatibility with non-standard vault setups.

**Key Features:**
- Resource identifiers for verifying token types.
- Resource capabilities for vault authenticity validation.



**Admin Capabilities:**
- Empowers the Admin to withdraw tokens from user vaults and deposit equivalent $FLOW tokens.

**New Transaction:**
- Admin Withdraw and Deposit: Admin-exclusive transaction for token management.



#### Scripts:

1. **BALANCE SUMMARY:**
   - Presents a summary of a user’s $FLOW and custom token vault balances.
   
2. **VAULT OVERVIEW:**
   - Provides a detailed overview of all recognized Fungible Token vaults in a user’s storage.



#### Swap Contract:

- Facilitates users to exchange $FLOW tokens for custom tokens, based on the duration since their last exchange.


- Utilizes a custom identity resource and the user's $FLOW vault reference to authenticate user identity and facilitate secure token swaps.

##  Conclusion

This repository exemplifies a comprehensive Fungible Token contract deployment on the Flow blockchain. It systematically presents functionalities, including token minting, vault setup, token transfer, and token swapping, ensuring enhanced comprehensibility and ease of navigation.
