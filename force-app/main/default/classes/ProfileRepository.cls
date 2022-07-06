/**
 * Created by alexanderbelenov on 05.07.2022.
 */

public with sharing class ProfileRepository {

    public static Profile getProfile(String name) {
        name = (String.isBlank(name))? '' : name;
        try {
            Profile prof = [
                    SELECT Id
                    FROM Profile
                    WHERE Name=:name
            ];
            return prof;
        } catch (Exception e) {

        }
        return null;
    }
}