/**
 * Created by alexanderbelenov on 04.07.2022.
 */

@IsTest
private class BatchRunnerServiceTest {

    @TestSetup static void setup() {
        TestUtils.saveTestStandardUser();
    }

    @IsTest private static void test() {
        User usr = TestUtils.getTestUser('');
        System.runAs(usr) {

        }
    }

}