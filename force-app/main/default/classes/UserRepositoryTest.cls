/**
 * Created by alexanderbelenov on 05.07.2022.
 */

@IsTest
public with sharing class UserRepositoryTest {

    @TestSetup private static void setup() {
        TestUtils.saveTestStandardUser();
    }

    @IsTest private static void testGetUserExisted(){
        User usr = TestUtils.getTestUser('');

    }

    @IsTest private static void testGetUserAbsent(){
        User usr = TestUtils.getTestUser('');

    }
}