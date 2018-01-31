
# Verification on Ethereum DApps
## State-of-the-art (updating)
### Publication
#### Scilla: a Smart Contract Intermediate-Level LAnguage 
- Automata for Smart Contract Implementation and Verification
- <https://arxiv.org/abs/1801.00687>

#### Decentralization in Bitcoin and Ethereum Networks
- <https://arxiv.org/abs/1801.03998>

### Tools
#### [Manticore](https://github.com/trailofbits/manticore)
- Manticore is a symbolic execution tool for analysis of binaries and smart contracts.
	* Linux ELF binaries (x86, x86_64 and ARMv7)
	* EVM bytecode ([video](https://asciinema.org/a/haJU2cl0R0Q3jB9wd733LVosL))
		* Folder *example* provides *coverage*, *minimal* and so on. Mainly simple usages of API.
- [Manticore: Symbolic execution for humans](https://blog.trailofbits.com/2017/04/27/manticore-symbolic-execution-for-humans/)
- Dynamic binary analysis tool with EVM support (described in [Ethereum Smart Contract Best Practices](https://consensys.github.io/smart-contract-best-practices/security_tools/))
- CLI (Command-line Interface)
```
czc@vultr:~/manticore/examples/linux$ manticore basic
2018-01-30 16:48:42,626: [7231] m.manticore:INFO: Loading program basic  
2018-01-30 16:48:52,257: [7231] m.manticore:INFO: Generated testcase No. 0 - Program finished with exit status: 0   
2018-01-30 16:48:53,831: [7231] m.manticore:INFO: Generated testcase No. 1 - Program finished with exit status: 0   
2018-01-30 16:48:53,834: [7231] m.manticore:INFO: Results in /home/czc/manticore/examples/linux/mcore_t9BiJE      
2018-01-30 16:48:53,834: [7231] m.manticore:INFO: Total time: 9.56235694885  
czc@vultr:~/manticore/examples/linux$ cat mcore_t9BiJE/test_00000000.stdin | ./basic   
Message: It is greater than 0x41   
czc@vultr:~/manticore/examples/linux$ cat mcore_t9BiJE/test_00000001.stdin | ./basic   
Message: It is less than or equal to 0x41 
```
- API
	* [API Reference](http://manticore.readthedocs.io/en/latest/api.html)
	* [Manticore Documentation 0.1.0](https://media.readthedocs.org/pdf/manticore/latest/manticore.pdf) (released on Jan 30, 2018)
```
czc@vultr:~/manticore/examples/script$ python count_instructions.py ../linux/helloworld   
Executed  6266  instructions. 
```

#### [Mythril](https://github.com/ConsenSys/mythril)
- Reversing and bug hunting framework for the Ethereum blockchain (described in [Ethereum Smart Contract Best Practices](https://consensys.github.io/smart-contract-best-practices/security_tools/))
- [Security analysis tool for Ethereum smart contracts](https://pypi.python.org/pypi/mythril) mythril 0.10.7
- Out of date documentation, [Mythril 0.8.0](https://www.pydoc.io/pypi/mythril-0.8.0/)
- Note that Mythril requires Python 3.5 to work.
- [Introducing Mythril: A framework for bug hunting on the Ethereum blockchain](https://hackernoon.com/introducing-mythril-a-framework-for-bug-hunting-on-the-ethereum-blockchain-9dc5588f82f6) by [Bernhard Mueller](https://hackernoon.com/@muellerberndt), a security engineer at [ConsenSys](https://new.consensys.net/).
- [Analyzing Ethereum smart contracts for vulnerabilities](https://hackernoon.com/scanning-ethereum-smart-contracts-for-vulnerabilities-b5caefd995df)
> In this article, I’ll show how to run different types of security scans with Mythril using smart contracts from the *Ethernaut wargame* as examples (thanks to the guys from *Zeppelin solutions* for giving me permission). If you haven’t tried the wargame yourself, be aware that there are spoilers ahead! I recommend giving it a shot yourself first if you haven’t already.
- [Mythril: The New Ethereum Blockchain Error Detector](https://steemit.com/blockchain/@rusinho027/mythril-the-new-ethereum-blockchain-error-detector)
- Upcoming Talk, April 12, 2018, [Smashing Ethereum Smart Contracts for Fun and ACTUAL Profit](https://conference.hitb.org/hitbsecconf2018ams/sessions/smashing-ethereum-smart-contracts-for-fun-and-actual-profit/), by [Bernhard Mueller](https://hackernoon.com/@muellerberndt)

#### [Solgraph](https://github.com/raineorshine/solgraph)
- Generates a DOT graph that visualizes function control flow of a Solidity contract and highlights potential security vulnerabilities.
- Visualize Solidity control flow
- not support for EVM bytecode

#### Dr.Y's Ethereum Contract Analyzer
- <https://github.com/pirapira/dry-analyzer>
- <http://dry.yoichihirai.com/>

#### [Securify](https://securify.ch/)

#### [SmartCheck](https://tool.smartdec.net/)
- provided by [SmartDec](https://smartcontracts.smartdec.net/)  
> SmartCheck: Static Code Analyzer  
We have built our own static code analyzer for Solidity. Our full analysis includes complete manual analysis and verification of all the issues reported by SmartCheck.

#### Oyente

### Other Useful Development Tools or Testing Framework
#### Disassembler

#### Function Signature
- [Keccak-256](https://emn178.github.io/online-tools/keccak_256.html)
- [Ethereum Function Signature Database](https://www.4byte.directory/)

#### [The Truffle Framework](http://truffleframework.com/)
- Truffle is the most popular development framework for Ethereum with a mission to make your life a whole lot easier.
- Truffle: smart contract compilation, library linking, creation of contract artifacts, interacting with smart contracts on the front-end
- Ganache (TestRPC): Personal blockchain and explorer for development   
	- Quickly fire up a personal Ethereum blockchain which you can use to run tests, execute commands, and inspect state while controlling how the chain operates. 
- Drizzle: Reactive web3 and smart contracts for easier integration with JS frameworks (coming soon)
- Truffle Box: 

#### Explorer for Blockchain
- [MyEtherWallet](https://www.myetherwallet.com/): 

### Test Coverage
#### Solidity-coverage
- <https://github.com/sc-forks/solidity-coverage>

### Library
#### [OpenZeppelin](https://github.com/OpenZeppelin/zeppelin-solidity)
- OpenZeppelin, a framework to build secure smart contracts on Ethereum
- e.g., [SafeMath.sol](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/math/SafeMath.sol) and [Ownable.sol](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/ownership/Ownable.sol)

### Semantics
#### [KEVM](https://github.com/kframework/evm-semantics)
#### [LEM](https://github.com/pirapira/eth-isabelle)

### Virtual Machine
#### [IELE](https://runtimeverification.com/blog/?p=498)

### Useful Resources
- <https://github.com/pirapira/ethereum-formal-verification-overview>
- [Week in Ethereum News](http://www.weekinethereum.com/)


## Our Efforts
### Classify vulnerabilities
