/**
 * Created by alexanderbelenov on 08.07.2022.
 */

@IsTest
private class UtilTest {
    @IsTest private static void testSpecialSymbolsTelephone() {
        String invalid = '+3(011)222-33-44';
        String valid = Utils.removeSpecialSymbols(invalid);
        System.assertEquals('+30112223344', valid);
    }

    @IsTest private static void testSpecialSymbols() {
        String invalid = '\'1\"2(3)4.5,6 7 ';
        String valid = Utils.removeSpecialSymbols(invalid);
        System.assertEquals('1234567', valid);
    }

    @IsTest private static void testSpecialSymbolsWhiteSpaces() {
        String invalid = '  New          York  ';
        String valid = Utils.removeSpecialSymbols(invalid);
        System.assertEquals('NewYork', valid);
    }
}