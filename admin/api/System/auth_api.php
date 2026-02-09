<?php

class AuthApi {

    function __construct(){       
        
        // if(!$this->authenticated()){
        //      http_response_code(400);
        // }
    }
  //----Mange-----
    function index(){  
              
      //echo "Index";
     // view("system");
    }
    
    
   
    function valid($data){

        $jwt=new JWT();
        if($jwt->is_valid($data["token"])){
            echo "valid";
        }else{
            echo "invalid";
        }
    }

    function login($data){

        global $db;
        global $tx;
       
            $username=trim($data["username"]);
            $password=trim($data["password"]);
             $result=$db->query("select u.* from {$tx}users u,{$tx}roles r where r.id=u.role_id and (u.name='$username' OR u.email='$username')");
                            
             $user=$result->fetch_object();
       
             if($user && password_verify($password,$user->password_hash)){
               
                        $jwt=new JWT();
                        $jwt->min=50;
                        $payload=[
                            "id"=>$user->id,
                            "name"=>$user->name,
                            "role_id"=>$user->role_id,
                            "email"=>$user->email,
                            "ip"=>get_ip(),
                            "iss"=>"jwt.server",
                            "aud"=>"intels.co"
                        ];

                        $token= $jwt->generate($payload);
                        
                        echo json_encode(["success"=>1,"token"=>$token]);
                }else{
                        echo json_encode(["success"=>0,"user"=>$user,"username"=>$username,"password"=>$password]);
                }     

        

    }

    function register($data){
        global $db;
        global $tx;

        $username = trim($data["username"]);
        $email = trim($data["email"]);
        $password = trim($data["password"]);
        $phone = isset($data["phone"]) ? trim($data["phone"]) : "";
        $role_id = 4; // Default to customer
        $now = date("Y-m-d H:i:s");

        // Check if user exists
        $check = $db->query("select id from {$tx}users where name='$username' OR email='$email'");
        if($check->num_rows > 0){
            echo json_encode(["success"=>0, "message"=>"Username or Email already exists"]);
            return;
        }

        $password_hash = password_hash($password, PASSWORD_DEFAULT);

        $sql = "insert into {$tx}users(name, email, password_hash, role_id, phone, created_at, updated_at) values('$username', '$email', '$password_hash', '$role_id', '$phone', '$now', '$now')";
        
        if($db->query($sql)){
             echo json_encode(["success"=>1, "message"=>"Registration successful"]);
        }else{
             echo json_encode(["success"=>0, "message"=>"Registration failed"]);
        }
    }


}