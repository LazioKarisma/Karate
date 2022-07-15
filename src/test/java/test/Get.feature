Feature: Get API Demo 
Background: 
	* url 'https://reqres.in/api'
   # * header accept = 'application/json'
   * header accept = '*/*'
   * header Accept-Encoding = 'gzip, deflate, br'
   * header Connection = 'keep-alive'
    
	# Simple Get Request
Scenario: Get Demo 1 
	Given url 'https://id-erecruit-bff-service-dev-jenkins.apps.sea.preview.pcf.manulife.com/v1/idn/recruit/getAgentProfile/300009?agentId=300009' 
	When method GET 
	Then status 200 
	And print response 
	And print responseStatus 
	And print responseTime 
	And print responseHeaders 
	And print responseCookies 
		
		# Get With Background
	Scenario: Sample Demo 2 
		Given path '/users?page=2' 
		When method GET 
		Then status 200 
		And print response 
		
		#Get with Path, Params	
	Scenario: Sample Demo 3 
		Given path '/users' 
		And param page = 2 
		When method GET 
		Then status 200 
		And print response 
		
		#Get with assertions
	Scenario: Sample Demo 3 
		Given path '/users' 
		And param page = 2 
		When method GET 
		Then status 200 
		And print response 
		And match response.data[0].first_name != null 
		And assert response.data.length == 6 
		And match $.data[3].id == 10 
		And match response.data[4].last_name == 'Edwards'