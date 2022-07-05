/**
 * Created by alexanderbelenov on 04.07.2022.
 */

@IsTest
public class TestUtils {
    private static final String TEST_USER_LAST_NAME = 'Testing';
    private static final String TEST_USER_EMAIL = 'work.alexbelenov@gmail.com';
    public static final String TEST_USER_USERNAME = 'tuser@belenovprojectcomp.comuser';
    public static final String TEST_USER_PROFILE = 'AccountsStandardUser';
    public static final String TEST_USER_ALIAS = 'testuser';

    public static User saveTestStandardUser() {
        Profile prof = ProfileRepository.getProfile(TEST_USER_PROFILE);
        User usr = new User(
                Alias = TEST_USER_ALIAS,
                Email = TEST_USER_EMAIL,
                UserName = TEST_USER_USERNAME,
                ProfileId = prof.Id,
                EmailEncodingKey='UTF-8',
                LastName=TEST_USER_LAST_NAME,
                LanguageLocaleKey='en_US',
                LocaleSidKey='en_US',
                TimeZoneSidKey='America/Los_Angeles'
                );

        UserRepository.insertUser(usr);
        return usr;
    }

    public static User getTestUser(String username) {
        username = (String.isBlank(username))? TEST_USER_USERNAME : username;
        User usr = UserRepository.getUser(username);
        return usr;
    }
}