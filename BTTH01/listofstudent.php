<?php
// Mở file txt và đọc nội dung vào biến
$file = fopen("ClistOfStudent.txt", "r");
$data = fread($file, filesize("ClistOfStudent.txt"));
fclose($file);

// Tách nội dung của file thành các dòng
$rows = explode("\n", $data);
// print_r($rows);
// Khởi tạo mảng để lưu trữ dữ liệu

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Document</title>
</head>
<body style = "text-align:center">
    <div class="container"></div>
    <h1>Quan Tri Sinh Vien</h1>
    <a href="student.php" class="btn btn-primary" >Them Moi</a>
    <!-- <button type="button" class="btn btn-primary" >Them Moi</button> -->

<table class="table">
    <thead>
    <tr>
      <th scope="col">Mã SV</th>
      <th scope="col">Họ Và Tên</th>
      <th scope="col">Quê Quán</th>
      <th scope="col">Sửa</th>
      <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach ($rows as $row) {
      if($row != ''){
        $values = explode(",", $row);
      }else {
        continue;
      }
    ?>
    <tr>
      <th scope="row"><?php echo $values[0]?></th>
      <td><?= $values[1]?></td>
      <td><?= $values[2]?></td>
      <td><i class="bi bi-pencil-square"></i></td>
      <td><i class="bi bi-trash3-fill"></i></td>  
    </tr>
    <?php } ?>  
    <tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script> 
</body>
</html>