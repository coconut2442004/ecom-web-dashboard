<?php

class Category extends Database
{
    public static function addCategory($categoryName)
    {
        parent::insert("categories", array("category_name" => $categoryName));
    }

    public static function getAllCategories()
    {
        $categoryStmt = parent::$connection->prepare("SELECT * FROM categories");
        $category = parent::select($categoryStmt);
        return $category;
    }
}
