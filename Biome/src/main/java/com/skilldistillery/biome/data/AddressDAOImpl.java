package com.skilldistillery.biome.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Address;

@Service
@Transactional
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Address createAddress(Address address) {

		em.persist(address);
		em.flush();

		return address;
	}

	@Override
	public Address updateAddress(int addressId, Address address) {

		Address updatedAddress = em.find(Address.class, addressId);
		if (updatedAddress != null) {
			updatedAddress.setStreet(address.getStreet());
			updatedAddress.setCity(address.getCity());
			updatedAddress.setState(address.getState());
			updatedAddress.setZip(address.getZip());
		}
		
		
		return updatedAddress;
	}

}
