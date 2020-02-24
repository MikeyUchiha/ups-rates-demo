public class UPS_APISerializer extends JSONReservedSerializer {
    public UPS_APISerializer() {
        super(new Map<Type, Map<String, String>> {
            UPS_API.class => new Map<String, String> {
                'Package_X' => 'Package'
            }
        });
    }
}
