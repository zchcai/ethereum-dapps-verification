
# Verification on Ethereum DApps
## State-of-the-art
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


#### Mythril
#### Oyente
#### Solgraph
#### Dr.Y's Ethereum Contract Analyzer
- <https://github.com/pirapira/dry-analyzer>
- <http://dry.yoichihirai.com/>

#### Securify
- <https://securify.ch/>

### Test Coverage
#### Solidity-coverage
- <https://github.com/sc-forks/solidity-coverage>

### Library
#### OpenZeppelin
- OpenZeppelin, a framework to build secure smart contracts on Ethereum
- <https://github.com/OpenZeppelin/zeppelin-solidity>
- e.g., [SafeMath.sol](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/math/SafeMath.sol) and [Ownable.sol](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/ownership/Ownable.sol)

### Semantics
#### KEVM
- https://github.com/kframework/evm-semantics
#### LEM
- <https://github.com/pirapira/eth-isabelle>

### Virtual Machine
#### IELE
- <https://runtimeverification.com/blog/?p=498>

### Resource
- <https://consensys.github.io/smart-contract-best-practices/security_tools/>
- <https://github.com/pirapira/ethereum-formal-verification-overview>
