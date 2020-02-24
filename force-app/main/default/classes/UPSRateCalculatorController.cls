public class UPSRateCalculatorController {
    @AuraEnabled(cacheable = true)
    public static List<PicklistWrapper> getCountryPicklist() {
        List<PicklistWrapper> countryPicklist = new List<PicklistWrapper>();

        Map<String, String> countryNameToCodeMap = UPSUtils.countryNameToCodeMap;

        List<String> countryNameList = new List<String>(countryNameToCodeMap.keySet());
        countryNameList.sort();

        for(String countryName : countryNameList) {
            countryPicklist.add(new PicklistWrapper(
                countryName, 
                countryNameToCodeMap.get(countryName)
            ));
        }

        return countryPicklist;
    }

    @AuraEnabled(cacheable = true)
    public static List<PicklistWrapper> getPackagingTypePicklist() {
        List<PicklistWrapper> packagingTypePicklist = new List<PicklistWrapper>();

        for(String packagingTypeCode : UPSUtils.packagingTypeMap.keySet()) {
            packagingTypePicklist.add(new PicklistWrapper(
                UPSUtils.packagingTypeMap.get(packagingTypeCode),
                packagingTypeCode
            ));
        }

        return packagingTypePicklist;
    }

    @AuraEnabled()
    public static Map<String, Object> getRates(String rateRequest) {
        Map<String, Object> mapJsonData = new map<String, Object>();
        String base = 'ship';
        String version = 'v1';
        String api = 'rating';
        String requestOption = 'Shop';
        String path = base + '/' + version + '/' + api + '/' + requestOption;
        System.debug('path ' + path);

        String contentType = 'application/json';
        String accessKey = '0D781CBBBE8BE050';
        String transactionSource = 'SF';
        String transactionId = System.now().formatGMT('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'');

        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:UPS_Test/' + path);
        request.setMethod('POST');
        request.setHeader('Content-Type', contentType);
        request.setHeader('AccessLicenseNumber', accessKey);
        request.setHeader('Username', '{!$Credential.Username}');
        request.setHeader('Password', '{!$Credential.Password}');
        request.setHeader('transactionSrc', transactionSource);
        request.setHeader('transId', transactionId);

        String jsonBody = rateRequest;

        System.debug('jsonBody ' + jsonBody);

        request.setBody(jsonBody);

        String responseBody = null;

        try {
            Http http = new Http();
            HttpResponse response = http.send(request);
            System.debug(response.getBody());
            responseBody = response.getBody();
        } catch(Exception ex) {
            throw ex;
        }

        

        if(String.isNotBlank(responseBody)) {
            mapJsonData = (Map<String, Object>)JSON.deserializeUntyped(responseBody);
        }

        if(!mapJsonData.isEmpty()) {
            return mapJsonData;
        }

        return null;
    }

    @AuraEnabled(cacheable = true)
    public static Map<String, String> getServiceCodeMapping(String fromCountry, String toCountry, List<String> serviceCodeList) {
        Set<String> serviceCodeSet = new Set<String>(serviceCodeList);
        return UPSUtils.getDescriptionFromCountryAndCode(fromCountry, toCountry, serviceCodeSet);
    }
}
