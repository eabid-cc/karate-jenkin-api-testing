# REST Testing Project

### Based on the Karate framework

This project is based on the Karate DSL framework

https://github.com/intuit/karate

The tests in the project use the REST api made available by an instance of the Jenkins CI server.

### _maven_ command line options
 
_Target a test runner class_

```
mvn test -Dtest=ApiRunner
```
_Set a system property that determines the **karate.env** properties set by 'karate-config.js'_
```
mvn test -DargLine="-Dkarate.env=dev" -Dtest=ApiRunner
```
_Set cucumber options_
```
mvn test -Dcucumber.options="--plugin html:target/cucumber-html" -Dtest=JenkinsTest
 
mvn test -Dcucumber.options="--plugin html:target/ cucumber-junit.xml --tags ~@ignore
```