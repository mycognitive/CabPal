<%@ page import="cabpal.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="company.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${companyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="company.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${companyInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="company.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="address" name="address.id" from="${cabpal.Address.list()}" optionKey="id" required="" value="${companyInstance?.address?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="company.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${companyInstance?.email}"/>
</div>

