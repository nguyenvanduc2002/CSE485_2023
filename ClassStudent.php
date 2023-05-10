<!DOCTYPE html>
<html>
<head>
	<title>danh sach sinh vien</title>
	<style>
		table {
			border-collapse: collapse;
			width: 100%;
		}

		th, td {
			text-align: left;
			padding: 8px;
		}

		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
	</style>
</head>
<body>
  <?php
	
	// Đọc dữ liệu từ tệp văn bản:
	$data = file_get_contents('ClistOfStudent.txt');
    $lines = explode(PHP_EOL, $data); // chuyển dữ liệu thành mảng các dòng
	// Thêm dữ liệu
	if (isset($_POST['submit'])) {
        $name = $_POST['name'];
        $email = $_POST['email'];
      
        $new_line = "$name|$email" . PHP_EOL; // tạo một dòng mới
      
        // Thêm dòng mới vào cuối tệp văn bản
        file_put_contents('ClistOfStudent.txt', $new_line, FILE_APPEND);
      
        echo "New record created successfully";
      }

	// Sửa dữ liệu
	if (isset($_POST['update'])) {
        $id = $_POST['id'];
        $name = $_POST['name'];
        $email = $_POST['email'];
      
        // Chỉnh sửa dòng tương ứng trong mảng $lines
        $lines[$id] = "$name|$email";
      
        // Ghi lại toàn bộ dữ liệu vào tệp văn bản
        file_put_contents('ClistOfStudent.txt', implode(PHP_EOL, $lines));
      
        echo "Record updated successfully";
      }

	// Xóa dữ liệu
	if (isset($_GET['delete'])) {
        $id = $_GET['delete'];
      
        // Xóa dòng tương ứng trong mảng $lines
        unset($lines[$id]);
      
        // Ghi lại toàn bộ dữ liệu vào tệp văn bản
        file_put_contents('ClistOfStudent.txt', implode(PHP_EOL, $lines));
      
        echo "Record deleted successfully";
    }
?>
</body>
</html>
