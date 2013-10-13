
<%@ page import="cabpal.Booking" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'booking.label', default: 'Booking')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-booking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-booking" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list booking">
			
				<g:if test="${bookingInstance?.sourceAddress}">
				<li class="fieldcontain">
					<span id="sourceAddress-label" class="property-label"><g:message code="booking.sourceAddress.label" default="Source Address" /></span>
					
						<span class="property-value" aria-labelledby="sourceAddress-label"><g:fieldValue bean="${bookingInstance}" field="sourceAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.destinationAddress}">
				<li class="fieldcontain">
					<span id="destinationAddress-label" class="property-label"><g:message code="booking.destinationAddress.label" default="Destination Address" /></span>
					
						<span class="property-value" aria-labelledby="destinationAddress-label"><g:fieldValue bean="${bookingInstance}" field="destinationAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.clientName}">
				<li class="fieldcontain">
					<span id="clientName-label" class="property-label"><g:message code="booking.clientName.label" default="Client Name" /></span>
					
						<span class="property-value" aria-labelledby="clientName-label"><g:fieldValue bean="${bookingInstance}" field="clientName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.journeyTime}">
				<li class="fieldcontain">
					<span id="journeyTime-label" class="property-label"><g:message code="booking.journeyTime.label" default="Journey Time" /></span>
					
						<span class="property-value" aria-labelledby="journeyTime-label"><g:formatDate date="${bookingInstance?.journeyTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.createdTime}">
				<li class="fieldcontain">
					<span id="createdTime-label" class="property-label"><g:message code="booking.createdTime.label" default="Created Time" /></span>
					
						<span class="property-value" aria-labelledby="createdTime-label"><g:formatDate date="${bookingInstance?.createdTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.isConfirmed}">
				<li class="fieldcontain">
					<span id="isConfirmed-label" class="property-label"><g:message code="booking.isConfirmed.label" default="Is Confirmed" /></span>
					
						<span class="property-value" aria-labelledby="isConfirmed-label"><g:formatBoolean boolean="${bookingInstance?.isConfirmed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.estimatedTime}">
				<li class="fieldcontain">
					<span id="estimatedTime-label" class="property-label"><g:message code="booking.estimatedTime.label" default="Estimated Time" /></span>
					
						<span class="property-value" aria-labelledby="estimatedTime-label"><g:fieldValue bean="${bookingInstance}" field="estimatedTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="booking.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:fieldValue bean="${bookingInstance}" field="cost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.isComplete}">
				<li class="fieldcontain">
					<span id="isComplete-label" class="property-label"><g:message code="booking.isComplete.label" default="Is Complete" /></span>
					
						<span class="property-value" aria-labelledby="isComplete-label"><g:formatBoolean boolean="${bookingInstance?.isComplete}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="booking.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${bookingInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="booking.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="company" action="show" id="${bookingInstance?.company?.id}">${bookingInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bookingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bookingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
