import 'package:demo_bloc/test2/bloc/form_bloc.dart';
import 'package:demo_bloc/test2/test2_form.dart';
import 'package:flutter/material.dart';


class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  FormBloc formBloc;
  final emailController = TextEditingController();
  final passwordContrller = TextEditingController();


  @override
  void dispose() {
    formBloc.close();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    formBloc = FormBloc();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: FlutterLogo(
                  size: 100,
                )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Test2Form(formBloc),
          ],
        ),
      ),
    );
  }
}

