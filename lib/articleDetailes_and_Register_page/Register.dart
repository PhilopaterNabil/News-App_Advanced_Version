import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey= GlobalKey<FormState>();

  bool isNotVisible =true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(left: 8.0,right: 8.0,bottom: MediaQuery.viewInsetsOf(context).bottom),
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      alignment: Alignment.center,
                    icon: Center(child: Icon(Icons.cancel_outlined,color: Colors.white,fill: 1.0,size: 40.0,)),
                    ),
                  ),
                  
                  SizedBox(height: 10,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.white,
                        height: 50,
                        width: 50,
                        child: const Text('B',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black),)),
                    Container(
                        color: Colors.white,
                        height: 50,
                        width: 50,
                        child:const Text('B',textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)),
                    Container(
                        color: Colors.white,
                        height: 50,
                        width: 50,
                        child:const Text('C',textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)),
                  ],
                ),
                SizedBox(height: 10,),
                Text('Register for a BBC account',style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('''You must be 16 or over to register for a BBC
                            account''',style: TextStyle(color:Colors.white,fontSize: 18),),
                  SizedBox(height: 10,),

                  TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "please, Enter your Full name";
                      }
                      else null;

                    },
                    keyboardType: TextInputType.datetime,
                    // keyboardAppearance: Brightness.light,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelText: 'Full name',
                    labelStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10.0),),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff4A249D),width: 2.0),
                  )),


                ),
                  SizedBox(height: 10,),

                  TextFormField(

                    validator: ( value){
                      if(value == null || value.isEmpty){
                        return "please, Enter your Email";
                      }
                      else null;
                    },
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelText: 'Email',

                    labelStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4A249D),width: 2.0),
                        )),

                  ),
                  SizedBox(height: 10,),

                  TextFormField(
                    validator: ( value){
                      if(value == null || value.isEmpty){
                        return "please, Enter your Full name";
                      }
                      if (value.length < 6){
                        return "please, should be at least 6 char";
                      }
                      else null;
                    },
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  textInputAction: TextInputAction.search,
                  obscureText:isNotVisible,

                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                    suffixIcon: IconButton(onPressed: (){
                      ChangePasswordVisiable(!isNotVisible);
                      setState(() {

                      });
                    },
                    icon: Icon(Icons.visibility),),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4A249D),width: 2.0),
                      )
                  ),
                ),
                const  SizedBox(height: 10,),

                  TextFormField(
                    validator: ( value){
                      if(value == null || value.isEmpty){
                        return "please, Enter your Full name";
                      }
                      if (value.length < 12){
                        return "please, should be at least 12 char";
                      }
                      else null;
                    },
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4A249D),width: 2.0),
                      )
                  ),
                ),
                  SizedBox(height: 20,),

                  GestureDetector(
                    onTap: (){
                      if(formkey.currentState!.validate()){
                        // Navigator.pushNamed(context, routeName);
                      }
                    },
                    child: Container(
                      height:65,
                      width: double.infinity,
                      color: Colors.blue,
                      child: Center(child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  Row(
                    children: [
                      Text('Already have a BBC account?',style: TextStyle(color: Colors.white,fontSize: 20),),
                      TextButton(onPressed:(){}, child:  Text('Sign in now',style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16
                      ),),),
                    ],
                  )

              ],),
            ),),
          ),
      ),

    );

  }
  void ChangePasswordVisiable(bool visible){
    if(isNotVisible== visible){
      return;
    }else
      isNotVisible=visible;

  }
}

