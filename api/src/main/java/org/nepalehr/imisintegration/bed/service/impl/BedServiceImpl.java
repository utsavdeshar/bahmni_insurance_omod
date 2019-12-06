package org.nepalehr.imisintegration.bed.service.impl;

import java.util.List;

import org.nepalehr.imisintegration.bed.dao.BedDao;
import org.nepalehr.imisintegration.bed.service.BedService;

public class BedServiceImpl implements BedService {

	private BedDao bedDao;

	public void setBedDao(BedDao bedDao) {
		this.bedDao = bedDao;
	}

	@Override
	public List<String> getActiveBedAssignmentUuids() {
		return bedDao.getActiveBedAssignmentUuids();
	}

}
