Feature: POST Api Demo 

Background: 
	* url 'https://reqres.in/api'
    * header accept = 'application/json'
    * def expectedOutput = read('response1.json');
    
	# Simple POST Request
Scenario: Post Demo 1 
	Given url 'https://reqres.in/api/users' 
	And request {"name": "Lazio", "job": "teacher"} 
	When method POST 
	Then status 201 
	And print response 
	And print responseStatus 
	
	# Simple POST with Background
Scenario: Post Demo 1 
	Given path '/users' 
	And request {"name": "Lazio", "job": "teacher"} 
	When method POST 
	Then status 201 
	And print response 
	
	# Simple POST with Assertion
Scenario: Post Demo 1 
	Given path '/users' 
	And request {"name": "Lazio", "job": "teacher"} 
	When method POST 
	Then status 201 
	And match response == expectedOutput 
	And match $ == expectedOutput 
	And print response 
	
	# Simple POST with read request body from file
Scenario: Post Demo 5
	Given path '/users' 
	And def projectPath = karate.properties["user.dir"] 
	And print projectPath 
	And def filePath = projectPath + "/src/test/java/data/request1.json"
	And print filePath 
	And def requestBody1 = filePath
	And request requestBody1 
	When method POST 
	Then status 201 
	And match response == expectedOutput 
	And match $ == expectedOutput 
	And print response
	
	# Simple POST with read response body from file
Scenario: Post Demo 6
	Given path '/users' 
	And def reqBody = read("request1.json")
	And set reqBody.job = "engineer"
	And request reqBody
	When method POST 
	Then status 201 
	And match response == expectedOutput 
	And match $ == expectedOutput 
	And print response