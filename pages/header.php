<?php
session_start();
?>
<div class="site-navbar py-2">
<div class="link-section">
  <div class="log-in-link">
    <?php
    if(!isset($_SESSION['user'])){
      echo '<a href="pharmacist.php" class="login-sidebar-link">
      <img src="login_logo.png" alt="Login Here" width="20" height="20" style="max-width: 100%; height: auto; vertical-align: middle; border-style: none;">
      <span>Login Here</span>
      </a>';
    }else{
      echo '<img src="login_logo.png" alt="Logout Here" width="20" height="20" style="max-width: 100%; height: auto; vertical-align: middle; border-style: none;">'.$_SESSION['user']['fname'].'/<a href="pages/logout.php" class="login-sidebar-link">
      <span>Logout Here</span>
      </a>';
    }

    ?>
  </div>
<div class="search-wrap">
  <div class="container">
    <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
    <form action="#" method="post">
      <input type="text" class="form-control" placeholder="Search keyword and hit enter...">
    </form>
  </div>
</div>

<div class="container">
  <div class="d-flex align-items-center justify-content-between">
    <div class="logo">
      <div class="site-logo">
        <a href="index.php" class="js-logo-clone">Kidsville Pharmacy</a>
      </div>
    </div>
    <div class="main-nav d-none d-lg-block">
        <nav class="site-navigation text-right text-md-center" role="navigation">
        <ul class="site-menu js-clone-nav d-none d-lg-block" id="lis">
            <li><a href="index.php">Home</a></li>
            <li><a href="shop.php">Store</a></li>
            <li><a href="contact.php">Contact</a></li>
          <?php
          if(isset($_SESSION['user'])){
            if($_SESSION['user']['role']=='admin'){
              echo '
              <li><a href="add.php">Add Product</a></li>
              <li><a href="viewPrescriptions.php">View Prescriptions</a></li>';
            }else if($_SESSION['user']['role']=='doctor'){
              echo '<li><a href="dashboard.php">Dashboard</a></li>';
            }
          }
          ?>
          <!--<li class="has-children">
                <a href="#">Dropdown</a>
                <ul class="dropdown">
                <li><a href="#">Supplements</a></li>
                <li class="has-children">
                    <a href="#">Vitamins</a>
                    <ul class="dropdown">
                    <li><a href="#">Supplements</a></li>
                    <li><a href="#">Vitamins</a></li>
                    <li><a href="#">Diet &amp; Nutrition</a></li>
                    </ul>
                </li>
                <li><a href="#">Diet &amp; Nutrition</a></li>

                </ul>
            </li> -->
        </ul>
      </nav>
    </div>
    <div class="icons">
      <a href="#" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
      <a href="cart.php" class="icons-btn d-inline-block bag">
        <span class="icon-shopping-bag"></span>
        <span class="number" id="num"></span>
      </a>
      <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
          class="icon-menu"></span></a>
    </div>
  </div>
</div>
</div>
<script>
  setInterval(function(){
    const xhttp = new XMLHttpRequest();
      xhttp.open("GET", "num_cart.php");
      //xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          //console.log(this.responseText);
          document.getElementById("num").innerText = this.responseText;
        }
      };
      xhttp.send();
    },500);
    document.addEventListener("DOMContentLoaded", () => {
    var URL =location.pathname.split('/');
    var page = URL[URL.length-1];
    let li = document.getElementById("lis").children;
    if(page==''){
      for(var i = 0;i<li.length;i++){
        var ch_page = li[i].children[0].href.split("/");
        if(ch_page[ch_page.length-1]=="index.php"){
          li[i].className="active";
        }
          //console.log(li[i].children[0].href);
        }
    }else{
      for(var i = 0;i<li.length;i++){
          var ch_page = li[i].children[0].href.split("/");
          if(ch_page[ch_page.length-1]==page){
            li[i].className="active";
          }
          //console.log(li[i].children[0].href);
        }
    }
    console.log(page);
  });
</script>