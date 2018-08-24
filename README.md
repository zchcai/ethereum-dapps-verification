# Verification on Ethereum DApps
## State-of-the-art (updating)
### Publication
#### [Designing Secure Ethereum Smart Contracts: A Finite State Machine Based Approach](https://fc18.ifca.ai/preproceedings/101.pdf) (FC 18)

#### [ZEUS: Analyzing Safety of Smart Contracts](https://www.ndss-symposium.org/wp-content/uploads/sites/25/2018/02/ndss2018_09-1_Kalra_paper.pdf) (NDSS 18)

- A good [summary](https://blog.acolyer.org/2018/03/08/zeus-analyzing-safety-of-smart-contracts/) by Adrian Colyer 

#### [Finding The Greedy, Prodigal, and Suicidal Contracts at Scale](https://arxiv.org/pdf/1802.06038.pdf) (2018)

>a new systematic characterization of a class of trace vulnerabilities, which result from analyzing multiple invocations of a contract over its lifetime
>
>three example properties of such trace vulnerabilities: 


1. **Greedy**: lock funds indefinitely, 
2. **Prodigal** (very generous, recklessly wasteful): leak ether carelessly to arbitrary users, or 

   1. For section 5.2, Figure 6 example doesn't hold: [test contract](https://ropsten.etherscan.io/address/0x018940b68d3b29b78383b49b0fad1c7be42d7e1c#code)
3. **Suicidal**: can be killed by anyone.

   1. based on Parity Multi-sig wallet contract, [vulnerable one](https://etherscan.io/address/0x863df6bfa4469f3ead0be8f9f2aae51c91a907b4#code)
   2. safe one ref: open zeppelin's multi-sig wallet [implementation](https://github.com/OpenZeppelin/zeppelin-solidity/blob/v1.2.0/contracts/MultisigWallet.sol)

- MAIAN
  - the first tool for precisely specifying and reasoning about trace properties, which employs inter-procedural symbolic analysis and concrete validator for exhibiting real exploits.
  - two major components: symbolic analysis and concrete validation
  - ​
  - depth-first
  - target at bytecode
- Posthumous contract: dead but can receive ether from **any** transaction. It is a special type of Greedy. ([My test in Ropsten](https://ropsten.etherscan.io/address/0xff97cb4f1aca1c019f0af613664dfff4da7855e3)) ([Contract code](https://ropsten.etherscan.io/address/0x480b60537175df0565f3b69c4748485587288b35#code))
  - For SUICIDENONEMPTYSTACK test: even if `id'` is an indocile [contract](https://ropsten.etherscan.io/address/0x68179e077ebab4509d1b277cc3e751e9db1b44bf#code), `selfdestruct(id')` will send suicide's remaining ether to `id'`.  In other words, any contract can't prevent Ether accepting. Or we say, we can use `selfdestruct(id')` to send Ether to any contract.

#### [Quantitative Analysis of Smart Contracts](http://pub.ist.ac.at/~akafshda/paperpdfs/esop2018.pdf) (ESOP 18) (Apr 14-20)

- Define a new simplified PL to write smart contracts, which can be converted into stateful games. Then they provide an abstraction-refinement approach for quantitative concurrent games to automatically analyze. 
- What is stateful/stateless games?
- mainly on section 4 and 5

#### [Online Detection of Effectively Callback Free Objects with Applications to Smart Contracts](http://www.cs.tau.ac.il/~shellygr/pubs/2018-popl-1.pdf) (POPL 18) (Jan 10-12) ([video](https://www.youtube.com/watch?v=EU6RMP9hM7s))

- Modular reasoning, module of reasoning
  - This paper recommends [Modular Verification of Static Class Invariants](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/12/krml153.pdf), and, Ownership confinement ensures representation independence for OO programs
  - It says this topic has been studied extensively with the seminal works of Hoare (Proof of correctness of data representation) and Dijkstra (A discipline of programming)
  - http://www.cs.cmu.edu/~aldrich/oop/ It seems this is a good page to check.
- $ECF_{FS}$: Final-State Effective Callback Freedom
- $ECF_{C}$: Conflict Effective Callback Freedom:grey_question:
  - Conflict graph-based algorithm
    - Tracks read/write sets of invocations
    - Builds conflict graph
    - Checks for cycles
- Dynamic checking is decidable.
- [Code](https://github.com/shellygr/go-ethereum): Go Ethereum enhanced with ECF Checker, a dynamic monitor of the ECF property, based on Geth.
- [TR](http://www.cs.tau.ac.il/~shellygr/pubs/ecf-tr.pdf) (Technical Report)

#### [Scilla: a Smart Contract Intermediate-Level LAnguage](https://arxiv.org/abs/1801.00687) (Automata for Smart Contract Implementation and Verification) ([GitHub](https://github.com/ilyasergey/scilla-coq))

- Use Coq 8.7, State-Transition Systems for Smart Contracts: semantics and properties.
- [Zilliqa](https://www.zilliqa.com/) is the world's first high-throughput public blockchain platform designed to scale to thousands of transactions per second. It brings the theory of sharding to practice with its novel protocol that increases transaction rates as its network expands. The platform is tailored towards enabling secure data-driven decentralized apps, designed to meet the scaling requirements of machine learning and financial algorithms. Zilliqa has been under research and development for two years. It has powered several ground-breaking deployments commercially to date.
  - Latest Testnet Trial Run: 2488 TX/S, 6 shards and 3600 nodes.
- Section 2: contracts as Communicating Automata
  - ​

#### [Decentralization in Bitcoin and Ethereum Networks](https://arxiv.org/abs/1801.03998) (WTSC@FC 18) (Mar 2, 2018)

- Key tool: Falcon relay network
- Key findings:
  - Bitcoin network can increase the bandwidth requirements for nodes by a factor of 1.7 and keep the same level of decentralization
  - Bitcoin network is geographically more clustered than Ethereum, with many nodes likely residing in datacenters
  - Ethereum has lower mining power utilization than Bitcoin and would benefit from a relay network
  - small miners experience more volatility in block rewards in Bitcoin and Ethereum

#### [An Empirical Analysis of Smart Contracts: Platforms, Applications, and Design Patterns](https://arxiv.org/abs/1703.06322) ([WTSC 17](http://fc17.ifca.ai/wtsc/)@FC) (Apr 7, 2017)

- Several platforms for smart contracts have been proposed, and this paper have analyzed the usage of smart contracts from various perspectives. Mainly, by manually analyzing 834 smart contracts from Ethereum (811, verified) and Bitcoin (23), it concludes 5 categories describing smart contracts intended application domain, and 9 design patterns. Among these, they observe that token, authorization, time constraint, and termination are generally the most used patterns. Also, they give the quantitative results in details.

- Another contribution is the analysis of platforms. At first, they drew up a candidate list, 12 platforms, by examining all 175 articles of [coindesk.com](coindesk.com) in "smart contracts" category by Sept 15, 2016. Then ruled out half of them by 3 criteria:

  - have already been launched,
  - are running and supported from a community of developers, and
  - are publicly accessible.

  They get the sample of 6 platforms (Bitcoin, Ethereum, [Counterparty](https://counterparty.io/), [Stellar](https://www.reddit.com/r/Stellar/comments/78an74/welcome_to_rstellar_read_this_to_get_started/), Monax and Lisk), and give the results, mainly considering blockchain types, contract languages, transaction amount and market shares.

- 5 categories:

  - Financial
  - Notary
  - Game
  - Wallet
  - Library

- 9 design patterns:

  - Token
  - Authorization: relating to critical operations
  - Oracle: the interface between contracts and the outside
  - Randomness
  - Poll: allows users to vote on some question
  - Time constrain
  - Termination
  - Math: e.g., [SafeMath.sol](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/math/SafeMath.sol)
  - Fork check

- Good survey, helpful to beginners. However, it didn't analyze DSL or VM used for smart contracts. For example, high-level languages like Solidity or Viper, and low-level virtual machines like EVM or IELE. Also, some platforms claim they support  

#### [A Concurrent Perspective on Smart Contracts](https://arxiv.org/pdf/1702.05511.pdf) (WTSC 17)

- A good [summary](https://blog.acolyer.org/2017/08/30/a-concurrent-perspective-on-smart-contracts/) by Adrian Colyer

#### [Defining the Ethereum Virtual Machine for Interactive Theorem Provers](https://link.springer.com/chapter/10.1007/978-3-319-70278-0_33) (FC 17)

> "To our knowledge, ours is the first formal EVM definition for smart contract verification that implements all instructions. Our definition can serve as a basis for further analysis and generation of Ethereum smart contracts."

#### [Formal verification of Smart Contracts](https://www.cs.umd.edu/~aseem/solidetherplas.pdf) (Short paper, workshop) (PLAS 16)

- attempt to use F* framework to do formal verification on smart contracts
- Solidity or EVM

#### [A Survey of Attacks on Ethereum Smart Contracts (SoK)](https://eprint.iacr.org/2016/1007.pdf) (Systematization of knowledge paper) (POST 17)

> In this paper we provide the first systematic exposition of the security vulnerabilities of Ethereum and of its high-level programming language, Solidity.

- [online examples](http://blockchain.unica.it/projects/ethereum-survey/)
  - only provides 5 attacks: SimpleDAO (reentry), KotET (mishandled exception and indocile receiver), OddsAndEvens (public secret), Governmental (time constraints and unpredictable states) and dynamic libraries (function visibility), and 1 miscellanea: gasless send.
  - two Solidity versions: 0.3.1 and 0.4.2
-  some notes for function calling process:
  - Each function is uniquely identified by a signature, based on its name and type parameters. 
  - If the signature matches one function, the execution will jump to that, else jump to **fallback** function.
  - Modifier checking happens in function's inter logic.
  - Sometimes, invocation to fallback function will have `0x3af39c21` in data field.
  - [My Test Contract in Ropsten](https://ropsten.etherscan.io/address/0x368d72216b96b95c49a6d61ead7b04d182632778)

#### [Make Smart Contracts Smarter](https://eprint.iacr.org/2016/633.pdf) (CCS 16)

- Oyente, a verification tool using symbolic execution. It declares that Oyente can detect four main vulnerabilities: timestamp dependency, front running (money concurrency), mishandled exceptions and reentry bugs. 

#### [Hawk: The Blockchain Model of Cryptography and Privacy-Preserving Smart Contracts](http://ieeexplore.ieee.org/abstract/document/7546538/) (SP 2016)

- ​

#### [Town Crier: An Authenticated Data Feed for Smart Contracts](https://eprint.iacr.org/2016/168.pdf) (IACR 16)

- TBR

#### [Scripting smart contracts for distributed ledger technology](https://eprint.iacr.org/2016/1156.pdf) (IACR 16)

- TBR

#### [The Ring of Gyges: Investigating the Future of Criminal Smart Contracts](https://eprint.iacr.org/2016/358.pdf) (IACR 16)

- TBR

#### [Step by Step towards Creating a Safe Smart Contract: Lessons and Insights from a Cryptocurrency Lab](https://eprint.iacr.org/2015/460.pdf) (IACR 15)

- (TBR)


### True Attacks in Real World

#### The DAO in Jun 2016

#### The Parity Bug in Jul 2017

#### The Parity Bug in Nov 2017

### Some thoughts for vulnerabilities

Currently, types of vulnerabilities can be divided as 3 main categories: external calling, internal execution and blockchain limitation. 

Several tools to detect bugs

- Transaction-based: (External)

inter-procedural, trigger + modules

- EVM based: (Internal) (Single)

Intra-procedural

- Chain property: relay network

### Tools

#### MAIAN

- [source code](https://github.com/MAIAN-tool/MAIAN)

#### [Manticore](https://github.com/trailofbits/manticore)

- Manticore is a symbolic execution tool for analysis of binaries and smart contracts.
  * Linux ELF binaries (x86, x86_64 and ARMv7)
  * EVM bytecode ([video 1](https://asciinema.org/a/142996)) ([video 2](https://asciinema.org/a/154012))
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
  * [Manticore Documentation 0.1.0](https://media.readthedocs.org/pdf/manticore/latest/manticore.pdf) (released on Mar 22, 2018)
```
czc@vultr:~/manticore/examples/script$ python count_instructions.py ../linux/helloworld   
Executed  6266  instructions. 
```

#### [Mythril](https://github.com/ConsenSys/mythril)
- Reversing and bug hunting framework for the Ethereum blockchain (described in [Ethereum Smart Contract Best Practices](https://consensys.github.io/smart-contract-best-practices/security_tools/))

- [Documentation](https://pypi.python.org/pypi/mythril) mythril 0.14.9

- Install

  - require `libssl-dev`
  - Currently, I use `python3 -m venv ./` in a test directory, then `cd bin` and `source activate`. 

- Note
  - Mythril requires Python 3.5 to work.
  - It is built on [laser-ethereum](https://pypi.python.org/pypi/laser-ethereum/0.1.9), a [Z3-based](https://pypi.python.org/pypi/z3-solver/4.5.1.0) symbolic Ethereum VM. 

- [Introducing Mythril: A framework for bug hunting on the Ethereum blockchain](https://hackernoon.com/introducing-mythril-a-framework-for-bug-hunting-on-the-ethereum-blockchain-9dc5588f82f6) by [Bernhard Mueller](https://hackernoon.com/@muellerberndt), a security engineer at [ConsenSys](https://new.consensys.net/).

> full node needs or use [infura](https://infura.io/)

- [Analyzing Ethereum smart contracts for vulnerabilities](https://hackernoon.com/scanning-ethereum-smart-contracts-for-vulnerabilities-b5caefd995df)
> In this article, I’ll show how to run different types of security scans with Mythril using smart contracts from the *Ethernaut wargame* as examples (thanks to the guys from *Zeppelin solutions* for giving me permission). If you haven’t tried the wargame yourself, be aware that there are spoilers ahead! I recommend giving it a shot yourself first if you haven’t already.
- news: [Mythril: The New Ethereum Blockchain Error Detector](https://steemit.com/blockchain/@rusinho027/mythril-the-new-ethereum-blockchain-error-detector)
- Upcoming Talk, April 12, 2018, [Smashing Ethereum Smart Contracts for Fun and ACTUAL Profit](https://conference.hitb.org/hitbsecconf2018ams/sessions/smashing-ethereum-smart-contracts-for-fun-and-actual-profit/), by [Bernhard Mueller](https://hackernoon.com/@muellerberndt)

#### [Solidity Parser](https://github.com/consensys/solidity-parser)

> A Solidity parser in Javascript. So we can evaluate and alter Solidity code without resorting to cruddy preprocessing.

- In: Solidity code
- Out: AST
- Warning: not deal with constructor

#### [Solgraph](https://github.com/raineorshine/solgraph)

- In: AST (thus dependent on Solidity Parser)
- Out: DOT graph
- Generates a DOT graph that visualizes function control flow of a Solidity contract and highlights potential security vulnerabilities.
- Visualize Solidity control flow
- not support for EVM bytecode
- a Node.js package

#### [Dr.Y's Ethereum Contract Analyzer](https://github.com/pirapira/dry-analyzer)
- [Online Version](http://dry.yoichihirai.com/) 
  - Input: bytecodes
- Programming language: OCaml
- Notes:
  - use and rename the pre-compiled one to `opam`, modify the `PATH` and wait `opam init` for a long time (about an hour). 
  - It starts a web server at <localhost:xxxx>, xxxx is specified by yourself.
- Code structure::grey_question:
  - TODO
- Issues:
  - 20 open now in Github

#### [Securify](https://securify.ch/)
- [Automatically Detecting the Bug that Froze Parity Wallets](https://medium.com/@SecurifySwiss/automatically-detecting-the-bug-that-froze-parity-wallets-ad2bebebd3b0)
- [team page](http://www.srl.inf.ethz.ch/securify)

#### [SmartCheck](https://tool.smartdec.net/)
- provided by [SmartDec](https://smartcontracts.smartdec.net/)  
> SmartCheck: Static Code Analyzer  
> We have built our own static code analyzer for Solidity. Our full analysis includes complete manual analysis and verification of all the issues reported by SmartCheck.

#### Oyente

#### [EthFiddle](https://ethfiddle.com/) Solidity IDE in the Browser

- Powered By Loom Network

####[Vyper online](https://vyper.online/)

- [Documentation](https://vyper.readthedocs.io/en/latest/index.html)
- [Github repo](https://github.com/ethereum/vyper)
- Install: `pip install vyper`, Python 3 required.
- `vyper-run`: support some features as `hevm`.

#### [Remix - Solidity IDE](http://remix.ethereum.org)

- should pay attention to input format:
  - address: **"**0xcafecafecafe...**"**
  - address []: ["0x...", "0x..."]
  - uint256: 0xcafecafecafe...
- **Security**
  - Transaction origin: Warn if tx.origin is used
  - Check effects: Avoid potential reentrancy bugs
  - Inline assembly: Use of Inline Assembly
  - Block timestamp: Semantics maybe unclear
  - Low level calls: Semantics maybe unclear
  - Block.blockhash usage: Semantics maybe unclear
  - Selfdestruct: Be aware of caller contracts.
- **Gas & Economy**
  - Gas costs: Warn if the gas requirements of functions are too high.
  - This on local calls: Invocation of local functions via this
  - Delete on dynamic Array: Use require and appropriately
- **Miscellaneous**
  - Constant functions: Check for potentially constant functions
  - Similar variable names: Check if variable names are too similar
  - no return: Function with return type is not returning
  - Guard Conditions: Use require and appropriately
  - Result not used: The result of an operation was not used.

### Other Useful Development Tools or Testing Framework
#### Formal verification framework

- [AxLang: Formally Verifiable Smart Contracts for the Ethereum Ecosystem](https://medium.com/axoni/axlang-formally-verifiable-smart-contracts-for-the-ethereum-ecosystem-6201203be4e8)
- [Bamboo](https://github.com/pirapira/bamboo)
- [Certik](https://certik.org/)

#### Disassembler

- evmdis: human readable 
  - `echo -n $(cat your.bin-runtime) > true.bin-runtime`
  - `cat true.bin-runtime | evmdis > your.disasm`
- hevm: can specify some opcode behaviors
- opcode-tool: Etherscan online  
- evm disasm: 
- Solidity online toolbox


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
- [getStorageAt](https://medium.com/aigang-network/how-to-read-ethereum-contract-storage-44252c8af925): how to read smart contract storage

#### Decompiler
  - [porosity](https://github.com/comaeio/porosity) [(report)](https://www.comae.io/reports/dc25-msuiche-Porosity-Decompiling-Ethereum-Smart-Contracts-wp.pdf) (July 7, 2017)  [(talk at DEFCON25)](https://www.youtube.com/watch?v=d7EcNyuJy2g)
    - Decompiler and Security Analysis tool for Blockchain-based Ethereum Smart-Contracts
    - Three main usages:
      1. Disassemble
      2. Decompilation
      3. Some bugs detection: (**TODO**: figure out the logic for each supported type)
      - Notes:
        1. `--code` is mandatory. `--abi` is optional but recommended.
        2. `--cfg` can generate `dot` code for contract's CFG. Save the output as `file.dot` then `dot file.dot -Tpdf -o image.pdf` to get the image (Install graphviz: `sudo apt-get install graphviz`). Among `-Tps`, `-Tpng` and `-Tpdf`, `-Tpdf` is [the best](images/GeneScienceCFG.pdf).
      - Install
        1. Download from Github and follow this [page](https://www.reddit.com/r/ethdev/comments/6qmwn2/anyone_able_to_compile_porosity_on_linux/)
        2. Set environments by command `abi=$(cat ./output/SendBalance.abi)`
        3. `-- code` can be followed by `$bin` or `$binRuntime`.

      - Problems/issues:
        1. executeInstruction: NOT_IMPLEMENTED: REVERT | NUMBER | MSIZE

      - Some try:
        1. To decompile CryptoKitties geneScience contract, it crashed for massive memory usage.
        2. To decompile provided `vulnerable.sol` but failed, too.

  <details>
  	<summary>click here to view <b>porosity help</b></summary>

  ```
  parse: Please at least provide some byte code (--code) or run it in debug mode (--debug) with pre-configured inputs.
  Porosity v0.1 (https://www.comae.io)
  Matt Suiche, Comae Technologies <support@comae.io>
  The Ethereum bytecode commandline decompiler.
  Decompiles the given Ethereum input bytecode and outputs the Solidity code.


  Usage: porosity [options]
  Debug:
      --debug                             - Enable debug mode. (testing only - no input parameter needed.)

  Input parameters:
      --code <bytecode>                   - Ethereum bytecode. (mandatory)
      --code-file <filename>              - Read ethereum bytecode from file
      --arguments <arguments>             - Ethereum arguments to pass to the function. (optional, default data set provided if not provided.)
      --abi <arguments>                   - Ethereum Application Binary Interface (ABI) in JSON format. (optional but recommended)
      --hash <hashmethod>                 - Work on a specific function, can be retrieved wit --list. (optional)

  Features:
      --list                              - List identified methods/functions.
      --disassm                           - Disassemble the bytecode.
      --single-step                       - Execute the byte code through our VM.
      --cfg                               - Generate a the control flow graph in Graphviz format.
      --cfg-full                          - Generate a the control flow graph in Graphviz format (including instructions)
      --decompile                         - Decompile a given function or all the bytecode.
  ```
  </details>    


  ### Test Coverage
  #### Solidity-coverage
  - <https://github.com/sc-forks/solidity-coverage>

  ### Library
  #### [OpenZeppelin](https://github.com/OpenZeppelin/zeppelin-solidity)
  - OpenZeppelin, a framework to build secure smart contracts on Ethereum
  - e.g., [SafeMath.sol](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/math/SafeMath.sol) and [Ownable.sol](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/ownership/Ownable.sol)

  ### Semantics
  #### [KEVM](https://github.com/kframework/evm-semantics)

- K
  - [ERC20-K](https://runtimeverification.com/blog/?p=496): Formal Executable Specification of ERC20

#### [LEM](https://github.com/mrsmkl/ethereum-lem)

- [Formal Verification of Deed Contract in Ethereum Name Service](https://github.com/pirapira/eth-isabelle) ([pdf](https://yoichihirai.com/deed.pdf))
  - It verifies a specific contract. The target is the EVM bytecode for "Deed", a contract part of the Ethereum Name Service. The theorem proved through [Isabelle/HOL](https://isabelle.in.tum.de/index.html) states that, upon an invocation of the contract, only its owner can decrease the balance.


### Virtual Machine
#### [IELE](https://runtimeverification.com/blog/?p=498)

### Framework
#### [embark](https://github.com/iurimatias/embark-framework)
> Framework for serverless Decentralized Applications using Ethereum, IPFS and other platforms

  ### Useful Resources
  - <https://github.com/pirapira/ethereum-formal-verification-overview>
  - <https://github.com/pirapira/awesome-ethereum-virtual-machine>
  - [Week in Ethereum News](http://www.weekinethereum.com/)
  - [Solidity Bug Info](https://etherscan.io/solcbuginfo)
  - [Awesome Ethereum](http://awesome-ethereum.com/) 
  - [awesome-solidity](https://github.com/bkrem/awesome-solidity)

