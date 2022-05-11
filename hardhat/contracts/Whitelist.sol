// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {

    /** 
     * @dev number of addresses whitelisted 
     */
    uint8 public numAddressesWhitelisted;

    /**
     * @dev limit to the amount of Whitelist spots 
     */
    uint8 public maxWhiteListAddresses;

    /**
     * @dev Mapping of WhitelistedAddresses
     */
    mapping(address => bool) public whitelistedAddresses;

    /** 
     * @dev Set the Max number of whitelisted addresses 
     * User will put the value at the time of deployment
     */
    constructor(uint8 _maxWhiteListAddresses) {
        maxWhiteListAddresses = _maxWhiteListAddresses;
    }

    /**
     * @dev function that adds the address to the sender to the whitelist
     */
    function addAddressToWhitelist() public {
        // check if user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if numAddressesWhitelisted < maxWhitelistedAddresses
        require(numAddressesWhitelisted < maxWhiteListAddresses, "More addresses cannot be added, limit reached");
        // add the address that called the function to the whitelisted address array
        whitelistedAddresses[msg.sender] = true;
        // increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }

}