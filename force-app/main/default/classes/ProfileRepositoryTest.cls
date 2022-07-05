/**
 * Created by alexanderbelenov on 05.07.2022.
 */

@IsTest
private class ProfileRepositoryTest {

    @TestSetup private static void test() {
        TestUtils.saveTestStandardUser();
    }

    @IsTest private static void testGetProfileExists(){

    }

    @IsTest private static void testGetProfileAbsent(){

    }

    @IsTest private static void testGetProfileNull(){

    }
}