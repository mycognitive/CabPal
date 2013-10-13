<%@ page import="cabpal.Booking" %>



<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'sourceAddress', 'error')} required">
	<label for="sourceAddress">
		<g:message code="booking.sourceAddress.label" default="Source Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sourceAddress" required="" value="${bookingInstance?.sourceAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'destinationAddress', 'error')} ">
	<label for="destinationAddress">
		<g:message code="booking.destinationAddress.label" default="Destination Address" />
		
	</label>
	<g:textField name="destinationAddress" value="${bookingInstance?.destinationAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'clientName', 'error')} required">
	<label for="clientName">
		<g:message code="booking.clientName.label" default="Client Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clientName" required="" value="${bookingInstance?.clientName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'journeyTime', 'error')} required">
	<label for="journeyTime">
		<g:message code="booking.journeyTime.label" default="Journey Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="journeyTime" precision="day"  value="${bookingInstance?.journeyTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'createdTime', 'error')} required">
	<label for="createdTime">
		<g:message code="booking.createdTime.label" default="Created Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdTime" precision="day"  value="${bookingInstance?.createdTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'isConfirmed', 'error')} ">
	<label for="isConfirmed">
		<g:message code="booking.isConfirmed.label" default="Is Confirmed" />
		
	</label>
	<g:checkBox name="isConfirmed" value="${bookingInstance?.isConfirmed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'estimatedTime', 'error')} required">
	<label for="estimatedTime">
		<g:message code="booking.estimatedTime.label" default="Estimated Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimatedTime" type="number" value="${bookingInstance.estimatedTime}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="booking.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cost" type="number" value="${bookingInstance.cost}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'isComplete', 'error')} ">
	<label for="isComplete">
		<g:message code="booking.isComplete.label" default="Is Complete" />
		
	</label>
	<g:checkBox name="isComplete" value="${bookingInstance?.isComplete}" />
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="booking.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" pattern="${bookingInstance.constraints.phone.matches}" required="" value="${bookingInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="booking.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${cabpal.Company.list()}" optionKey="id" required="" value="${bookingInstance?.company?.id}" class="many-to-one"/>
</div>

