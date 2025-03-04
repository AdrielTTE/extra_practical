import 'package:flutter/material.dart';

import 'LoginForm.dart';

class WelcomePage extends StatelessWidget{
  String _name = '';

  WelcomePage(this._name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Login"),),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Image.asset("assets/images/tarumt-logo1.png"),
                Text('Welcome', style: TextStyle(color: Colors.blue, fontSize:30, fontWeight: FontWeight.bold),),
                Text(_name, style: TextStyle(fontSize:30, fontWeight: FontWeight.bold),),
                SizedBox(height:20),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Back'),),
              ]
          )


      ),
    );

  }

}