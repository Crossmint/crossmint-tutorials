import "./App.css";
import { CrossmintPayButton } from "@crossmint/client-sdk-react-ui";

function App() {
  return (
    <div className="app">
      <h1>My Epic BNB NFT</h1>

      <div className="image-box">
        <img className="image" src={process.env.REACT_APP_COVER_IMAGE} />

        <h3 className="mint-price">Mint Price: 0.001 BNB</h3>
        <CrossmintPayButton
          clientId={process.env.REACT_APP_CLIENT_ID}
          environment="staging"
          theme="light"
          mintConfig={{
            type: "erc-721",
            amount: "1",
            totalPrice: ".001",
            // your custom minting arguments...
          }}
        />
      </div>
    </div>
  );
}

export default App;
