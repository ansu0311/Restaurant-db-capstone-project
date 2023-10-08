SELECT customerdetails.CustomerID, customerdetails.Name, orders.OrderID, orders.TotalCost,  menuitem.CourseName
FROM customerdetails INNER JOIN orders orders
ON customerdetails.CustomerID = orders.CustomerID
INNER JOIN (menu inner join menuitem on menu.MenuItemID = menuitem.MenuItemID) ON orders.MenuID = menu.MenuID 
Where TotalCost >350 Order by TotalCost;