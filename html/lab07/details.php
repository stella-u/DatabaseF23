<html>
    <head>
        This page will connect to the database and display a list of fields
        from the selected database.
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
        ?>
        <h3> Tables in <?php echo htmlspecialchars($_POST['database']);?> : </h3>
        <ul>
            <?php
                $db = htmlspecialchars($_POST['database']);
                $dbuse = "USE {$db}";
                $conn->query($dbuse);
                $dbtables = "SHOW tables";
                $result = $conn->query($dbtables);
                $i = 0;
                while($table = $result->fetch_array()){
                    echo "<li> {$table[0]} </li>";
                    $i++;
                }
                $conn->close();
            ?>
        </ul>
    </body>
</html>