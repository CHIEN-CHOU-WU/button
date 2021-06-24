import Web3 from "web3";
import './App.css';
import buttonABI from "./button.json";

declare let window: any;

function App() {
  // let web3 = new Web3('https://rpc.goerli.mudit.blog');
  let web3;
  
  if (typeof window !== "undefined" && typeof window.web3 !== "undefined") {
    // We are in the browser and metamask is running.
    //window.ethereum.enable();
    web3 = new Web3(window.web3.currentProvider);
    var address = window.web3.currentProvider.selectedAddress;
    // console.log(address);
    console.log(window.ethereum);
  } else {
    // We are on the server *OR* the user is not running metamask
    // const provider = new Web3.providers.HttpProvider("https://ropsten.infura.io/v3/dd5e8c6ebc7340f3a800df5a4c9aa832");
    console.log('test');
    
    web3 = new Web3(window.web3.currentProvider);
    //window.web3.currentProvider.enable();
  }
  
  const buttonAddress = "0x5bBa5dDA0ADc422e00f704A8a9432Cf2c15c3128"
  const buttonCount = new web3.eth.Contract(buttonABI as any, buttonAddress);
  const count = async () => {
    const button = await buttonCount.methods.buttonCount().call()
    console.log(button);
  }
  const getResult = () => {
    count();
    buttonCount.methods.addButton().send({from:address});
    // buttonCount.methods.addButton().send({from:address, value: 1000000000000000000});
    count();
  }
  
  return (
    <div className="App">
      <button onClick={getResult}>Push Me</button>
    </div>
  );
}

export default App;