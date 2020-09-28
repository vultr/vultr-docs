<html>

  <head>
    <title>Using MySQL BLOB Data Type with PHP</title>
  </head>

  <body>

    <h1 align = 'center'>Student's Database</h1>

    <table align = 'center' border = '2'>
      <tr>            
        <th>Student Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Student Photo</th>           
      </tr>
    <?php

        try {

            $db_name     = 'students';
            $db_user     = 'sample_user';
            $db_password = 'SAMPLE_PASSWORD';
            $db_host     = 'localhost';

            $pdo = new PDO('mysql:host=' . $db_host . '; dbname=' . $db_name, $db_user, $db_password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql_students = 'select
                             student_id,
                             first_name,
                             last_name,
                             photo
                             from register
                             ';

            $stmt = $pdo->prepare($sql_students);

            $stmt->execute();

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo '<tr>';
                  echo '<td>' . $row['student_id'] . '</td>';
                  echo '<td>' . $row['first_name'] . '</td>';
                  echo '<td>' . $row['last_name']  . '</td>';
                  echo '<td>' 
                  . '<img src = "data:image/png;base64,' . base64_encode($row['photo']) . '" width = "80px" height = "80px"/>'
                  . '</td>';
                echo '</tr>';
            }
        } catch (PDOException $e) {
            echo 'The records can not be loaded. ' . $e->getMessage();
        }
   ?>

    </table>

  </body>

</html>
