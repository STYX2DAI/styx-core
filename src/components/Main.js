import React, { Component } from 'react'

class Main extends Component {
  render() {
    console.log('this.props.STYXBalance', this.props.STYXBalance)

    return (
      <div id="content" className="mt-3">
        <table className="table table-borderless text-muted text-center">
          <thead>
            <tr>
              <th scope="col">Staking Balance {this.props.tokenName}</th>
              <th scope="col">STYX Balance</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                {window.web3.utils.fromWei(this.props.stakingBalance, 'Ether')} {this.props.tokenName}
              </td>
              <td>{window.web3.utils.fromWei(this.props.STYXBalance, 'Ether')} STYX</td>
            </tr>
          </tbody>
        </table>

        <div className="card mb-4">
          <div className="card-body">
            <form
              className="mb-3"
              onSubmit={event => {
                event.preventDefault()
                let amount
                amount = this.input.value.toString()
                amount = window.web3.utils.toWei(amount, 'Ether')
                this.props.stakeTokens(amount, this.props.tokenAddress)
              }}
            >
              <div>
                <label className="float-left">
                  <b>Stake Tokens</b>
                </label>
                <span className="float-right text-muted">
                  max {window.web3.utils.fromWei(this.props.erc20Balance, 'Ether')}
                </span>
              </div>
              <div className="input-group mb-4">
                <input
                  type="text"
                  ref={input => {
                    this.input = input
                  }}
                  className="form-control form-control-lg"
                  placeholder="0"
                  required
                />
                <div className="input-group-append">
                  <div className="input-group-text">
                    <img src={this.props.image} height="32" alt="" />
                    &nbsp;&nbsp;&nbsp; {this.props.tokenName}
                  </div>
                </div>
              </div>
              <button type="submit" className="btn btn-primary btn-block btn-lg">
                STAKE!
              </button>
            </form>
            <button
              type="submit"
              className="btn btn-link btn-block btn-sm"
              onClick={event => {
                event.preventDefault()
                this.props.unstakeTokens(this.props.tokenAddress)
              }}
            >
              UNSTAKE
            </button>
          </div>
        </div>
      </div>
    )
  }
}

export default Main
