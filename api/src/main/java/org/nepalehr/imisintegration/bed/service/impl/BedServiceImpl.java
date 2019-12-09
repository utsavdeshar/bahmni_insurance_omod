package org.nepalehr.imisintegration.bed.service.impl;

import java.util.List;

import org.nepalehr.imisintegration.bed.dao.BedDao;
import org.nepalehr.imisintegration.bed.service.BedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BedServiceImpl implements BedService {

	@Autowired
	private BedDao bedDao;

	@Override
	public List<String> getActiveBedAssignmentUuids() {
		return bedDao.getActiveBedAssignmentUuids();
	}

}
