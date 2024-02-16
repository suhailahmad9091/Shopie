<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

?>

<?php
   if(isset($_POST['send']))
   {
      $name = $_POST['name'];
      $name = filter_var($name, FILTER_SANITIZE_STRING);
      $msg = $_POST['msg'];
      $msg = filter_var($msg, FILTER_SANITIZE_STRING);

      $select_message = $conn->prepare("SELECT * FROM `feedback` WHERE name = ? AND description = ?");
      $select_message->execute([$name, $msg]);

      if($select_message->rowCount() > 0){
         $message[] = 'Already sent feedback';
      }else{

         $insert_message = $conn->prepare("INSERT INTO `feedback`(user_id, name, description) VALUES(?,?,?)");
         $insert_message->execute([$user_id, $name, $msg]);

         $message[] = 'Sent feedback successfully';

      }
   }

?>

<!DOCTYPE html>
   <html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Feedback</title>
      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

      <link rel="stylesheet" href="css/style.css">

   </head>
   <body>

<?php include 'components/user_header.php'; ?>

   <section class="contact">
      <div class="box-container">   

<?php
   if($user_id == ''){
   echo '<p class="empty">please login to contact</p>';
}
else{

?>   
      <form action="" method="post">
         <h3>Feedback</h3>
         <input type="text" name="name" placeholder="Enter your name" required maxlength="30" class="box">
         <textarea name="msg" class="box" placeholder="Enter your feedback" cols="30" rows="10" required></textarea>
         <input type="submit" value="send message" name="send" class="btn">
      </form>

   </div>

   </section>


<?php 

}

include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>