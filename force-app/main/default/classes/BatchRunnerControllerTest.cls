/**
 * Created by alexanderbelenov on 04.07.2022.
 */

@IsTest
private class BatchRunnerControllerTest {

    @IsTest private static void testRunBatch() {

    }

    private class MockedBRC implements BatchRunnerController.Singleton {
        public BatchRunnerController.Singleton getInstance() {
            return null;
        }
    }
}