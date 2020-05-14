pragma solidity ^0.4.24;
contract SupplyChain {
  address owner;
 uint  upc;
 uint  sku;

  mapping (uint => Item) items;
  mapping (uint => string[]) itemsHistory;
  enum State 
  { 
    Harvested, 
    Processed,  
    Packed,     
    ForSale,   
    Sold,       
    Shipped,    
    Received,   
    Purchased 
    }

State constant defaultState = State.Harvested;
  struct Item {
    uint    sku;  
    uint    upc; 
    address ownerID; 
    address originFarmerID; 
    string  originFarmName; 
    string  originFarmInformation;  
    string  originFarmLatitude; 
    string  originFarmLongitude;  
    uint    productID;  
    string  productNotes;
    uint    productPrice; 
    State   itemState;  
    address distributorID;  
    address retailerID; 
    address consumerID; 
  }
event Harvested(uint upc);
event Processed(uint upc);
event Packed(uint upc);
event ForSale(uint upc);
  event Sold(uint upc);
event Shipped(uint upc);
event Received(uint upc);
  event Purchased(uint upc);
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  modifier verifyCaller (address _address) {
    require(msg.sender == _address); 
    _;
  }
  modifier paidEnough(uint _price) { 
    require(msg.value >= _price); 
    _;
  }
  modifier checkValue(uint _upc) {
    _;
    uint _price = items[_upc].productPrice;
    uint amountToReturn = msg.value - _price;
    items[_upc].consumerID.transfer(amountToReturn);
  }
  modifier harvested(uint _upc) {
    require(items[_upc].itemState == State.Harvested);
    _;
  }
  modifier processed(uint _upc) {
    
  }
  modifier packed(uint _upc) {
    
  }
  modifier forSale(uint _upc) {
    
  }
  modifier sold(uint _upc) {
    
  }
  
  modifier shipped(uint _upc) {
    
  }

 
  modifier received(uint _upc) {
    
  }

  modifier purchased(uint _upc) {
    
  }
  constructor() public payable {
    owner = msg.sender;
    sku = 1;
    upc = 1;
  }
  function kill() public {
    if (msg.sender == owner) {
      selfdestruct(owner);
    }
  }
  function harvestItem(uint _upc, address _originFarmerID, string _originFarmName, string _originFarmInformation, string  _originFarmLatitude, string  _originFarmLongitude, string  _productNotes) public 
  {  
    sku = sku + 1;   
  }
  function processItem(uint _upc) public 
  {
    
  }
  function packItem(uint _upc) public 
  {
  
  }
  function sellItem(uint _upc, uint _price) public 
  
  {
   
  }

  
  function buyItem(uint _upc) public payable 
   
    {
    
  }

  function shipItem(uint _upc) public 
   
    {
    
  }
  function receiveItem(uint _upc) public 

    {   
  }
  function purchaseItem(uint _upc) public 
   
    {
  }
  function fetchItemBufferOne(uint _upc) public view returns 
  (
  uint    itemSKU,
  uint    itemUPC,
  address ownerID,
  address originFarmerID,
  string  originFarmName,
  string  originFarmInformation,
  string  originFarmLatitude,
  string  originFarmLongitude
  ) 
  {
  
    
  return 
  (
  itemSKU,
  itemUPC,
  ownerID,
  originFarmerID,
  originFarmName,
  originFarmInformation,
  originFarmLatitude,
  originFarmLongitude
  );
  }
  function fetchItemBufferTwo(uint _upc) public view returns 
  (
  uint    itemSKU,
  uint    itemUPC,
  uint    productID,
  string  productNotes,
  uint    productPrice,
  uint    itemState,
  address distributorID,
  address retailerID,
  address consumerID
  ) 
  {
    
  return 
  (
  itemSKU,
  itemUPC,
  productID,
  productNotes,
  productPrice,
  itemState,
  distributorID,
  retailerID,
  consumerID
  );
  }
}
