public class PicklistWrapper {
    @AuraEnabled
    public String label {get; set;}
    @AuraEnabled
    public String value {get; set;}

    public PicklistWrapper(String label, String value) {
        this.label = label;
        this.value = value;
    }
}
