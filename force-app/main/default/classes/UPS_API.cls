public class UPS_API {
    public RateRequest RateRequest {get; set;}
    @AuraEnabled
    public RateResponse RateResponse {get;set;}
    @AuraEnabled
    public ErrorResponse response {get; set;}

    public UPS_API() {}

    public class RateRequest {
        //public Request Request {get; set;}
        public PickupType PickupType {get; set;}
        public CustomerClassification CustomerClassification {get; set;}
        public Shipment Shipment {get; set;}

        public RateRequest() {}

        public RateRequest(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						/*if (text == 'Request') {
							Request = new Request(parser);
                        } else */
                        if (text == 'PickupType') {
                            PickupType = new PickupType(parser);
                        } else if (text == 'CustomerClassification') {
                            CustomerClassification = new CustomerClassification(parser);
                        } else if (text == 'Shipment') {
							Shipment = new Shipment(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'RateRequest consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
        }
    }

    public class PickupType {
        public String Code {get; set;}

        public PickupType() {}

        public PickupType(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Code') {
							Code = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'PickupType consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
        }
    }

    public class CustomerClassification {
        public String Code {get; set;}

        public CustomerClassification() {}

        public CustomerClassification(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Code') {
							Code = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'CustomerClassification consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
        }
    }

    public class Request {
		public String SubVersion {get; set;}
        public TransactionReference TransactionReference {get;set;}

        public Request() {}
        
		public Request(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'SubVersion') {
							SubVersion = parser.getText();
						} else if (text == 'TransactionReference') {
							TransactionReference = new TransactionReference(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Request consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class TransactionReference {
        public String CustomerContext {get;set;}
        public String TransactionIdentifier {get;set;}

        public TransactionReference() {}
        
		public TransactionReference(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'CustomerContext') {
							CustomerContext = parser.getText();
						} else if (text == 'TransactionIdentifier') {
							TransactionIdentifier = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'TransactionReference consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class Shipment {
		public ShipmentRatingOptions ShipmentRatingOptions {get;set;}
		public Shipper Shipper {get;set;}
		public ShipTo ShipTo {get;set;}
		public ShipFrom ShipFrom {get;set;}
		public Service Service {get;set;}
		public ShipmentTotalWeight ShipmentTotalWeight {get;set;}
        public Package_X Package_X {get;set;}

        public Shipment() {}
        
		public Shipment(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'ShipmentRatingOptions') {
							ShipmentRatingOptions = new ShipmentRatingOptions(parser);
						} else if (text == 'Shipper') {
							Shipper = new Shipper(parser);
						} else if (text == 'ShipTo') {
							ShipTo = new ShipTo(parser);
						} else if (text == 'ShipFrom') {
							ShipFrom = new ShipFrom(parser);
						} else if (text == 'Service') {
							Service = new Service(parser);
						} else if (text == 'ShipmentTotalWeight') {
							ShipmentTotalWeight = new ShipmentTotalWeight(parser);
						} else if (text == 'Package') {
							Package_X = new Package_X(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Shipment consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class ShipmentRatingOptions {
        public String UserLevelDiscountIndicator {get;set;}
        
        public ShipmentRatingOptions() {}

		public ShipmentRatingOptions(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'UserLevelDiscountIndicator') {
							UserLevelDiscountIndicator = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'ShipmentRatingOptions consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class Shipper {
		public String Name {get;set;}
		public String ShipperNumber {get;set;}
        public Address Address {get;set;}
        
        public Shipper() {}

		public Shipper(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Name') {
							Name = parser.getText();
						} else if (text == 'ShipperNumber') {
							ShipperNumber = parser.getText();
						} else if (text == 'Address') {
							Address = new Address(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Shipper consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class ShipTo {
		public String Name {get;set;}
        public Address Address {get;set;}
        
        public ShipTo() {}

		public ShipTo(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Name') {
							Name = parser.getText();
						} else if (text == 'Address') {
							Address = new Address(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'ShipTo consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }

    public class ShipFrom {
		public String Name {get;set;}
        public Address Address {get;set;}
        
        public ShipFrom() {}

		public ShipFrom(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Name') {
							Name = parser.getText();
						} else if (text == 'Address') {
							Address = new Address(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'ShipFrom consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }

    public class Address {
		public String AddressLine {get;set;}
		public String City {get;set;}
		public String StateProvinceCode {get;set;}
		public String PostalCode {get;set;}
        public String CountryCode {get;set;}
        
        public Address() {}

		public Address(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'AddressLine') {
							AddressLine = parser.getText();
						} else if (text == 'City') {
							City = parser.getText();
						} else if (text == 'StateProvinceCode') {
							StateProvinceCode = parser.getText();
						} else if (text == 'PostalCode') {
							PostalCode = parser.getText();
						} else if (text == 'CountryCode') {
							CountryCode = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Address consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class Service {
		public String Code {get;set;} 
        public String Description {get;set;}
        
        public Service() {}

		public Service(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Code') {
							Code = parser.getText();
						} else if (text == 'Description') {
							Description = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Service consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class ShipmentTotalWeight {
		public UnitOfMeasurement UnitOfMeasurement {get;set;}
        public String Weight {get;set;}
        
        public ShipmentTotalWeight() {}

		public ShipmentTotalWeight(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'UnitOfMeasurement') {
							UnitOfMeasurement = new UnitOfMeasurement(parser);
						} else if (text == 'Weight') {
							Weight = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'ShipmentTotalWeight consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }

    public class UnitOfMeasurement {
		public String Code {get;set;} 
        public String Description {get;set;}
        
        public UnitOfMeasurement() {}

		public UnitOfMeasurement(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Code') {
							Code = parser.getText();
						} else if (text == 'Description') {
							Description = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'UnitOfMeasurement consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class Package_X {
		public PackagingType PackagingType {get;set;}
		public Dimensions Dimensions {get;set;}
        public PackageWeight PackageWeight {get;set;}
        
        public Package_X() {}

		public Package_X(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'PackagingType') {
							PackagingType = new PackagingType(parser);
						} else if (text == 'Dimensions') {
							Dimensions = new Dimensions(parser);
						} else if (text == 'PackageWeight') {
							PackageWeight = new PackageWeight(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Package_X consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }

    public class PackagingType {
		public String Code {get;set;} 
        public String Description {get;set;}
        
        public PackagingType() {}

		public PackagingType(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Code') {
							Code = parser.getText();
						} else if (text == 'Description') {
							Description = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'PackagingType consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class Dimensions {
		public UnitOfMeasurement UnitOfMeasurement {get;set;}
		public String Length {get;set;}
		public String Width {get;set;}
        public String Height {get;set;}
        
        public Dimensions() {}

		public Dimensions(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'UnitOfMeasurement') {
							UnitOfMeasurement = new UnitOfMeasurement(parser);
						} else if (text == 'Length') {
							Length = parser.getText();
						} else if (text == 'Width') {
							Width = parser.getText();
						} else if (text == 'Height') {
							Height = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Dimensions consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
	public class PackageWeight {
		public UnitOfMeasurement UnitOfMeasurement {get;set;}
        public String Weight {get;set;}
        
        public PackageWeight() {}

		public PackageWeight(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'UnitOfMeasurement') {
							UnitOfMeasurement = new UnitOfMeasurement(parser);
						} else if (text == 'Weight') {
							Weight = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'PackageWeight consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }

    public class RateResponse {
        @AuraEnabled
        public Response Response {get;set;}
        @AuraEnabled
		public List<RatedShipment> RatedShipment {get;set;}

		public RateResponse(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Response') {
							Response = new Response(parser);
						} else if (text == 'RatedShipment') {
							RatedShipment = arrayOfRatedShipment(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'RateResponse consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

    public class Response {
        @AuraEnabled
        public ResponseStatus ResponseStatus {get;set;}
        @AuraEnabled
        public List<Alert> Alert {get;set;}
        @AuraEnabled
		public TransactionReference TransactionReference {get;set;}

		public Response(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'ResponseStatus') {
							ResponseStatus = new ResponseStatus(parser);
						} else if (text == 'Alert') {
							Alert = arrayOfAlert(parser);
						} else if (text == 'TransactionReference') {
							TransactionReference = new TransactionReference(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Response consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class ResponseStatus {
        @AuraEnabled
        public String Code {get;set;}
        @AuraEnabled
		public String Description {get;set;}

		public ResponseStatus(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Code') {
							Code = parser.getText();
						} else if (text == 'Description') {
							Description = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'ResponseStatus consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }

    public class Alert {
        @AuraEnabled
        public String Code {get;set;}
        @AuraEnabled
		public String Description {get;set;}

		public Alert(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Code') {
							Code = parser.getText();
						} else if (text == 'Description') {
							Description = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Alert consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    private static List<Alert> arrayOfAlert(System.JSONParser parser) {
        List<Alert> alerts = new List<Alert>();
        if (parser.getCurrentToken() == null) parser.nextToken();
        while (parser.nextToken() != System.JSONToken.END_ARRAY) {
            alerts.add(new Alert(parser));
        }
        return alerts;
    }

    public class RatedShipment {
        @AuraEnabled
        public Service Service {get;set;}
        @AuraEnabled
        public List<Alert> RatedShipmentAlert {get;set;}
        @AuraEnabled
        public BillingWeight BillingWeight {get;set;}
        @AuraEnabled
        public Charge TransportationCharges {get;set;}
        @AuraEnabled
        public Charge BaseServiceCharge {get;set;}
        @AuraEnabled
        public Charge ServiceOptionsCharges {get;set;}
        @AuraEnabled
        public Charge TotalCharges {get;set;}
        @AuraEnabled
		public RatedPackage RatedPackage {get;set;}

		public RatedShipment(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Service') {
							Service = new Service(parser);
						} else if (text == 'RatedShipmentAlert') {
							RatedShipmentAlert = arrayOfAlert(parser);
						} else if (text == 'BillingWeight') {
							BillingWeight = new BillingWeight(parser);
						} else if (text == 'TransportationCharges') {
							TransportationCharges = new Charge(parser);
						} else if (text == 'BaseServiceCharge') {
							BaseServiceCharge = new Charge(parser);
						} else if (text == 'ServiceOptionsCharges') {
							ServiceOptionsCharges = new Charge(parser);
						} else if (text == 'TotalCharges') {
							TotalCharges = new Charge(parser);
						} else if (text == 'RatedPackage') {
							RatedPackage = new RatedPackage(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'RatedShipment consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }

    private static List<RatedShipment> arrayOfRatedShipment(System.JSONParser parser) {
        List<RatedShipment> ratedShipments = new List<RatedShipment>();
        if (parser.getCurrentToken() == null) parser.nextToken();
        while (parser.nextToken() != System.JSONToken.END_ARRAY) {
            ratedShipments.add(new RatedShipment(parser));
        }
        return ratedShipments;
    }


    public class BillingWeight {
        @AuraEnabled
        public UnitOfMeasurement UnitOfMeasurement {get;set;}
        @AuraEnabled
		public String Weight {get;set;}

		public BillingWeight(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'UnitOfMeasurement') {
							UnitOfMeasurement = new UnitOfMeasurement(parser);
						} else if (text == 'Weight') {
							Weight = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'BillingWeight consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
    
    public class Charge {
        @AuraEnabled
        public String CurrencyCode {get;set;}
        @AuraEnabled
		public String MonetaryValue {get;set;}

		public Charge(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'CurrencyCode') {
							CurrencyCode = parser.getText();
						} else if (text == 'MonetaryValue') {
							MonetaryValue = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Charge consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class RatedPackage {
        @AuraEnabled
        public Charge TransportationCharges {get;set;}
        @AuraEnabled
        public Charge BaseServiceCharge {get;set;}
        @AuraEnabled
        public Charge ServiceOptionsCharges {get;set;}
        @AuraEnabled
        public List<ItemizedCharges> ItemizedCharges {get;set;}
        @AuraEnabled
        public Charge TotalCharges {get;set;}
        @AuraEnabled
        public String Weight {get;set;}
        @AuraEnabled
		public BillingWeight BillingWeight {get;set;}

		public RatedPackage(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'TransportationCharges') {
							TransportationCharges = new Charge(parser);
						} else if (text == 'BaseServiceCharge') {
							BaseServiceCharge = new Charge(parser);
						} else if (text == 'ServiceOptionsCharges') {
							ServiceOptionsCharges = new Charge(parser);
						} else if (text == 'ItemizedCharges') {
							ItemizedCharges = arrayOfItemizedCharges(parser);
						} else if (text == 'TotalCharges') {
							TotalCharges = new Charge(parser);
						} else if (text == 'Weight') {
							Weight = parser.getText();
						} else if (text == 'BillingWeight') {
							BillingWeight = new BillingWeight(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'RatedPackage consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    public class ItemizedCharges {
        @AuraEnabled
        public String Code {get;set;}
        @AuraEnabled
        public String CurrencyCode {get;set;}
        @AuraEnabled
        public String MonetaryValue {get;set;}
        @AuraEnabled
		public String SubType {get;set;} 

		public ItemizedCharges(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Code') {
							Code = parser.getText();
						} else if (text == 'CurrencyCode') {
							CurrencyCode = parser.getText();
						} else if (text == 'MonetaryValue') {
							MonetaryValue = parser.getText();
						} else if (text == 'SubType') {
							SubType = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'ItemizedCharges consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    
    private static List<ItemizedCharges> arrayOfItemizedCharges(System.JSONParser parser) {
        List<ItemizedCharges> itemizedCharges = new List<ItemizedCharges>();
        if (parser.getCurrentToken() == null) parser.nextToken();
        while (parser.nextToken() != System.JSONToken.END_ARRAY) {
            itemizedCharges.add(new ItemizedCharges(parser));
        }
        return itemizedCharges;
    }

    public class ErrorResponse {
        @AuraEnabled
        public List<Errors> errors {get; set;}

        public ErrorResponse(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'errors') {
							errors = arrayOfErrors(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Response consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
        }
    }

    public class Errors {
        @AuraEnabled
        public String code {get;set;}
        @AuraEnabled
		public String message {get;set;} 

		public Errors(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'code') {
							code = parser.getText();
						} else if (text == 'message') {
							message = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Errors consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

    private static List<Errors> arrayOfErrors(System.JSONParser parser) {
        List<Errors> errors = new List<Errors>();
        if (parser.getCurrentToken() == null) parser.nextToken();
        while (parser.nextToken() != System.JSONToken.END_ARRAY) {
            errors.add(new Errors(parser));
        }
        return errors;
    }

    public UPS_API(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'RateRequest') {
						RateRequest = new RateRequest(parser);
					} else if (text == 'RateResponse') {
						RateResponse = new RateResponse(parser);
					} else if (text == 'response') {
                        response = new errorResponse(parser);
                    } else {
						System.debug(LoggingLevel.WARN, 'UPS_API consuming unrecognized property: ' + text);
						consumeObject(parser);
					}
				}
			}
		}
    }

    public static UPS_API parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new UPS_API(parser);
	}
    
    public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT || curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
}
