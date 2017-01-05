<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    /* SIMPLE DEMO STYLES */
    body {
      font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
      font-size: 12px;
      line-height: 1.6;
    }
    .container {
      margin: 50px;
      max-width: 700px;
    }
    .container img {
      width: 100%;
    }
    .container .pull-left {
      width: 55%;
      float: left;
      margin: 20px 20px 20px -80px;
    }
    @media (min-width: 750px) {
      body {
        font-size: 16px;
        line-height: 1.6;
      }
      .container {
        margin: 100px auto;
      }
    }
  </style>
  <link href="plug-in/zoom/css/zoom.css" rel="stylesheet"> 
</head>
<body>
  <div class="container">
    <h1>Image Zoom</h1>

    <img src="userfiles/images/NSC选型演示.gif" data-action="zoom">

      <img src="userfiles/images/NSC选型演示.gif" data-action="zoom" class="pull-left">
 

  </div>
      <script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.js"></script>
    <script src="plug-in/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>  
  <script src="plug-in/zoom/js/zoom.js"></script>
</body>
</html>
