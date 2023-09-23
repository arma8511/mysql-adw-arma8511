use adw;

-- Empleados
select 
    detail.SalesOrderDetailID,
    sales.SalesOrderID,
    sales.OrderDate,
    sales.CustomerID,
    sales.salesPersonID,
    sales.TerritoryID,
    product.Name as ProductName,
    concat(person.FirstName, ' ', person.LastName) as CustomerName,
    concat(employee.FirstName, ' ', employee.LastName) as SalesPersonName,
    territory.name as TerritoryName
from Sales_SalesOrderDetail as detail
    join Sales_SalesOrderHeader as sales
        on sales.SalesOrderID = detail.SalesOrderID
    join Production_Product as product
        on detail.ProductID = product.ProductID
    join Sales_Customer as client  
        on sales.CustomerID = client.CustomerID
    left outer join Person_Person as person
        on client.PersonID = person.BusinessEntityID
    left outer join Sales_SalesPerson as salesperson
        on sales.SalesPersonID = salesperson.BusinessEntityID
    left outer join Person_Person as employee
        on salesperson.BusinessEntityID = employee.BusinessEntityID
    join Sales_SalesTerritory as territory
        on sales.TerritoryID = territory.TerritoryID
limit 3
;

