<!DOCTYPE html>
<html>
<head>
	<title>CRUD Example</title>
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
	$host = "localhost";
	$username = "your_username";
	$password = "your_password";
	$dbname = "your_database";

	// Kết nối với CSDL
	$conn = mysqli_connect($host, $username, $password, $dbname);

	if (!$conn) {
	  die("Connection failed: " . mysqli_connect_error());
	}

	// Thêm dữ liệu
	if (isset($_POST['submit'])) {
	  $name = $_POST['name'];
	  $email = $_POST['email'];

	  $sql = "INSERT INTO users (name, email) VALUES ('$name', '$email')";

	  if (mysqli_query($conn, $sql)) {
	    echo "New record created successfully";
	  } else {
	    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
	  }
	}

	// Sửa dữ liệu
	if (isset($_POST['update'])) {
	  $id = $_POST['id'];
	  $name = $_POST['name'];
	  $email = $_POST['email'];

	  $sql = "UPDATE users SET name='$name', email='$email' WHERE id=$id";

	  if (mysqli_query($conn, $sql)) {
	    echo "Record updated successfully";
	  } else {
	    echo "Error updating record: " . mysqli_error($conn);
	  }
	}

	// Xóa dữ liệu
	if (isset($_GET['delete'])) {
	  $id = $_GET['delete'];

	  $sql = "DELETE FROM users WHERE id=$id";

	  if (mysqli_query($conn, $sql)) {
	    echo "Record deleted successfully";
	  } else {
	    echo "Error deleting record: " . mysqli_error($conn);
	  }
	}

	// Lấy dữ liệu từ CSDL
	$sql = "SELECT * FROM users";
	$result = mysqli_query($conn, $sql);
	?>

	<h2>CRUD Example</h2>

	<!-- Form thêm dữ liệu -->
	<h3>Add User</h3>
	<form method="post" action="">
		<label for="name">Name:</label>
		<input type="text" name="name" id="name">
		<br><br>
		<label for="email">Email:</label>
		<input type="text" name="email" id="email">
		<br><br>
		<input type="submit" name="submit" value="Add User">
	</form>
	<br><br>

	<!-- Danh sách dữ liệu -->
	<h3>User List</h3>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Action</th>
		</tr>
		<?php while($row = mysqli_fetch_assoc($result)) { ?>
		<tr>
			<td><?php echo $row['id']; ?></td>
			<td><?php echo $row['name']; ?></td>
			<td><?php echo $row['email']; ?></td>
			<td>
				<a href="edit.php?id=<?php echo $row['id']; ?>">Edit</a>
				<a href="?delete=<?php echo $row['id']; ?>" onclick="return confirm('Are you sure you want to delete this record?')">Delete</a>
			</td>
		</tr>
		<?php } ?>
	</table>

	<?php mysqli_close($conn); ?>
</body>
</html>
