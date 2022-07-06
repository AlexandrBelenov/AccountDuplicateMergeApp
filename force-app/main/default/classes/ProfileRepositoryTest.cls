/**
 * Created by alexanderbelenov on 05.07.2022.
 */

@IsTest
private class ProfileRepositoryTest {

    @IsTest private static void testGetProfileExists() {
        Profile prof = ProfileRepository.getProfile(TestUtils.TEST_USER_PROFILE);
        System.assertNotEquals(prof, null);
    }

    @IsTest private static void testGetProfileAbsent() {
        Profile prof = ProfileRepository.getProfile('NonExistedProfile');
        System.assertEquals(prof, null);
    }
}