package jenkins;

import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
public class JenkinsTest {
    /**
     * Acts as a test runner for all feature files under this directory.
     * Complies with junit class naming convention so that can be run
     * from command line as mvn parameter
     *
     *      mvn test -Dcucumber.options="--plugin html:target/cucumber-html --tags ~@ignore"" -Dtest=JenkinsTest
     */
}
