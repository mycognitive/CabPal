<%@ page import="cabpal.Booking" %>



<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'source', 'error')} required">
	<label for="source">
		<g:message code="booking.source.label" default="Source" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="source" name="source.id" from="${cabpal.Address.list()}" optionKey="id" required="" value="${bookingInstance?.source?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'destination', 'error')} ">
	<label for="destination">
		<g:message code="booking.destination.label" default="Destination" />
		
	</label>
	<g:select id="destination" name="destination.id" from="${cabpal.Address.list()}" optionKey="id" value="${bookingInstance?.destination?.id}" class="many-to-one" noSelection="['null': '']"/>
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

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="booking.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${cabpal.Client.list()}" optionKey="id" required="" value="${bookingInstance?.client?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookingInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="booking.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${cabpal.Company.list()}" optionKey="id" required="" value="${bookingInstance?.company?.id}" class="many-to-one"/>
</div>

