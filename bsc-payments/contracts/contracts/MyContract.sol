pragma solidity ^0.8.0;

import "solmate/src/tokens/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyContract is ERC721, Ownable {
    
    uint256 public constant MAX_SUPPLY = 100000;
    uint256 public salePrice = 0.001 ether;
    uint256 public totalSupply;
    string public uri =
        "https://gateway.pinata.cloud/ipfs/QmPux5QgyPHfxjuCBf1GL6bnbYRoDdzwh9UGdnz2UXx58D";

    // MODIFIERS

    modifier isCorrectPayment() {
        require(salePrice == msg.value, "Incorrect ETH value sent");
        _;
    }

    modifier isAvailable() {
        require(totalSupply + 1 <= MAX_SUPPLY, "No more left");
        _;
    }

    constructor() payable ERC721("Crossmint Testing NFT", "XMTEST") {}

    // PUBLIC

    function mint() external payable isCorrectPayment isAvailable {
        _safeMint(msg.sender, totalSupply++);
    }


    function crossmint(address to, uint256 amount)
        external
        payable
        isAvailable
    {
        _safeMint(to, totalSupply += amount);
    }

    // ADMIN

    function setBaseURI(string calldata baseURI) external onlyOwner {
        uri = baseURI;
    }

    function setSalePrice(uint256 price) external onlyOwner {
        salePrice = price;
    }

    // VIEW

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        return uri;
    }
}