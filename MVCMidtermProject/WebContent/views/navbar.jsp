<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Navbar</title>
</head>
<body>
    <!-- Referenced http://getbootstrap.com/docs/4.0/components/navbar/ on 9/28/17 -->
    <nav class="navbar navbar-expand-xl navbar-dark bg-dark">
    
    		<!-- Below is where the logo will go -->
      <a class="navbar-brand" href="http://18.220.208.40/" target="_blank">
        <img src="images/me.jpeg" width="30" height="30" class="d-inline-block align-top" alt="microsanctuary logo"> MicroSanctuary Equipment Exchange
      </a>
      <!--  Below is dropdowns for the navbar, may not need for this project -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Web Projects
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="http://18.220.208.40:8080/PizzaParty/" target="_blank">Pizza Party </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="http://18.216.132.236:8080/USPresidentsWeb/" target="_blank">President Information</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="https://jdcald13.github.io/" target="_blank">Learn Java the Hard Way Blog</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Java Projects
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="https://github.com/jdcald13/BlackJackProject" target="_blank">Blackjack</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="https://github.com/jdcald13/JetsProject" target="_blank">Jets</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="https://github.com/jdcald13/MakeChangeProject" target="_blank">Make Change</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Python Projects
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="https://github.com/jdcald13/Winning_Texas_Holdem_Strategy" target="_blank"> Winning Texas Holdem Strategy </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="https://github.com/jdcald13/Winning_Texas_Holdem_Strategy/tree/master/BA_design" target="_blank"> - Analyst Design Mockup </a>
              <a class="dropdown-item" href="https://github.com/jdcald13/Winning_Texas_Holdem_Strategy/tree/master/app" target="_blank"> - Application Code </a>
              <a class="dropdown-item" href="https://github.com/jdcald13/Winning_Texas_Holdem_Strategy/wiki" target="_blank"> - Documentation </a>
              <a class="dropdown-item" href="https://github.com/jdcald13/Winning_Texas_Holdem_Strategy/wiki/Game-Instructions" target="_blank"> - Graphical User Interface </a>
              <a class="dropdown-item" href="https://github.com/jdcald13/Winning_Texas_Holdem_Strategy/tree/master/reports" target="_blank"> - Report Samples </a>
              <a class="dropdown-item" href="https://github.com/jdcald13/Winning_Texas_Holdem_Strategy/tree/master/tests" target="_blank"> - Test Cases Code </a>
              <a class="dropdown-item" href="https://github.com/jdcald13/Winning_Texas_Holdem_Strategy/wiki/Testing-Concepts" target="_blank"> - Testing Concepts </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="https://github.com/jdcald13/Guess_the_Number" target="_blank">Guess the Number</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Resume
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#tech"> Technologies Summary </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#programming_exp"> Developer Training </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#software_exp"> Software Experience </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#military_exp"> Military Experience </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#other_exp"> Other Experience </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#edu"> Education </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="images/Caldwell_Printable_Resume.pdf"> Printable Resume </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#other"> Miscellaneous </a>
            </div>
          </li>
        </ul>
        <a class="btn btn-social btn-facebook" href="https://www.facebook.com/Microsanctuary/" target="_blank" title="Colorado Microsanctuary Network Facebook">
          <span class="fa fa-facebook"></span> Colorado Microsanctuary Network
        </a>
      </div>
    </nav>
</body>
</html>