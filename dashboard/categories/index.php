<?php
require_once "../../config/database.php";

// Autoload 
spl_autoload_register(function ($class) {
    require_once '../../app/model/' . $class . '.php';
});

$conn = new Database();
$category = new Category();
$category_data = $category->getAllCategories();

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../public/style.css">
    <title>Bảng dữ liệu các danh mục</title>
</head>

<body>
    <div class="page_wrapper table_data">
        <h3 class="table_data_title">Bảng dữ liệu các danh mục</h3>
        <table>
            <thead>
                <tr>
                    <td>Mã danh mục</td>
                    <td>Tên danh mục</td>
                    <td>Chỉnh sửa</td>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($category_data as $key => $value) {
                    echo "<tr>
                            <td>
                                $value[category_id]
                            </td>
                            <td>
                                $value[category_name]
                            </td>
                            <td>
                                <div class='table_action'>
                                    <a class='' href='./categories/delete?id=$value[category_id]'><ion-icon name='trash-outline'></ion-icon></a>
                                    <a class=''href='./categories/edit?id=$value[category_id]'><ion-icon name='create-outline'></ion-icon></a>
                                </div>
                            </td>
                        </tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>

</html>