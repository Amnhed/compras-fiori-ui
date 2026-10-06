using { ComprasService as service } from '../../compras-empresariales-cap/srv/compras-service';

annotate service.OrdenesCompra with @(
    UI.SelectionFields : [
        ID,
        proveedor,
        estado
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID Orden'
        },
        {
            $Type : 'UI.DataField',
            Value : proveedor,
            Label : 'Proveedor'
        },
        {
            $Type : 'UI.DataField',
            Value : total,
            Label : 'Monto Total'
        },
        {
            $Type : 'UI.DataField',
            Value : estado,
            Label : 'Estado'
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
            Label : 'Fecha Creación'
        }
    ]
);