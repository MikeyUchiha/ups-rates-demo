global class UnitOfMeasurementPickList extends VisualEditor.DynamicPickList {
    global override VisualEditor.DataRow getDefaultValue() {
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('US', 'US');
        return defaultValue;
    }

    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DataRow usValue = new VisualEditor.DataRow('US', 'US');
        VisualEditor.DataRow metricValue = new VisualEditor.DataRow('Metric', 'Metric');

        VisualEditor.DynamicPickListRows values = new VisualEditor.DynamicPickListRows();
        values.addRow(usValue);
        values.addRow(metricValue);

        return values;
    }
}
