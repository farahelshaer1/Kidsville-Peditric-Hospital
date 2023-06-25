<?php
if($_SERVER['REQUEST_METHOD'] === 'GET'){
    session_start();
    include_once("conn.php");
    if(!isset($_SESSION['user'])){
        //header("Location: pharmacist.php?cart=no_usr");
        echo "no user logged in";
        exit();
    }
    //print_r($_GET);
    if(empty($_GET['pid']) || empty($_GET['quan'])){
        echo "empty parameters";
        exit();
    }
    $sql = "SELECT * FROM cart WHERE pid='".$_GET['pid']."' AND uid='".$_SESSION['user']['id']."' ;";
    if($res = mysqli_query($conn,$sql)){
        $sql3 = "SELECT quan FROM product WHERE pid='".$_GET['pid']."' ;";
        if($res2 = mysqli_query($conn,$sql3)){//check if quan is valid
            $row = mysqli_fetch_assoc($res2);
            if($row['quan'] < $_GET['quan']){
                echo "invalid quan";
                exit();
            }
        }
        if($res->num_rows == 0){
            $sql2 = "INSERT INTO cart(quan,pid,uid) VALUES('".$_GET['quan']."','".$_GET['pid']."','".$_SESSION['user']['id']."') ;";
            if(mysqli_query($conn,$sql2)){
                echo "added";
                exit();
            }else{
                echo "add error";
                exit();
            }
        }else{
            $sql2 = "UPDATE cart set quan='".$_GET['quan']."' WHERE pid='".$_GET['pid']."' AND uid='".$_SESSION['user']['id']."' ;";
            if(mysqli_query($conn,$sql2)){
                echo "updated";
                exit();
            }else{
                echo "update error";
                exit();
            }
        }
    }
}
?>