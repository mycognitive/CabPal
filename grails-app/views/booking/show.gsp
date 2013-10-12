
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
			
				<g:if test="${bookingInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="booking.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:link controller="address" action="show" id="${bookingInstance?.source?.id}">${bookingInstance?.source?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookingInstance?.destination}">
				<li class="fieldcontain">
					<span id="destination-label" class="property-label"><g:message code="booking.destination.label" default="Destination" /></span>
					
						<span class="property-value" aria-labelledby="destination-label"><g:link controller="address" action="show" id="${bookingInstance?.destination?.id}">${bookingInstance?.destination?.encodeAsHTML()}</g:link></span>
					
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
			
				<g:if test="${bookingInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="booking.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${bookingInstance?.client?.id}">${bookingInstance?.client?.encodeAsHTML()}</g:link></span>
					
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
