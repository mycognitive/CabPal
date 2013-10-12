<%@ page import="cabpal.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'line1', 'error')} required">
	<label for="line1">
		<g:message code="address.line1.label" default="Line1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="line1" required="" value="${addressInstance?.line1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'line2', 'error')} ">
	<label for="line2">
		<g:message code="address.line2.label" default="Line2" />
		
	</label>
	<g:textField name="line2" value="${addressInstance?.line2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'postcode', 'error')} required">
	<label for="postcode">
		<g:message code="address.postcode.label" default="Postcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="postcode" required="" value="${addressInstance?.postcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${addressInstance?.city}"/>
</div>

