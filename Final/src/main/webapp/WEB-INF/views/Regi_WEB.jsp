<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#menu {
      margin: 0;
      background-color: #E1BEE7;
      font-size: 16px;
      font-family: Tahoma, Geneva, sans-serif;
      font-weight: bold;
      text-align: left;
      padding: 8px;
      border-radius: 8px;
      -webkit-border-radius: 8px;
      -moz-border-radius: 8px;
      -o-border-radius: 8px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0 16px;
      margin-bottom: 1cm; /* 간격 조절 */
    }
    
    #menu ul {
      margin: 0;
      padding: 8px 0;
      list-style: none;
      height: auto;
      display: flex;
    }
    
    #menu li {
      display: block;
      padding: 8px;
      margin-right: 8cm; /* 간격 조절  (Home, My, Settings 간격 조절해주는 코드) */ 
    }
    
    #menu a {
      color: #FFF;
      padding: 10px;
      text-decoration: none;
    }
    
    #menu a:hover {
      background-color: #1B191B;
      color: #FFF;
      border-radius: 20px;
      -webkit-border-radius: 20px;
      -moz-border-radius: 20px;
      -o-border-radius: 20px;
    }
    
    #menu li .active {
      background-color: #1B191B;
      color: #FFF;
      border-radius: 20px;
      -webkit-border-radius: 20px;
      -moz-border-radius: 20px;
      -o-border-radius: 20px;
    }
    
    .logo {
 /*     text-align: right;
      margin-right: 10cm;  */ /* 간격 조절 */

      text-align: center;
      margin-right: auto;
      margin-left: auto;
      width: 50%;
    }

* {
    margin: 0px;
    padding: 0px;
    text-decoration: none;
    font-family:sans-serif;
  
  }
  
    body {
      background-color: #F3EBF6;
      font-family: 'Ubuntu', sans-serif;
      margin: 0;
   /*   padding: 0;*/
    }
  
  
  .joinForm {
  /*  position:absolute;
    width:500px;
    height:700px;
    padding: 30px, 20px;
    background-color:#FFFFFF;
    text-align:center;
    top:75%;
    left:50%;
    transform: translate(-50%,-50%);
    border-radius: 15px;
   */
   
  position: absolute;
  width: 500px;
  height: 700px;
  padding: 30px, 20px;
  background-color: #FFFFFF;
  text-align: center;
  top: calc(50% - 0.01cm);
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 15px;
  }
  
  .joinForm h2 {
    text-align: center;
    margin: 30px;
    color: #8C55AA;
  }
  
  .textForm {
    border-bottom: 2px solid #adadad;
    margin: 30px;
    padding: 10px 10px;
  }
  
  
  .id {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
    font-weight: bold;
  }
  
  .pw {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
    font-weight: bold;
  }
  
  .name {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
    font-weight: bold;
  }
  
  .email {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
    font-weight: bold;
  }
  
  .nickname {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
    font-weight: bold;
  }
  
  .phone {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
    font-weight: bold;
  }
  
  .btn {
    position:relative;
    left:40%;
    transform: translateX(-50%);
    margin-bottom: 40px;
    margin-top: 1cm;
    width:80%;
    height:40px;
    box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    background: linear-gradient(to right, #9C27B0, #E040FB);
    background-position: left;
    background-size: 200%;
    color:white;
    font-weight: bold;
    border:none;
    cursor:pointer;
    transition: 0.4s;
    display:inline;
    border-radius: 5em;
  }
  
  .btn:hover {
    background-position: right;
  }

  @media only screen and (max-width: 412px) {
      #menu {
        font-size: 14px; /* Decreased font size for menu */
      }

      #menu li {
        margin-right: 1cm; /* Adjusted spacing for Home, My, and Settings */
      }

      .logo {
        width: 60%; /* Decreased logo width */
      }

      .joinForm {
        width: 90%;
        height: 100%;
        padding: 10px;
      }

      .joinForm h2 {
        font-size: 18px; /* Increased font size for form heading */
      }

      .textForm {
        margin: 10px;
        padding: 5px 5px;
      }

      .btn {
        font-size: 14px; /* Decreased font size for button */
        margin-bottom: 20px;
      }
    }

</style>

</head>

<body>
<div id="menu">
    <div class="logo">
      <img src="data:image/jpeg;base64,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" alt="car" height="30" width="30">
    </div>
    <ul>
      <li><a href="#" >Home</a></li> <!--class="active"-->
      <li><a href="#">My</a></li>
      <li><a href="#">Settings</a></li>
    </ul>
  </div>

  <form action="join" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
    <h2>Register</h2>
    <div class="textForm">
      <input name="id" type="text" class="id" placeholder="ID">
    </div>
    <div class="textForm">
      <input name="pw" type="password" class="pw" placeholder="PW" id="loginPwInput">
    </div>
    <div class="textForm">
      <input type="text" class="name" placeholder="Name"><!-- name뺏음 DB로 데이터는 안넘어감 현재. -->
    </div>
    <div class="textForm">
      <input name="email" type="text" class="email" placeholder="Email">
    </div>
    <div class="textForm">
      <input name="phone" type="text" class="phone" placeholder="Phone">
    </div>
    <input type="submit" class="btn" value="J O I N"/>
  </form>
</body>
</html>