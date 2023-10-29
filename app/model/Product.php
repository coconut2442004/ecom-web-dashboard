<?php

class Product extends Database
{
    public static function addProduct(
        $product_img,
        $product_desc,
        $product_brand,
        $product_name,
        $product_color,
        $product_size,
        $product_price,
        $product_quantity,
        $category_id
    ) {
        parent::insert("products", array(
            "product_name" => $product_name,
            "product_img" => $product_img,
            "product_brand" => $product_brand,
            "product_color" => $product_color,
            "product_size" => $product_size,
            "product_price" => $product_price,
            "product_quantity" => $product_quantity,
            "product_desc" => $product_desc,
            "category_id" => $category_id
        ));
    }

    public static function addProductImage($productId, $hrefValue)
    {
        parent::insert("product_images", array(
            "product_id" => $productId,
            "href_value" => $hrefValue
        ));
    }

    public static function getProductById($productId)
    {
        $productStmt = parent::$connection->prepare("SELECT * FROM products WHERE product_id = ?");
        $productStmt->bind_param("i", $productId);
        $product = parent::select($productStmt);

        if ($product) {
            $imageStmt = parent::$connection->prepare("SELECT * FROM product_images WHERE product_id = ?");
            $imageStmt->bind_param("i", $productId);

            $rateStmt = parent::$connection->prepare("SELECT * FROM rates WHERE product_id = ?");
            $rateStmt->bind_param("i", $productId);

            $images = parent::select($imageStmt);
            $rates = parent::select($rateStmt);

            $product[0]["product_images"] = $images;
            $product[0]["rates"] = $rates;
        }
        return $product;
    }

    public static function addRate($productId, $rateValue)
    {
        parent::insert("rates", array(
            "product_id" => $productId,
            "rate_value" => $rateValue
        ));
    }
}
