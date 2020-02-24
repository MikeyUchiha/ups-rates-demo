import { LightningElement, api, wire } from 'lwc';
import getCountryPicklist from '@salesforce/apex/UPSRateCalculatorController.getCountryPicklist';

export default class UpsAddressForm extends LightningElement {
    @api header;
    @api address = {
        CountryCode: 'US'
    };
    
    @wire(getCountryPicklist)
    countryPicklist;

    get addressLabel() {
        return `${this.header} Address`;
    }

    @api
    checkValidity() {
        const addressComponent = this.template.querySelector("lightning-input-address");
        const isValid = addressComponent.checkValidity();
        if(!isValid) {
            addressComponent.reportValidity();
        }
        return isValid;
    }

    handleChange(event) {
        this.address['AddressLine'] = event.detail.street;
        this.address['City'] = event.detail.city;
        this.address['StateProvinceCode'] = event.detail.province;
        this.address['PostalCode'] = event.detail.postalCode;
        this.address['CountryCode'] = event.detail.country;
    }
}