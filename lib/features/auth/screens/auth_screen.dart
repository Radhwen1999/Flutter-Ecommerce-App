
import 'package:ecommerce_app/features/auth/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/utils.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName='/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService=AuthService();
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    var nameController=TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    void signInUser(){
      String email=emailController.text;
      String password=passwordController.text;
      BuildContext buildContext;
      if(email.isEmpty){
        showSnackBar(context,"pleave enter a valid email");
      }else if(password.isEmpty){
        showSnackBar(context,"please enter a valid password");
      }else{
        authService.signInUser(context: context, email: emailController.text, password: passwordController.text);
      }
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                height:h*0.24 ,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/img/bg.png"
                        ),fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                width: w,
                margin:EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome",
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,

                      ),),
                    Text("Sign in to your account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,

                      ),),
                    SizedBox(height: 50,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1,1),
                              color: Colors.grey.withOpacity(0.2),
                            )
                          ]
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email,color: Colors.blueGrey.shade800,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:BorderSide (
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1,1),
                              color: Colors.grey.withOpacity(0.2),
                            )
                          ]
                      ),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password,color: Colors.blueGrey.shade800,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:BorderSide (
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Spacer(),
                        Text("Forgot your password?",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,

                          ),),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 70,),
              GestureDetector(
                onTap: (){
                  signInUser();
                },
                child: Container(
                  width: w*0.5,
                  height:h*0.08  ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        //Color.fromARGB(32, 29, 201, 192),
                        //Color.fromARGB(255, 125, 221, 216),
                        Color.fromRGBO(32, 38, 57, 1),
                        Color.fromRGBO(63, 76, 119, 1)
                      ],
                      stops: [0.5, 1.0],
                    ),
                  ),
                  child: Center(
                    child: Text("Sign in",
                      style: TextStyle(
                        fontSize:36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                      ),),
                  ),
                ),
              ),
              SizedBox(height: w*0.15,),
              RichText(text: TextSpan(
                  text: "Don't have an aacount?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  children:  [
                    TextSpan(

                      text: " Create",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>const SignUpPage()),
                    ),
                  ]
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController=TextEditingController();
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    final AuthService authService=AuthService();
    List images =[
      "g.png",
      "t.png",
      "f.png",
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    void signUpUser(){
      String email=emailController.text;
      String name=nameController.text;
      String password=passwordController.text;
      BuildContext buildContext;
      if(name.isEmpty){
        showSnackBar(context,"please enter a valid name");
      }else if(email.isEmpty){
        showSnackBar(context,"pleave enter a valid email");
      }else if(password.isEmpty){
        showSnackBar(context,"please enter a valid password");
      }else{
        authService.signUpUser(context: context, email: emailController.text, password: passwordController.text, name:nameController.text);
      }
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                height:h*0.24 ,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/img/bg.png"
                        ),fit: BoxFit.cover
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: h*0.09,),
                    Row(
                      children: [
                        SizedBox(width: 200,),
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          radius: 60,
                          backgroundImage: AssetImage(
                              "assets/img/profile.jpg"
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: w,
                margin:EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1,1),
                              color: Colors.grey.withOpacity(0.2),
                            )
                          ]
                      ),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.person,color: Colors.blueGrey.shade800,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:BorderSide (
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1,1),
                              color: Colors.grey.withOpacity(0.2),
                            )
                          ]
                      ),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email,color: Colors.blueGrey.shade800,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:BorderSide (
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1,1),
                              color: Colors.grey.withOpacity(0.2),
                            )
                          ]
                      ),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password,color: Colors.blueGrey.shade800,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:BorderSide (
                                  color: Colors.white,
                                  width: 1.0,
                                )
                            )
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  signUpUser();
                },
                child: Container(
                  width: w*0.5,
                  height:h*0.08  ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        //Color.fromARGB(32, 29, 201, 192),
                        //Color.fromARGB(255, 125, 221, 216),
                        Color.fromRGBO(32, 38, 57, 1),
                        Color.fromRGBO(63, 76, 119, 1)
                      ],
                      stops: [0.5, 1.0],
                    ),
                  ),
                  child: Center(
                    child: Text("Sign up",
                      style: TextStyle(
                        fontSize:36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                      ),),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              RichText(text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Have an account?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                  )
              )),
              SizedBox(height: w*0.10,),
              RichText(text: TextSpan(
                text: "Sign up using one of the following methods",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              ),
              ),
              Wrap(
                children:List<Widget>.generate(
                    images.length,
                        (index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:AssetImage("assets/img/"+images[index]) ,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}