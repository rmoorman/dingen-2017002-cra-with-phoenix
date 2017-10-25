import React from "react"
import {Socket} from "phoenix"
import {css} from "react-emotion"

const SOCKET_URL = "/api/socket"
const CHANNEL = "dingen"

const appStyle = css`
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
`

const buttonStyle = css`
  display: inline-block;
  padding: 10px 30px;
  font-size: 50px;
  font-weight: bold;
  color: white;
  background: purple;
  border: none;
  border-radius: 10px;
  transform: scale(1);
  transition: all 0.3s ease;
  outline: none;

  &:hover,
  &:focus {
    background: #626;
  }
  &:active {
    transform: scale(0.9);
  }
`

class App extends React.Component {
  handleClick = () => {
    const socket = new Socket(SOCKET_URL)
    socket.connect()
    const channel = socket.channel(CHANNEL)
    channel.join().receive("ok", () => {
      channel.push("woof")
      socket.disconnect()
    })
  }
  render() {
    return (
      <div className={appStyle}>
        <button className={buttonStyle} onClick={this.handleClick}>
          Woof!
        </button>
      </div>
    )
  }
}

export default App
