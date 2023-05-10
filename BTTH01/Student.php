<?php
    class student{
        private $msv;
        private $name;
        private $addrees;

        public function __construct($msv, $name, $addrees){
            $this->msv = $msv;
            $this->name = $name;
            $this->addrees = $address;
        }
        public function setMsv($msv){
            $this->msv = $msv;
        }
        public function getMsv(){
            return $this->msv;
        }
        public function setName($name){
            $this->name = $name;
        }
        public function getName(){
            return $this->name;
        }
        public function setAddress($addrees){
            $this->sex = $addrees;
        }
        public function getAddress(){
            return $this->address;
        }
    }
?>
<?php
   // include "listofstudent.php";
?>
<?php
    if(count($_POST) > 0 ){

        $file = fopen("ClistOfStudent.txt", "a");
        $new_data = array($_POST["msv"], $_POST["name"], $_POST["address"]);

        fputcsv($file,$new_data);
        fclose($file);
       

        // $file = fopen("ClistOfStudent.txt", "r");
        // $data = fread($file, filesize("ClistOfStudent.txt"));
        // print_r($data);
        header("location: listofstudent.php");
        exit();
    }
?>
<form method="POST" action="">
    <label for="msv">Mã SV:</label>
    <input type="text" name="msv" id="msv">
    <label for="name">Họ Tên:</label>
    <input type="text" name="name" id="name">
    <label for="address">Địa chỉ :</label>
    <input type="text" name="address" id="address">
    <input type="submit" value="Thêm">
</form>

