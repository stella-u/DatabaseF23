<html>
    <head>
        This page will connect to and and diplay a list of 
        databases from the localhost
    </head>
    <body>
        <?php 
            //displays error messages
            ini_set('display_errors', 1);
            ini_set('display_startup_errors', 1);
            error_reporting(E_ALL);
        ?>
        <?php
            //sets variables and connects to the database
            $dbhost = 'localhost';
            $dbuser = 'stella';
            $dbpass = 'Hello';
            $conn = new mysqli($dbhost, $dbuser, $dbpass);
        ?>
        <?php
            //checks that we've successfully connected and displays error message if not
            if ($conn->connect_errno) {
                echo "Error: Failed to make a MySQL connection, here is why: ". "<br>";
                echo "Errno: " . $conn->connect_errno . "\n";
                echo "Error: " . $conn->connect_error . "\n";
                exit; // Quit this PHP script if the connection fails.
            } 
            //displays Yay when successfully connected to database
            else {
                echo "Connected Successfully!" . "<br>";
                echo "YAY!" . "<br>";
            }
        ?>
        <br>
        <h4>Your databases are:</h4>
        <?php
            $dblist = "SHOW databases";
            $result = $conn->query($dblist);
            while($dbname = $result->fetch_array()){
                echo $dbname['Database'] . "<br>";
            }
        ?>
        <br>
        <form action="details.php" method="post">
			<label for="database">Select a database to learn more about it:</label>
            <select id="database" name="database">
                <?php
                    $result = $conn->query($dblist);
                    while($dbname = $result->fetch_array()){
                        print "<option value= '{$dbname['Database']}' > {$dbname['Database']} </option>";
                    }
                    $conn->close();
                ?>
            </select>\
            <button type="submit">Submit</button>
		</form>
    </body>
</html>
