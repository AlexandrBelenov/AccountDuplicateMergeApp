/**
 * Created by alexanderbelenov on 05.07.2022.
 */

@IsTest
private class ProfileRepositoryTest {
    @IsTest private static void testGetProfileExists(){

    }

    @IsTest private static void testGetProfileAbsent(){

    }

    @IsTest private static void testGetProfileNull(){
        Profile prof =  ProfileRepository.getProfile('MyProfile');
    }
}