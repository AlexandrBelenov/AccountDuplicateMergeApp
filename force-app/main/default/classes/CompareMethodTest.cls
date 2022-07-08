/**
 * Created by alexanderbelenov on 08.07.2022.
 */

@IsTest
private class CompareMethodTest {
    @IsTest static void testFuzzyString() {
        System.assert(CompareMethod.fuzzy('New York', '\'New York\''));
        System.assert(CompareMethod.fuzzy('New York', '\"New York\"'));
        System.assert(CompareMethod.fuzzy('New York', 'Ne(w Yo)rk'));
        System.assert(CompareMethod.fuzzy('New York', 'nEw yORk'));
    }

    @IsTest static void testFuzzyNotString() {
        System.assert(!CompareMethod.fuzzy(10, 10));
        System.assert(!CompareMethod.fuzzy(10.1, 10.1));
        System.assert(!CompareMethod.fuzzy(1, '1'));
        System.assert(!CompareMethod.fuzzy(true, true));
        System.assert(!CompareMethod.fuzzy(true, 'true'));
        System.assert(!CompareMethod.fuzzy(true, false));
    }

    @IsTest static void testExactString() {
        System.assert(CompareMethod.exact('New York', 'New York'));
        System.assert(!CompareMethod.exact('New York','New York1'));
        System.assert(!CompareMethod.exact('New York','New YORk'));
    }

    @IsTest static void testExactNotString() {
        System.assert(CompareMethod.exact(10, 10));
        System.assert(!CompareMethod.exact(10,'10'));
        System.assert(CompareMethod.exact(10.1, 10.1));
        System.assert(!CompareMethod.exact(10.1, 10.0));
        System.assert(CompareMethod.exact(true, true));
        System.assert(!CompareMethod.exact(true, false));
    }
}