# STYX v0.1

STYX is a DAI-backed Euro for Ethereum.

The current version was developed during [Chainlink Hackathon](https://hack.chain.link/) (September 7 - 27, 2020).

DISCLAIMER: Use at your own risk.

## Motivation

There wasn't any reliable ERC20 version of the Euro before.

## Install

Clone this repository, and go to your root folder:

```cd styx-core/packages/buidler```

Then:

```yarn install```

Run a local blockchain:

```yarn chain```

Deploy smart contracts to the blockchain:

```yarn deploy```

## Test

```yarn test```

## Run

Make sure your wallet holds Kovan ETH and Kovan DAI.

#### From your machine

```
// In JS, trigger the issue() function with x amount
```

#### Live demo

[https://styx.eth](https://styx.eth.link)

## Flowchart

![STYX-flowchart](http://ipfs.io/ipfs/QmWFdTHHcVfWLLUNPz4Vt9Gc63syBMSds47HKnboyevfEk)

## Description

STYX is DAI-backed euro, meaning 1 STYX == 1 EUR whatever happens. Right now there is no trustless euro available on Ethereum, it is awaited by the crypto community and beyond. This is now fixed thanks to the pricefeed oracle provided by Chainlink. The targeted use cases are (1) payment (DApps, DeFi, d-Commerce) and (2) trading/hedging.

Security and trustlessness will always remain our main focus, that’s why we’ve chosen to work with Chainlink and the OpenZeppelin’s ERC20 contract. Then, we wanted it to be terribly simple to use: you send DAIs to the contract and you receive your STYXs. Users know they always can sell your STYXs to the contract for the equivalent in DAI at zero fees, this is important because it dramatically increases trust for both users and potential off-chain brokers. In addition to that, we integrated Chainlink with C-Layer which brings the compliance that’s required on this type of project. This will allow us to integrate SEPA EUR derivatives in further versions, constantly lowering the risks.

## Monetary design

The reserve always holds 10% extra DAIs to cover the risk of a sudden 10% price drop on the USD/EUR global market.

The implementation of secured and functional liquidity pools is in progress.

## C-Layer

See [https://github.com/STYX2DAI/STYX](https://github.com/STYX2DAI/STYX).

## Resources

- [Devpost project page](https://devpost.com/software/styx-65rx78)
- [Slides describing the idea](https://docs.google.com/presentation/d/1MP2aSwr48amMVU_-5ndcFwyIxrnkYw2wiVO9ui0yyjY/edit?usp=sharing)
- [Miro Flowchart](https://miro.com/app/board/o9J_kldfg4A=/)
- Twitter: [@STYX2DAI](https://twitter.com/STYX2DAI)
- Contact: [styx2dai@gmail.com](http://mailto:styx2dai@gmail.com)
- About [Chainlink](https://docs.chain.link/docs/reference-contracts#kovan)
- About [C-Layer](https://github.com/c-layer/contracts)
- About [DAI](https://makerdao.com/)
- About [Buidler](https://buidler.dev/)

## Licence

GNU General Public License v3.0
