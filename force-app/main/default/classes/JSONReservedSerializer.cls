// https://github.com/ChuckJonas/APEX-JSONReservedNameSerializer
public abstract class JSONReservedSerializer {
    private final Map<Type,Map<String,String>> typeMapKeys;

    public JSONReservedSerializer(Map<Type, Map<String, String>> typeMapKeys) {
        this.typeMapKeys = typeMapKeys;
    }

    public String serialize(Object obj, System.Type type) {
        return serialize(obj, false, type);
    }

    public String serialize(Object obj, Boolean suppressNulls, System.Type type) {
        String jsonString = JSON.serialize(obj, suppressNulls);
        jsonString = transformStringForSerialization(jsonString, typeMapKeys.get(type));
        return jsonString;
    }

    public Object deserialize(String jsonString, System.Type type) {
        jsonString = transformStringForDeserialization(jsonString, typeMapKeys.get(type));
        return JSON.deserialize(jsonString, type);
    }

    private static String transformStringForSerialization(String jsonString, Map<String, String> mapKeys) {
        if(mapKeys == null) {
            return jsonString;
        }
        return replaceAll(jsonString, mapKeys);
    }

    private static String transformStringForDeserialization(String jsonString, Map<String, String> mapKeys) {
        if(mapKeys == null) {
            return jsonString;
        }
        Map<String,String> flippedMap = new Map<String,String>();
        for(String key : mapKeys.keySet()) {
            flippedMap.put(mapKeys.get(key), key);
        }
        return replaceAll(jsonString, flippedMap);
    }

    private static String replaceAll(String jsonString, Map<String,String> toFromMap) {
        for(String key : toFromMap.keySet()) {
            jsonString = jsonString.replaceAll('"'+ key +'"(\\ )*:', '"'+ toFromMap.get(key) + '":');
        }

        return jsonString;
    }
}
