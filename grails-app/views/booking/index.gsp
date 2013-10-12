
<%@ page import="cabpal.Booking" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'booking.label', default: 'Booking')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-booking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-booking" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="booking.source.label" default="Source" /></th>
					
						<th><g:message code="booking.destination.label" default="Destination" /></th>
					
						<g:sortableColumn property="journeyTime" title="${message(code: 'booking.journeyTime.label', default: 'Journey Time')}" />
					
						<g:sortableColumn property="createdTime" title="${message(code: 'booking.createdTime.label', default: 'Created Time')}" />
					
						<th><g:message code="booking.client.label" default="Client" /></th>
					
						<th><g:message code="booking.company.label" default="Company" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bookingInstanceList}" status="i" var="bookingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bookingInstance.id}">${fieldValue(bean: bookingInstance, field: "source")}</g:link></td>
					
						<td>${fieldValue(bean: bookingInstance, field: "destination")}</td>
					
						<td><g:formatDate date="${bookingInstance.journeyTime}" /></td>
					
						<td><g:formatDate date="${bookingInstance.createdTime}" /></td>
					
						<td>${fieldValue(bean: bookingInstance, field: "client")}</td>
					
						<td>${fieldValue(bean: bookingInstance, field: "company")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bookingInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
