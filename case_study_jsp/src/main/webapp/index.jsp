<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/19/2022
  Time: 5:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <style>
      body{
        font-family: Arial, Tahoma;
        font-size: 12px;
        box-sizing: border-box;
      }

      #main{
        width: 100%;
        padding: 0;
        margin-left: auto;
        margin-right: auto;
        background-image: url("https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10024652-bc18297d4573af8399677d30a0363d4e.jpeg?tr=q-40,c-at_max,w-1280,h-720&_src=imagekit");
      }

      #head{
        height: 100px;
        background-color: #F5F5F5;
        border: 1px solid #CDCDCD;
        margin-bottom:5px;
      }

      #head-link{
        height: 60px;
        line-height: 30px;
        padding-left: 10px;
        padding-right: 10px;
        border: 1px solid #CDCDCD;
        background-color: #F5F5F5;
        margin-bottom:5px;
        clear: both;

      }

      #left{
        width: 20%;
        min-height: 400px;
        border: 1px solid #CDCDCD;
        float:left;
        background-color: lightgrey;
        margin-bottom: 5px;
      }

      #content{
        width: 79%;
        min-height: 400px;
        border: 1px solid #CDCDCD;
        float:left;
        margin-left: 5px;
        /*margin-right: 5px;*/
        /*margin-bottom: 5px;*/
      }

      #footer{
        height: 60px;
        clear: both;
        border: 1px solid #CDCDCD;
        background-color: #F8F8FF;
      }
    </style>
  </head>
  <body>
  <div id="main">
    <div id="head">
      <div style="float: left;">
        <img style="height: 90px; margin-top: 5px; margin-left: 10px" src="https://cardy.vn/upload/images/san-pham/logo-diem-uu-dai/640x480/2/fvd.jpg" alt="">
      </div>

      <div style="float: right; height: 100px">
        <p style="height: 100px; line-height: 100px; font-size: 15px; font-weight: bold">Hoàng Định</p>
      </div>
    </div>
    <div id="head-link">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Home</a>
        <a class="navbar-brand" href="/employee?action=list">Employee</a>
        <a class="navbar-brand" href="/resort?action=list">Customer</a>
        <a class="navbar-brand" href="/service?action=list">Service</a>
        <a class="navbar-brand" href="#">Contract</a>


        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">

          </ul>
          <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          </form>
        </div>
      </nav>
    </div>
    <div id="left">

    </div>
    <div id="content">

    </div>
    <div id="footer">

    </div>
  </div>


  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
          integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
          integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
          integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
          crossorigin="anonymous"></script>
  </body>
</html>
