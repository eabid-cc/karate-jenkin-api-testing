Feature: Retrieve Jenkins api

  Background:

    * def credentials = read('classpath:credentials.json')
    * header Authorization = call read('classpath:basic-auth.js') { username: '#(credentials.user)', password: '#(credentials.pwd)' }

  Scenario: Verify that JSON formated Jenkins API contains a job called 'Project1'

    Given url 'http://localhost:8080/api/json?pretty=true'
    When method get
    Then status 200
    And match response.jobs[*].name contains ['Project1']

  Scenario: Verify that XML formated Jenkins API contains a job called 'Project1'

    Given url 'http://localhost:8080/api/xml'
    When method get
    Then status 200
    And match response //job/name contains 'Project1'