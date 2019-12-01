package org.nepalehr.imisintegration.bed.scheduler.tasks;

import org.openmrs.api.context.Context;
import org.openmrs.scheduler.tasks.AbstractTask;
import org.springframework.stereotype.Component;

import org.nepalehr.imisintegration.bed.scheduler.service.IpdBedSalesQuotationService;

@Component
public class IpdBedSaleQuotationTask extends AbstractTask {

	@Override
	public void execute() {
		Context.getService(IpdBedSalesQuotationService.class).publishEvent();
	}
}
