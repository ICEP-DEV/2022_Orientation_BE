<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');


require_once ('PHPMailerAutoload.php');
    function sendOTP($emailUser,$severEmail,$password,$subject,$body)
    {
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->SMTPAuth = true;
        $mail->SMTPSecure = 'ssl';
        $mail->Host = 'smtp.gmail.com';
        $mail->Port = '465';
        $mail->isHTML();
        $mail->Username = $severEmail;
        $mail->Password = $password;
        $mail->SetFrom('no-reply@knine');
        $mail->Subject = $subject;
        $mail->Body = $body;
	$mail->AddAddress($emailUser);
        $mail->Send();
    }


    $body = file_get_contents('php://input');


    $email = json_decode($body)->{'email'};
    $otp = json_decode($body)->{'otp'};

     $emailBody ="Hi your One Time Pin (OTP) is ${otp} this OTP was requested with the Tut orientation system for verification of the user "; 
     $emailTittle = "Tut Orientation OTP ";
    sendOTP($email,"no.reply.k9nine@gmail.com","Tut@2017",$emailTittle,$emailBody);
    
?>
