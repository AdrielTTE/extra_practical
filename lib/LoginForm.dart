import 'package:flutter/material.dart';

import 'WelcomePage.dart';

class LoginForm extends StatelessWidget{

  List<Student> students = [Student('John', 'john', 'j123'), Student('Alex', 'alex', 'a123'), Student('Steven', 'steven', 's123')];

  final TextEditingController _userNameCtr = TextEditingController();
  final TextEditingController _passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Login"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Image.asset('assets/images/tarumt-logo1.png'),
            Text('Login', style: TextStyle(color: Colors.blue, fontSize:30, fontWeight: FontWeight.bold),),
            SizedBox(height:30),
            TextField(
              autofocus: true,
              controller: _userNameCtr,
              keyboardType: TextInputType.text, decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
            ),

            SizedBox(height:10),
        TextField(
          controller: _passwordCtr,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
        ),

        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:100),
            ElevatedButton(onPressed: (){
              Student? std = students.where((x)=>x.userName == _userNameCtr.text && x.password == _passwordCtr.text).firstOrNull;

              if(std!= null){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage(std.name)));
              }

              else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Username or password is invalid"),
                    backgroundColor:Colors.red ,
                    duration: Duration(seconds: 3),)
                );
              }

            }, child: Text('Login'),),
              SizedBox(width:20),
            ElevatedButton(onPressed: (){
              _userNameCtr.clear();
              _passwordCtr.clear();

              FocusScope.of(context).previousFocus();

            }, child: Text('Reset'),),
            ]

    )


      ]
      )


    ),
    );

  }

}

class Student{
  String name='';
  String userName='';
  String password='';

  Student(this.name, this.userName, this.password);

}

