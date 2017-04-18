Feature: Demo Karate against Jenkins

  Background:

    * def credentials = read('classpath:credentials.json')
    * header Authorization = call read('classpath:basic-auth.js') { username: '#(credentials.user)', password: '#(credentials.pwd)' }

  Scenario: Verify that call to build a job called with a GET request returns status 201

    Given url 'http://localhost:8080/job/Project1/build?token=' + credentials.buildToken
    When method get
    Then status 201

  Scenario: Verify that call to build a job called with a GET request but invalid build token returns status 403

    Given url 'http://localhost:8080/job/Project1/build?token=' + 'randomString'
    When method get
    Then status 403

  Scenario: Verify that call to build a job called with a POST request returns status 201
            Note request body (in form of 'request {}) is require as method is POST

    Given url 'http://localhost:8080/job/Project1/build'
    And header Jenkins-Crumb = credentials.Jenkins-Crumb
    And request {}
    When method post
    Then status 201

  Scenario: Verify that call to build a job called witn an incorrect CRSF token value returns status 403
            Note request body (in form of 'request {}) is require as method is POST

    Given url 'http://localhost:8080/job/Project1/build'
    And header Jenkins-Crumb = 'someRandonString'
    And request {}
    When method post
    Then status 403
    And match response contains 'No valid crumb was included in the request'