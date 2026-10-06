using { ComprasService as service } from '../../compras-empresariales-cap/srv/compras-service';

// Estas anotaciones describen la lista y el registro.
// La copia que Fiori usa en ejecución está en el backend (srv/compras-ui.cds),
// porque la UI lee el $metadata de /odata/v4/compras/.

annotate service.OrdenesCompra with @(
    UI.HeaderInfo : {
        TypeName : 'Orden de compra',
        TypeNamePlural : 'Órdenes de compra',
        Title : { Value : folio }
    },
    UI.SelectionFields : [
        folio,
        estado
    ],
    UI.LineItem : [
        { Value : folio, Label : 'Folio' },
        { Value : estado, Label : 'Estado' },
        { Value : importeTotal, Label : 'Importe total' },
        { Value : createdAt, Label : 'Fecha creación' },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ComprasService.aprobar',
            Label : 'Aprobar',
            Inline : true
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ComprasService.rechazar',
            Label : 'Rechazar',
            Inline : true
        }
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ComprasService.aprobar',
            Label : 'Aprobar'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ComprasService.rechazar',
            Label : 'Rechazar'
        }
    ],
    UI.FieldGroup #Cabecera : {
        Data : [
            { Value : folio, Label : 'Folio' },
            { Value : estado, Label : 'Estado' },
            { Value : importeTotal, Label : 'Importe total' }
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Datos generales',
            Target : '@UI.FieldGroup#Cabecera'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Artículos',
            Target : 'posiciones/@UI.LineItem'
        }
    ]
);

annotate service.OrdenesCompra with {
    estado @Common.FieldControl : #ReadOnly;
    importeTotal @Common.FieldControl : #ReadOnly;
};

annotate service.Posiciones with @(
    UI.LineItem : [
        { Value : material, Label : 'Material' },
        { Value : cantidad, Label : 'Cantidad' },
        { Value : precioUnitario, Label : 'Precio unitario' }
    ],
    UI.HeaderInfo : {
        TypeName : 'Artículo',
        TypeNamePlural : 'Artículos',
        Title : { Value : material }
    }
);
