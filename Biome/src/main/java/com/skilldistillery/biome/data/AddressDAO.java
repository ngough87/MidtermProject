package com.skilldistillery.biome.data;

import com.skilldistillery.biome.entities.Address;

public interface AddressDAO {

	Address createAddress(Address address);
	Address updateAddress(int addressId, Address address);
	
	
}
