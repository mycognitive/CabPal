
<%@ page import="cabpal.Address" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-address" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list address">
			
				<g:if test="${addressInstance?.line1}">
				<li class="fieldcontain">
					<span id="line1-label" class="property-label"><g:message code="address.line1.label" default="Line1" /></span>
					
						<span class="property-value" aria-labelledby="line1-label"><g:fieldValue bean="${addressInstance}" field="line1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.line2}">
				<li class="fieldcontain">
					<span id="line2-label" class="property-label"><g:message code="address.line2.label" default="Line2" /></span>
					
						<span class="property-value" aria-labelledby="line2-label"><g:fieldValue bean="${addressInstance}" field="line2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.postcode}">
				<li class="fieldcontain">
					<span id="postcode-label" class="property-label"><g:message code="address.postcode.label" default="Postcode" /></span>
					
						<span class="property-value" aria-labelledby="postcode-label"><g:fieldValue bean="${addressInstance}" field="postcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="address.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${addressInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:addressInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${addressInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
