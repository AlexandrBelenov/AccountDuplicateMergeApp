/**
 * Created by alexanderbelenov on 05.07.2022.
 */

public with sharing class UserRepository {
    public static User getUser(String username) {
        return [
                SELECT Id
                FROM User
                WHERE Username = :username
        ];
    }
}