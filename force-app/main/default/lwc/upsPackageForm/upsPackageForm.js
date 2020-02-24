import { LightningElement, api, track, wire } from 'lwc';
import getPackagingTypePicklist from '@salesforce/apex/UPSRateCalculatorController.getPackagingTypePicklist';

export default class UpsPackageForm extends LightningElement {
    @track packagingType = '02';
    @api defaultUnitOfMeasurement;
    @track unitOfMeasurementWeight;
    @track unitOfMeasurementLength;

    @api package = {
        PackagingType: {
            Code: '02'
        },
        PackageWeight: {
            UnitOfMeasurement: {}
        }
    };

    get weightOptions() {
        return [
            {label: 'Pounds', value: 'LBS'},
            {label: 'Kilograms', value: 'KGS'}
        ]
    }

    get lengthOptions() {
        return [
            {label: 'Inches', value: 'IN'},
            {label: 'Centimeters', value: 'CM'}
        ]
    }

    @wire(getPackagingTypePicklist)
    packagingTypePicklist;

    connectedCallback() {
        this.unitOfMeasurementWeight = this.defaultUnitOfMeasurement == 'US' ? 'LBS' : 'KGS';
        this.unitOfMeasurementLength = this.defaultUnitOfMeasurement == 'US' ? 'IN' : 'CM';
    }

    @api
    checkValidity() {
        const weightComponent = this.template.querySelector(".weight");
        const isValid = weightComponent.checkValidity();
        if(!isValid) {
            weightComponent.reportValidity();
        }
        return isValid;
    }

    handleChange(event) {
        console.log('event.detail ' + JSON.stringify(event.detail));
        console.log('event.target ' + JSON.stringify(event.target.label));

        const labels = ['Length', 'Width', 'Height'];
        if(labels.includes(event.target.label)) {
            if(!this.package.Dimensions) {
                this.package.Dimensions = {
                    UnitOfMeasurement: {}
                };
            }

            this.package.Dimensions[event.target.label] = event.detail.value;
            this.package.Dimensions.UnitOfMeasurement.Code = this.unitOfMeasurementLength;

            var numberOfBlankValues = 0;
            for(var i = 0; i < labels.length; i++) {
                if(!this.package.Dimensions[labels[i]]) {
                    numberOfBlankValues++;
                }
            }
            console.log('numberOfBlankValues ' + numberOfBlankValues);

            if(numberOfBlankValues == labels.length) {
                delete this.package.Dimensions;
            }
        }

        if(event.target.label == 'Weight') {
            this.package.PackageWeight.Weight = event.detail.value;
            this.package.PackageWeight.UnitOfMeasurement.Code = this.unitOfMeasurementWeight;
        }

        if(event.target.label == 'Packaging Type') {
            this.package.PackagingType.Code = event.detail.value;
        }

        console.log('package ' + JSON.stringify(this.package));
    }
}