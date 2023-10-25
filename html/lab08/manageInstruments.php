<?php

    function result_to_html_table($result) {
        // $result is a mysqli result object. This function formats the object as an
        // HTML table. Note that there is no return, simply call this function at the 
        // position in your page where you would like the table to be located.

        $result_body = $result->fetch_all();
        $num_rows = $result->num_rows;
        $num_cols = $result->field_count;
        $fields = $result->fetch_fields();
?>
<!-- Description of table - - - - - - - - - - - - - - - - - - - - -->
<!-- <p>This table has <?php //echo $num_rows; ?> and <?php //echo $num_cols; ?> columns.</p> -->

<!-- Begin header - - - - - - - - - - - - - - - - - - - - -->
<form method=POST>
    <table>
        <thead>
            <tr>
            <?php for ($i=0; $i<$num_cols; $i++){ ?>
                <td><b><?php echo $fields[$i]->name; ?></b></td>
            <?php } ?>
                <td>
                    <b> Delete? </b>
                </td>
            </tr>
        </thead>
    
        <!-- Begin body - - - - - - - - - - - - - - - - - - - - - -->
        <tbody>
            <?php for ($i=0; $i<$num_rows; $i++){ ?>
                <?php $id = $result_body[$i][0]; ?>
                <tr>     
                <?php for($j=0; $j<$num_cols; $j++){ ?>
                    <td><?php echo $result_body[$i][$j]; ?></td>
                <?php } ?>
                    <td>
                        <input type="checkbox"
                        name="checkbox<?php echo $id; ?>"
                        value=<?php echo $id; ?>
                        />
                    </td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
    <input type="submit" value="Delete Selected Records" method=POST/>
</form>
<?php 
    } 
?>

<!----------------------------- end function -------------------------------->

<html>
    <head>
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
            $dbname = "instrument_rentals";
        ?>
        <?php
            if (!$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname)){
                echo "Error: Failed to make a MySQL connection: " . "<br>";
                echo "Errno: $conn->connect_errno; i.e. $conn->connect_error \n";
                exit;
            }
        ?>
    </head>
    <body>
        <?php
            //select statement and USE db query
            $select = "SELECT instrument_id, instrument_type FROM instruments";
            $conn->query("USE {$dbname}");  
        ?>
        <?php
            //run select statement and call result_to_html_table on result
            if (!$result = $conn->query($select)){
                echo "SELECT failed!\n";
                exit();
            }
            result_to_html_table($result);
        ?>

        <!-- DELETE RECORDS -->

        <?php
            //create delete statement
            $del_stmt = $conn->prepare("DELETE FROM instruments WHERE instrument_id = ?;");
            $del_stmt->bind_param('i', $id);
        ?>
        <?php
            //delete records if box is checked
            $result = $conn->query($select);
            $resrows = $result->fetch_all();

            for($i = 0; $i < $result->num_rows; $i++){
                $id = $resrows[$i][0];
                $key = "checkbox" . $id;
                if (isset($_POST[$key]) && !$del_stmt->execute()){
                    echo $conn->error;
                }
            }
        ?>

        <!-- ADD RECORDS -->

        <form method=POST>
            <button type="submit" name='add_records'> Add Records</button>
            <?php
            if(isset($_POST['add_records'])){
                $conn->query("INSERT INTO instruments(instrument_type) VALUES
                ('Guitar'),
                ('Trumpet'),
                ('Flute'),
                ('Theremin'),
                ('Violin'),
                ('Tuba'),
                ('Melodica'),
                ('Trombone'),
                ('Keyboard');");
            }
            ?>
        </form> 
        



        <?php
        $conn->close();
        ?>
    </body>

</html>