<?php
include_once("conn.php");
session_start();
if(!isset($_SESSION['user']) || $_SESSION['user']['role']!='admin'){
    header("Location: ../index.php?unauthorized");
    exit();
}
// Process the login form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
$target_dir = "../uploads/";
//$target_file = $target_dir . basename($_FILES["img"]["name"]);
$target_file = strval(time());
$uploadOk = 1;
$fname="";
/*print_r($_POST)."<hr>";
print_r($_FILES);*/
// Check if image file is a actual image or fake image
if($_FILES["img"]) {
  $check = getimagesize($_FILES["img"]["tmp_name"]);
  if($check !== false) {
    // Check file size
    if ($_FILES["img"]["size"] > 500000) {
        header("Location: ../add.php?img=big_file");
        exit();
    }else{
        
        $name = explode(".",$_FILES["img"]["name"]);
        $imageFileType = $name[count($name)-1];
        // Allow certain file formats
        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif" ) {
            header("Location: ../add.php?img=unsupported_ext");
            exit();
        }else{
            $fname=$target_file.".$imageFileType";
            if (!move_uploaded_file($_FILES["img"]["tmp_name"], $target_dir.$fname)) {
                header("Location: ../add.php?img=server_error");
                exit();
            }
        }
    }
    //Array ( [pname] => [quan] => [price] => [exp_date] => [info] => [hpis] => [healthcare] => Yes [latex] => Yes [route] => )
    
    $pname = $_POST['pname'];
    $quan = $_POST['quan'];
    $price = $_POST['price'];
    $exp_date = $_POST['exp_date'];
    $info = $_POST['info'];
    $hpis = $_POST['hpis'];
    $healthcare = $_POST['healthcare'];
    $latex = $_POST['latex'];
    $route = $_POST['route'];
    /*if(empty($pname) || empty($quan) || empty($price) || empty($exp_date) || empty($info) || empty($hpis) || empty($healthcare) || empty($latex) || empty($route) ){
        header("Location: ../add.php?param=empty");
        exit();
    }*/
    $sql = "INSERT INTO product(pname,quan,price,exp_date,prod_img) VALUES('$pname','$quan','$price','$exp_date','$fname');"; 
    if(mysqli_query($conn,$sql)){
        $pid = mysqli_insert_id($conn);
        $rows = explode("~",$info);
        foreach ($rows as $row) {
            if($row == ''){
                break;
            }
            $data = explode(";",$row);
            $sql2 = "INSERT INTO info(pid,material,description,packaging) VALUES ('$pid','$data[0]','$data[1]','$data[2]');";
            //echo($sql2)."<br>";
            if(!mysqli_query($conn,$sql2)){
                header("Location: ../add.php?add=info_error");
                exit();
            }
        }
        $sql3 = "INSERT INTO specs(pid,hpis,healthcare,latex,route) VALUES('$pid','$hpis','$healthcare','$latex','$route');";
        if(mysqli_query($conn,$sql3)){
            header("Location: ../add.php?add=success");
            exit();
        }else{
            header("Location: ../add.php?add=specs_error");
            exit();
        }
    }else{
        header("Location: ../add.php?add=sql_error");
        exit();    
    }
} else {
    header("Location: ../add.php?img=not_img");
    exit();
  }
}

}
