using { zproducts as my } from '../db/schema.cds';

@path: '/service/zproducts'
@requires: 'authenticated-user'
service zproductsSrv {
  @odata.draft.enabled
  entity Products as projection on my.Products;
  @odata.draft.enabled
  entity Categories as projection on my.Categories;
  @odata.draft.enabled
  entity Customers as projection on my.Customers;
  @odata.draft.enabled
  entity Orders as projection on my.Orders;
  @odata.draft.enabled
  entity OrderDetails as projection on my.OrderDetails;
}