<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><?php echo $this->get('page_title', 'Codeigniter Theme default title');?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

 		<link href="css/fonts.css?family=Open+Sans:300,600,700" rel="stylesheet" />
		<script src="js/jquery-1.8.3.min.js"></script>
		<script src="css/5grid/init.js?use=mobile,desktop,1000px"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/5grid/core.css" />
			<link rel="stylesheet" href="css/5grid/core-desktop.css" />
			<link rel="stylesheet" href="css/5grid/core-1200px.css" />
			<link rel="stylesheet" href="css/5grid/core-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
		<!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->

    <script type="text/javascript" src="<?php echo base_url();?>assets/menu8/menu.js"></script>
    <link type="text/css" href="<?php //echo base_url();?>assets/menu8/menu.css" rel="stylesheet" />
    
  </head>

  <body>

  		<!-- Nav -->
			<nav id="nav">
			  <?php //echo get_menu($menu); ?>
			  <?php echo $menu;?>
			<!--
				<ul>
					<li><a href="#top">Top</a></li>
					<li><a href="#work">Work</a></li>
					<li><a href="#portfolio">Portfolio</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
				-->
			</nav>

	
      <?php //display messages ?>
		  <?php bootstrap_messages( $this->messages(FALSE) ); ?>

		  <?php //display content (the view) ?>
      	  <?php echo $this->content(); ?>
	

  </body>
</html>
