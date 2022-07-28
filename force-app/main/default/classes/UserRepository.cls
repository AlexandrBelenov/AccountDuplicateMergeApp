/**
 * Created by alexanderbelenov on 05.07.2022.
 */

public with sharing class UserRepository {
    public static User getUser(String username) {
        username = (String.isBlank(username))? '' : username;
        try {
            User usr = [
                    SELECT Id
                    FROM User
                    WHERE Username = :username
            ];
            return usr;
        } catch (Exception e) {

        }
        return null;
    }

    public static void insertUser(User usr) {
        insert usr;
    }
}