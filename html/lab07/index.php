<html>
	<head>
		<title> PHP Test Page </title>
	</head>
	<body>
		<?php echo "Hello world!"; ?>
		<br>
		<?php echo $_SERVER['HTTP_USER_AGENT']; ?>
		<br>
		<?php 
			if(strpos($_SERVER['HTTP_USER_AGENT'], 'Chrome')){
		?>
				<h3>strpos() returned true</h3>
				<p>You are using chrome</p>
		<?php
			}
			else {
		?>
				<h3>strpos() returned false</h3>
				<p>You are not using chrome</p>
		<?php
			}
		?>
		<form action="action.php" method="post">
			<label for="name">Your name:</label>
			<input name="name" id="name" type="text">

			<label for="age">Your age:</label>
			<input name="age" id="age" type="number">

			<button type="submit">Submit</button>
		</form>

	</body>
</html>
