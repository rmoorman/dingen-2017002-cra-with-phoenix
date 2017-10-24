import React, {Component} from "react"
import {Socket} from "phoenix"
import {soundManager} from "soundmanager2"

import "./App.css"
import woof from "./woof.mp3"

const SOCKET_URL = "/api/socket"
const CHANNEL = "dingen"

class App extends Component {
  state = {
    logs: [],
  }
  componentDidMount() {
    const socketConfig = {
      logger: (kind, msg, data) => {
        this.handleLog(`${kind}: ${msg}`, data)
      },
    }
    const socket = new Socket(SOCKET_URL, socketConfig)
    const channel = socket.channel(CHANNEL)

    channel.on("woof", this.handleWoof)

    channel
      .join()
      .receive("ok", res => this.handleLog("join succeeded", {res}))
      .receive("error", error => this.handleLog("join failed", {error}))

    socket.connect()

    soundManager.onready(() => {
      this.woof = soundManager.createSound({url: woof})
    })
  }
  handleWoof = () => {
    this.woof && this.woof.play()
  }
  handleLog = (message, data) => {
    const {logs} = this.state
    this.setState({logs: [...logs, {message, data, when: new Date()}]})
  }
  render() {
    const {logs} = this.state
    return (
      <div className="App">
        <header className="App-header">
          <span className="App-logo" role="img" aria-label="woof">
            🐶
          </span>
          <h1 className="App-title">Woof!</h1>
        </header>
        <div className="App-content">
          <p className="App-intro">
            See a log of incoming channel events below:
          </p>
          <table>
            <thead>
              <tr>
                <th>Time</th>
                <th>Message</th>
                <th>Data</th>
              </tr>
            </thead>
            <tbody>
              {logs.map(({message, data, when}, i) => (
                <tr key={i}>
                  <th>{when.toISOString()}</th>
                  <td>{message}</td>
                  <td>{JSON.stringify(data)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    )
  }
}

export default App
