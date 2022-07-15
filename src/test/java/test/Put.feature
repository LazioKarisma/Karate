Feature: Put API Demo 
Background: 
	* url 'https://reqres.in/api'
    * header accept = 'application/json'
	# Simple Get Request
Scenario: Put Demo 1 
	Given url 'https://reqres.in/api/users/2' 
	And request {"name" : "morpheus" , "job": "zion resident"} 
	When method PUT 
	Then status 200 
	And print response 
	And print responseStatus 
