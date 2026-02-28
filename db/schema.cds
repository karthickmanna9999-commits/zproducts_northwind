namespace zproducts;
using { cuid, Currency } from '@sap/cds/common';

@assert.unique: { productId: [productId] }
entity Products : cuid {
  productId: Integer @mandatory;
  productName: String(40);
  quantityPerUnit: String(20);
  unitPrice: Decimal(19,4);
  Currency: Currency;
  unitsInStock: Integer;
  category: Association to Categories;
}

@assert.unique: { categoryId: [categoryId] }
entity Categories : cuid {
  categoryId: Integer @mandatory;
  categoryName: String(15);
  description: String(200);
  products: Association to many Products on products.category = $self;
}

@assert.unique: { customerId: [customerId] }
entity Customers : cuid {
  customerId: String(5) @mandatory;
  companyName: String(40);
  contactName: String(30);
  contactTitle: String(30);
  orders: Association to Orders;
}

@assert.unique: { orderId: [orderId] }
entity Orders : cuid {
  orderId: Integer @mandatory;
  orderDate: DateTime;
  customer: Association to Customers;
  orderDetails: Association to many OrderDetails on orderDetails.order = $self;
}

entity OrderDetails : cuid {
  quantity: Integer;
  unitPrice: Decimal(19,4);
  Currency: Currency;
  order: Association to Orders;
  product: Association to Products;
}

