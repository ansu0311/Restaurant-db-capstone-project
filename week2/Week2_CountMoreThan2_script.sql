SELECT MenuItem.CourseName
FROM MenuItem
WHERE MenuItem.MenuItemID = ANY (
    SELECT Menu.MenuItemID
    FROM Menu
    GROUP BY Menu.MenuItemID
    HAVING COUNT(*) > 2
);