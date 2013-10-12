<%@ page import="cabpal.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'firstname', 'error')} required">
	<label for="firstname">
		<g:message code="client.firstname.label" default="Firstname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstname" required="" value="${clientInstance?.firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'lastname', 'error')} ">
	<label for="lastname">
		<g:message code="client.lastname.label" default="Lastname" />
		
	</label>
	<g:textField name="lastname" value="${clientInstance?.lastname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="client.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${clientInstance?.phone}"/>
</div>

