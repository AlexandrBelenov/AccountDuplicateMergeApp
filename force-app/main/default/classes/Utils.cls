/**
 * Created by alexanderbelenov on 08.07.2022.
 */

public with sharing class Utils {
    public static String removeSpecialSymbols(String text) {
        return text.replaceAll('[^a-zA-Z0-9\\+]', '');
    }
}