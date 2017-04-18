package jenkins.build;

import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
public class BuildRunner {

    /**
     * This class act as a test runner for the feature
     * files located at this level and any child
     * directories.
     * This class can also be run as a parameter from
     * the mvn commandline;
     *
     *      mvn test -DargLine="-Dkarate.env=dev" -Dtest=BuildRunner
     *
     */

}
