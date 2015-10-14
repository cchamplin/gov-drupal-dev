<?php $mailcatcher = "http://$_SERVER[HTTP_HOST]:1080" ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>LAP Docker Dashboard</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    
    <!-- Custom styles for this template -->
    <link href="justified-nav.css" rel="stylesheet">

    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  </head>

  <body>

    <div class="container">

      <!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
      <div class="masthead">
        <h3 class="text-muted">LAP Docker Dashboard</h3>
        <nav>
          <ul class="nav nav-justified">
            <li class="active"><a href="#">Dashboard</a></li>
            <li><a href="adminer.php">Adminer</a></li>
            <li><a href="<?php print $mailcatcher; ?>">Mailcatcher</a></li>
            <li><a href="logs/">Logs</a></li>
            <li><a href="phpinfo.php">phpinfo</a></li>
            <li><a href="http://usda-ocio-eas.github.io/lap-docker/news/">News</a></li>
            <li><a href="http://usda-ocio-eas.github.io/lap-docker/contrib/">Contrib</a></li>
            <li><a href="http://usda-ocio-eas.github.io/lap-docker/docs/">Docs</a></li>
          </ul>
        </nav>
      </div>

      <!-- Jumbotron -->
      <div class="jumbotron">
        <h1>Start Development Now!</h1>
        <p class="lead">LAP Docker let's your team begin working without wait.</p>
        <p><a class="btn btn-lg btn-success" href="http://usda-ocio-eas.github.io/lap-docker/docs/" role="button">Get started today</a></p>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Dashboard Usage!</h2>
          <p class="text-danger">The dashboard links are set to use default ports.</p>
          <p>Mailcatcher, Adminer, and other dashboard links expect the default quickstart port mapping configurations. Using non-standard ports may direct to other Virtual Machines or not respond. </p>
          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>Standard MySQL Connections</h2>
          <p>LAP Docker supports MySQL connections using the following user credentials: <br><b>Hostname: </b>db<br><b>Username: </b>user<br><b>Password: </b>user</p>
          <p><a class="btn btn-primary" href="adminer.php" role="button">Adminer &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Contribute & Support</h2>
          <p>LAP Docker is an open source software dedicated to providing rapid web application development, testing, and debugging. If you'd like to contribute to or support for using LAP Docker, get it touch.</p>
          <p><a class="btn btn-primary" href="mailto:rone.williams@ocio.usda.gov" role="button">Contribute &raquo;</a></p>
        </div>
      </div>

      <!-- Site footer -->
      <footer class="footer">
        <p>LAP Docker is maintained by the USDA OCIO EAS Web Tech Team.</p>
      </footer>

    </div> <!-- /container -->
  </body>
</html>
