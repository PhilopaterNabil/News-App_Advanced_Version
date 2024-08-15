import 'package:flutter/material.dart';

class ArticleDetailes extends StatelessWidget {
  const ArticleDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0,top: 16.0,right: 10.0,bottom: 10.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                const Text( '//title',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                
                const  SizedBox(height: 10,),
               
               const Text('//dateTime  ',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff686D76),
                ),),
                const  SizedBox(height: 10,),
                const Text('//auther ',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                const  SizedBox(height: 20,),
                Image.asset('image',
                  width: MediaQuery.sizeOf(context).width,
                  height: 250,
                  fit: BoxFit.fill,
                ),
                const  SizedBox(height: 8,),
               const Text('sub tiltle ',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff686D76),
                ),),
                const  SizedBox(height: 20,),
               const Text('source',style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),

              ],),
          ),
        ),
      ),
    );
  }
}



