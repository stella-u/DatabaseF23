<html>
	<head>
		<title> Form Submission Page </title>
	</head>
	<body>
        Hi <?php echo htmlspecialchars($_POST['name']);?>.
        <br>
        You are <?php echo (int) $_POST['age']; ?> years old.
    </body>
</html>