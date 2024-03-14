pragma solidity >=0.4.22 < 0.9.0;

// Created contract model
contract SupplyChain {

    // stores owner address
    address public Owner;

    constructor() public {
        Owner = msg.sender;

    }

    modifier onlyByOwner() {
        require(msg.sender == Owner);
        _;
    }


    enum STAGE {
        Init, 
        RawMaterialStage,
        Manufacture,
        Distribution,
        Retail,
        Sold
    }

    uint256 public medicineCtr = 0;
    uint256 public rmsCtr = 0;
    uint256 public manCtr = 0;
    uint256 public disCtr = 0;
    uint256 public retCtr = 0;

    //To store information about the product
    struct product {
        uint256 id; 
        string name; 
        string description; 
        uint256 RMSid;
        uint256 MANid;
        uint256 DISid;
        uint256 RETid;
        STAGE stage;
    }

    mapping(uint256 => product) public ProductStock;

    //To show status to client applications
    function showStage(uint256 _productID)
        public
        view
        returns (string memory)
    {
        require(medicineCtr > 0);
        if (ProductStock[_productID].stage == STAGE.Init)
            return "Product Ordered";
        else if (ProductStock[_productID].stage == STAGE.RawMaterialSupply)
            return "Raw Material Supply Stage";
        else if (ProductStock[_productID].stage == STAGE.Manufacture)
            return "Manufacturing Stage";
        else if (ProductStock[_productID].stage == STAGE.Distribution)
            return "Distribution Stage";
        else if (ProductStock[_productID].stage == STAGE.Retail)
            return "Retail Stage";
        else if (ProductStock[_productID].stage == STAGE.sold)
            return "Product Sold";
    }

    //Raw material supplier
    struct rawMaterialSupplier {
        address addr;
        uint256 id;
        string name;
        string place;
    }

    mapping(uint256 => rawMaterialSupplier) public RMS;

    //Manufacturer
    struct manufacturer {
        address addr;
        uint256 id;
        string name; 
        string place;
    }

    mapping(uint256 => manufacturer) public MAN;


    // Distributor
    struct distributor {
        address addr;
        uint256 id; 
        string name; 
        string place;
    }

    mapping(uint256 => distributor) public DIS;

    // Retailer
    struct retailer {
        address addr;
        uint256 id;
        string name; 
        string place;
    }

    mapping(uint256 => retailer) public RET;

}