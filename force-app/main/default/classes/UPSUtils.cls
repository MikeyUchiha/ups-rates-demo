public class UPSUtils {
    public static Map<String, String> getDescriptionFromCountryAndCode(
        String fromCountry, String toCountry, Set<String> serviceCodeSet
    ) {
        Map<String, String> serviceCodeToDescription = new Map<String, String>();

        Set<String> countryTypeSet = new Set<String>();

        Map<String, String> options = new Map<String, String>();

        if(countryTypeToServiceCodeToDescriptionMap.containsKey(fromCountry)) {
            options.putAll(countryTypeToServiceCodeToDescriptionMap.get(fromCountry));
        }

        if(fromCountry == 'CA' && toCountry == 'US') {
            options.putAll(countryTypeToServiceCodeToDescriptionMap.get('CA to US'));
        }

        if(countriesInEU.contains(fromCountry)) {
            options.putAll(countryTypeToServiceCodeToDescriptionMap.get('European Union'));
        }

        if(options.isEmpty()) {
            options.putAll(countryTypeToServiceCodeToDescriptionMap.get('Undefined'));
        }

        options.putAll(countryTypeToServiceCodeToDescriptionMap.get('All'));

        System.debug('options ' + options);

        for(String serviceCode : serviceCodeSet) {
            if(options.containsKey(serviceCode)) {
                serviceCodeToDescription.put(serviceCode, options.get(serviceCode));
            } else {
                serviceCodeToDescription.put(serviceCode, 'Description Unavailable');
            }
        }

        return serviceCodeToDescription;
    }

    public static Map<String, String> countryNameToCodeMap = getCountryNameToCodeMap();
    public static Set<String> countriesInEU = getCountriesInEU();
    public static Map<String, Map<String, String>> countryTypeToServiceCodeToDescriptionMap = 
        getCountryTypeToServiceCodeToDescriptionMap();
    public static Map<String, String> packagingTypeMap = getPackagingTypeMap();

    public static Map<String, String> getCountryNameToCodeMap() {
        Map<String, String> countryNameToCodeMap = new Map<String, String>();

        for(UPS_Country_Code__mdt upsCountryCode : [
            SELECT Id, Country_Name__c, Country_Code__c 
            FROM UPS_Country_Code__mdt ORDER BY Country_Name__c
        ]) {
            countryNameToCodeMap.put(
                upsCountryCode.Country_Name__c, 
                upsCountryCode.Country_Code__c
            );
        }

        return countryNameToCodeMap;
    }

    public static Set<String> getCountriesInEU() {
        Set<String> countriesInEU = new Set<String>();

        for(UPS_EU_Country__mdt upsEUCountry : [SELECT Id, MasterLabel FROM UPS_EU_Country__mdt]) {
            countriesInEU.add(upsEUCountry.MasterLabel);
        }

        return countriesInEU;
    }

    public static Map<String, Map<String, String>> getCountryTypeToServiceCodeToDescriptionMap() {
        Map<String, Map<String, String>> countryTypeToServiceCodeToDescriptionMap =
            new Map<String, Map<String, String>>();

        for(Service_Code_Mapping__mdt serviceCodeMapping : [
            SELECT Id, Country_Type__c, Service_Code__c, Description__c
            FROM Service_Code_Mapping__mdt
        ]) {
            String countryType = serviceCodeMapping.Country_Type__c;
            if(countryTypeToServiceCodeToDescriptionMap.containsKey(countryType)) {
                countryTypeToServiceCodeToDescriptionMap.get(serviceCodeMapping.Country_Type__c)
                    .put(serviceCodeMapping.Service_Code__c, serviceCodeMapping.Description__c);
            } else {
                countryTypeToServiceCodeToDescriptionMap.put(
                    serviceCodeMapping.Country_Type__c,
                    new Map<String, String> {
                        serviceCodeMapping.Service_Code__c => serviceCodeMapping.Description__c
                    }
                );
            }
        }

        return countryTypeToServiceCodeToDescriptionMap;
    }

    public static Map<String, String> getPackagingTypeMap() {
        Map<String, String> packagingTypeMap = new Map<String, String>();

        for(Packaging_Type__mdt packagingType : [
            SELECT Id, MasterLabel, Packaging_Type_Code__c FROM Packaging_Type__mdt
        ]) {
            packagingTypeMap.put(packagingType.Packaging_Type_Code__c, packagingType.MasterLabel);
        }

        return packagingTypeMap;
    }
}
