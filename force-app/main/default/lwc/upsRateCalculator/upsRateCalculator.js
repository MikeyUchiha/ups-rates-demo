import { LightningElement, api, track } from 'lwc';
import getRates from '@salesforce/apex/UPSRateCalculatorController.getRates';
import getServiceCodeMapping from '@salesforce/apex/UPSRateCalculatorController.getServiceCodeMapping';

export default class UpsRateCalculator extends LightningElement {
    @api fromHeaderLabel;
    @api toHeaderLabel;
    @api defaultUnitOfMeasurement;
    @track ratesResponse;
    returnedData;

    handleClick() {
        let isValid = true;
        let form = {};
        let rateRequest = {};
        let shipment = {};
        this.template.querySelectorAll("c-ups-address-form").forEach(element => {
            if(!element.checkValidity()) {
                isValid = false;
            } else {
                let addressForm = {};
                addressForm.Address = element.address;
                if(element.header == this.fromHeaderLabel) {
                    shipment.Shipper = addressForm;
                    shipment.ShipFrom = addressForm;
                } else if(element.header == this.toHeaderLabel) {
                    shipment.ShipTo = addressForm;
                }
            }
        });
        const packageForm = this.template.querySelector("c-ups-package-form");

        if(!packageForm.checkValidity()) {
            isValid = false;
        } else {
            shipment.Package = packageForm.package;
        }

        if(isValid) {
            rateRequest.Shipment = shipment;
            form.RateRequest = rateRequest;
            console.log('form ' + JSON.stringify(form));
            this.handleGetRates(form);
        }
    }

    handleGetRates(rateRequest) {
        getRates({rateRequest: JSON.stringify(rateRequest)}).then(data => {
            console.log('response data ' + JSON.stringify(data));
            if(data) {
                if(data.response && data.response.errors) {
                    this.ratesResponse = data;
                } else {
                    console.log('calling handleGetServiceCodeMapping');
                    this.handleGetServiceCodeMapping(rateRequest, data);
                }
            }
        }).catch(error => {
            console.log('error ' + JSON.stringify(error));
        });
    }

    handleGetServiceCodeMapping(rateRequest, ratesResponse) {
        const fromCountry = rateRequest.RateRequest.Shipment.ShipFrom.Address.CountryCode;
        const toCountry = rateRequest.RateRequest.Shipment.ShipTo.Address.CountryCode;
        const serviceCodes = [];

        console.log('in handleGetServiceCodeMapping');

        console.log('ratesResponse ' + JSON.stringify(ratesResponse));

        if(ratesResponse.RateResponse && ratesResponse.RateResponse.RatedShipment) {
            if(Array.isArray(ratesResponse.RateResponse.RatedShipment)) {
                ratesResponse.RateResponse.RatedShipment.forEach(element => {
                    serviceCodes.push(element.Service.Code);
                });
            } else {
                serviceCodes.push(ratesResponse.RateResponse.RatedShipment.Service.Code);
            }
        }

        console.log('serviceCodes ' + JSON.stringify(serviceCodes));

        if(serviceCodes.length) {
            getServiceCodeMapping({
                fromCountry: fromCountry, toCountry: toCountry, serviceCodeList: serviceCodes
            }).then(data => {
                console.log('service code mapping data ' + JSON.stringify(data));
                if(data) {
                    ratesResponse.RateResponse.RatedShipment.forEach(element => {
                        element.Service.Description = data[element.Service.Code];
                    });

                    this.ratesResponse = ratesResponse;
                }
            }).catch(error => {
                console.log('error ' + JSON.stringify(error));
            });
        }
    }
}