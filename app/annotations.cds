using { zproductsSrv } from '../srv/service.cds';

annotate zproductsSrv.Products with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: productId } };
annotate zproductsSrv.Products with {
  ID @UI.Hidden @Common.Text: { $value: productId, ![@UI.TextArrangement]: #TextOnly }
};
annotate zproductsSrv.Products with @UI.Identification: [{ Value: productId }];
annotate zproductsSrv.Products with {
  category @Common.ValueList: {
    CollectionPath: 'Categories',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: category_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'categoryId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'categoryName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
    ],
  }
};
annotate zproductsSrv.Products with {
  productId @title: 'Product ID';
  productName @title: 'Product Name';
  quantityPerUnit @title: 'Quantity Per Unit';
  unitPrice @title: 'Unit Price';
  unitsInStock @title: 'Units In Stock'
};

annotate zproductsSrv.Products with {
  unitPrice @Measures.ISOCurrency: Currency_code
};

annotate zproductsSrv.Products with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: productId },
 { $Type: 'UI.DataField', Value: productName },
 { $Type: 'UI.DataField', Value: quantityPerUnit },
 { $Type: 'UI.DataField', Value: unitPrice },
 { $Type: 'UI.DataField', Value: unitsInStock },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate zproductsSrv.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: productId },
 { $Type: 'UI.DataField', Value: productName },
 { $Type: 'UI.DataField', Value: quantityPerUnit },
 { $Type: 'UI.DataField', Value: unitPrice },
 { $Type: 'UI.DataField', Value: unitsInStock },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate zproductsSrv.Products with {
  category @Common.Text: { $value: category.categoryId, ![@UI.TextArrangement]: #TextOnly }
};

annotate zproductsSrv.Products with {
  category @Common.Label: 'Category'
};

annotate zproductsSrv.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate zproductsSrv.Products with @UI.SelectionFields: [
  category_ID
];

annotate zproductsSrv.Categories with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: categoryId } };
annotate zproductsSrv.Categories with {
  ID @UI.Hidden @Common.Text: { $value: categoryId, ![@UI.TextArrangement]: #TextOnly }
};
annotate zproductsSrv.Categories with @UI.Identification: [{ Value: categoryId }];
annotate zproductsSrv.Categories with {
  categoryId @title: 'Category ID';
  categoryName @title: 'Category Name';
  description @title: 'Description'
};

annotate zproductsSrv.Categories with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: categoryId },
 { $Type: 'UI.DataField', Value: categoryName },
 { $Type: 'UI.DataField', Value: description }
];

annotate zproductsSrv.Categories with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: categoryId },
 { $Type: 'UI.DataField', Value: categoryName },
 { $Type: 'UI.DataField', Value: description }
  ]
};

annotate zproductsSrv.Categories with {
  products @Common.Label: 'Products'
};

annotate zproductsSrv.Categories with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate zproductsSrv.Categories with @UI.SelectionFields: [
  categoryId
];

annotate zproductsSrv.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers', Title: { Value: customerId } };
annotate zproductsSrv.Customers with {
  ID @UI.Hidden @Common.Text: { $value: customerId, ![@UI.TextArrangement]: #TextOnly }
};
annotate zproductsSrv.Customers with @UI.Identification: [{ Value: customerId }];
annotate zproductsSrv.Customers with {
  orders @Common.ValueList: {
    CollectionPath: 'Orders',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: orders_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderDate'
      },
    ],
  }
};
annotate zproductsSrv.Customers with {
  customerId @title: 'Customer ID';
  companyName @title: 'Company Name';
  contactName @title: 'Contact Name';
  contactTitle @title: 'Contact Title'
};

annotate zproductsSrv.Customers with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: customerId },
 { $Type: 'UI.DataField', Value: companyName },
 { $Type: 'UI.DataField', Value: contactName },
 { $Type: 'UI.DataField', Value: contactTitle },
    { $Type: 'UI.DataField', Label: 'Orders', Value: orders_ID }
];

annotate zproductsSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: customerId },
 { $Type: 'UI.DataField', Value: companyName },
 { $Type: 'UI.DataField', Value: contactName },
 { $Type: 'UI.DataField', Value: contactTitle },
    { $Type: 'UI.DataField', Label: 'Orders', Value: orders_ID }
  ]
};

annotate zproductsSrv.Customers with {
  orders @Common.Text: { $value: orders.orderId, ![@UI.TextArrangement]: #TextOnly }
};

annotate zproductsSrv.Customers with {
  orders @Common.Label: 'Orders'
};

annotate zproductsSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate zproductsSrv.Customers with @UI.SelectionFields: [
  orders_ID
];

annotate zproductsSrv.Orders with @UI.HeaderInfo: { TypeName: 'Order', TypeNamePlural: 'Orders', Title: { Value: orderId } };
annotate zproductsSrv.Orders with {
  ID @UI.Hidden @Common.Text: { $value: orderId, ![@UI.TextArrangement]: #TextOnly }
};
annotate zproductsSrv.Orders with @UI.Identification: [{ Value: orderId }];
annotate zproductsSrv.Orders with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'companyName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'contactName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'contactTitle'
      },
    ],
  }
};
annotate zproductsSrv.Orders with {
  orderId @title: 'Order ID';
  orderDate @title: 'Order Date'
};

annotate zproductsSrv.Orders with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: orderId },
 { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate zproductsSrv.Orders with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: orderId },
 { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate zproductsSrv.Orders with {
  customer @Common.Text: { $value: customer.customerId, ![@UI.TextArrangement]: #TextOnly }
};

annotate zproductsSrv.Orders with {
  customer @Common.Label: 'Customer';
  orderDetails @Common.Label: 'Order Details'
};

annotate zproductsSrv.Orders with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate zproductsSrv.Orders with @UI.SelectionFields: [
  customer_ID
];

annotate zproductsSrv.OrderDetails with @UI.HeaderInfo: { TypeName: 'Order Detail', TypeNamePlural: 'Order Details' };
annotate zproductsSrv.OrderDetails with {
  order @Common.ValueList: {
    CollectionPath: 'Orders',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: order_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderDate'
      },
    ],
  }
};
annotate zproductsSrv.OrderDetails with {
  product @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: product_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'quantityPerUnit'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'unitPrice'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'unitsInStock'
      },
    ],
  }
};
annotate zproductsSrv.OrderDetails with {
  quantity @title: 'Quantity';
  unitPrice @title: 'Unit Price'
};

annotate zproductsSrv.OrderDetails with {
  unitPrice @Measures.ISOCurrency: Currency_code
};

annotate zproductsSrv.OrderDetails with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: quantity },
 { $Type: 'UI.DataField', Value: unitPrice },
    { $Type: 'UI.DataField', Label: 'Order', Value: order_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
];

annotate zproductsSrv.OrderDetails with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: quantity },
 { $Type: 'UI.DataField', Value: unitPrice },
    { $Type: 'UI.DataField', Label: 'Order', Value: order_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
  ]
};

annotate zproductsSrv.OrderDetails with {
  order @Common.Text: { $value: order.orderId, ![@UI.TextArrangement]: #TextOnly };
  product @Common.Text: { $value: product.productId, ![@UI.TextArrangement]: #TextOnly }
};

annotate zproductsSrv.OrderDetails with {
  order @Common.Label: 'Order';
  product @Common.Label: 'Product'
};

annotate zproductsSrv.OrderDetails with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate zproductsSrv.OrderDetails with @UI.SelectionFields: [
  order_ID,
  product_ID
];

