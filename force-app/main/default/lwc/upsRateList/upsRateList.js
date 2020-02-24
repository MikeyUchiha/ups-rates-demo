import { LightningElement, api, track } from 'lwc';

export default class UpsRateList extends LightningElement {
    @api
    ratesResponse;

    get errors() {
        console.log('called get errors');
        if(this.ratesResponse.response && this.ratesResponse.response.errors) {
            return true;
        }
        return false;
    }

    get rates() {
        console.log('called get rates');
        if(this.ratesResponse.RateResponse && this.ratesResponse.RateResponse.RatedShipment) {
            return true;
        }
        return false;
    }

    get ratedShipmentIsArray() {
        console.log('called ratedShipmentIsArray');
        if(this.rates && Array.isArray(this.ratesResponse.RateResponse.RatedShipment)) {
            return true;
        }
        return false;
    }

    get ratedShipmentIsNotArray() {
        console.log('called !ratedShipmentIsArray');
        return !this.ratedShipmentIsArray;
    }

    
}