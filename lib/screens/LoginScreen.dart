// ignore_for_file: prefer_const_constructors
import 'package:econnect/screens/HomeScreen.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  
  
  bool isChecked = false;
  @override

  Widget build(BuildContext context) 
  
   {
    return Scaffold(
     
      body: Stack(
                
        //width: MediaQuery.of(context).size.width,
        //height: 300,
        //color: Colors.deepPurple[200],
        
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              color: Colors.deepPurple[200],
            ),
          ],
        ),
        

       
            Card( 

              elevation: 4.0,
                color: Colors.white,
                margin: EdgeInsets.only(left: 40, right: 40, top: 165, bottom: 160),       

                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [

                      Image.asset("lib/images/ceiba_logo_purple.42135689.png",
                      width: 150,
                      height: 140,
                      ),
                       

                      Title(color: Colors.black, 
                      child: ListTile(
                        
                        title: Text("Sign in",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w300),),),
                      ),
                     
                      
                      TextFormField(
                      
                        style: TextStyle(color: Color(0xFF000000)),
                        cursorColor: Color(0xFF9b9b9b),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                          
                          icon: Icon(Icons.person_sharp),
                          labelText: 'Type your username',
                          hintStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),

                       TextFormField(
      
                        style: TextStyle(color: Color(0xFF000000)),
                        cursorColor: Color(0xFF9b9b9b),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          
                          labelText: 'Type your password',
                          hintStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                    
                      ),
 

                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text("Remember me",
                          style: TextStyle(color: Colors.black , fontWeight:FontWeight.w400),),
                          SizedBox(width: 140),
                          Checkbox(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9.0))),
                            value: isChecked, onChanged: ((value) {
                            isChecked = !isChecked;
                            setState(() {
                              
                            });
                          }),
                          ),
                        ],
                        ),



                      Padding(padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 100,
                        height:45,
                        
                        decoration: BoxDecoration( 
                          color: Colors.deepPurple[600],
                        ),

                        child: TextButton(
                          onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage())); 
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 6, bottom: 6, left: 10, right: 10,
                            ), 
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      )
                    ],
                  ),
                ),
            ),
        
        ],
        ),
                 
      
      
   
     );    
              
  }
}
