/**
 * Created by alexanderbelenov on 08.07.2022.
 */

public with sharing class CompareMethod {

    public static Boolean fuzzy(Object valueLeft, Object valueRight) {
        if (valueLeft instanceof String && valueRight instanceof String) {
            String validValueLeft = Utils.removeSpecialSymbols(valueLeft.toString());
            String validValueRight = Utils.removeSpecialSymbols(valueRight.toString());
            return validValueLeft == validValueRight;
        } else {
            return false;
        }
    }

    public static Boolean exact(Object valueLeft, Object valueRight) {
        if (valueLeft instanceof String && valueRight instanceof String) {
            Boolean result = valueLeft.toString().equals(valueRight.toString());
            return result;
        }
        return valueLeft == valueRight;
    }

}