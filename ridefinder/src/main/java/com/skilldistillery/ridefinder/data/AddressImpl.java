package com.skilldistillery.ridefinder.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.ridefinder.entities.Address;

@Service
@Transactional
public class AddressImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Address createAddress(Address address) {
		address.setEnabled(true);
		em.persist(address);
		return address;
	}
	
	

}
