<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
     <title>About</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="Asset/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="Default.aspx">Turbo URL Shortener</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Default.aspx">HOME</a></li>
         <li><a href="About.aspx">ABOUT</a></li>
        <%--<li><a href="#">CONTACT</a></li>--%>
      </ul>
    </div>
  </div>
</nav>


<div class="container text-center alert-danger">
  <h3>ABOUT THE AUTHOR</h3>
  <p><em>We love CODING!</em></p>
  <p>We have created a URL Shortener website..</p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong></strong></p><br>
      <img src="img/usersetting.png" class="img-circle person" alt="Random Name" width="255" height="255">
    </div>
    <div class="col-sm-4">
      
    </div>
  </div>
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">    
  <h3 class="margin">About Me?</h3><br>
  <div class="row">
   <div class="col-sm-4"> 
      
    </div>
    <div class="col-sm-4">
      <table class="table">
      <tr>
      <th>Name:</th>
      <td>Baliram Kumar Yadav</td>
      </tr>

      <tr>
      <th>Role:</th>
      <td>Junior ASP.NET Developer</td>
      </tr>



      <tr>
      <th>Address:</th>
      <td>Bhadohi UP India </td>
      </tr>

      <tr>
      <th>Email:</th>
      <td>ballubalrambca@gmail.com</td>
      </tr>

      </table>
    </div>
   
    <div class="col-sm-4"> 
      
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p> Made By <a href="#">Baliram Yadav</a></p> 
</footer>
    </form>
</body>
</html>
