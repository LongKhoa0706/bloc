import 'package:demo_bloc/test2/bloc/form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test2Form extends StatefulWidget {
   FormBloc formBloc;
   Test2Form(this.formBloc);

  @override
  _Test2FormState createState() => _Test2FormState(formBloc);
}

class _Test2FormState extends State<Test2Form> {
   FormBloc formBloc = FormBloc();
  final emailController = TextEditingController();
  final passwordContrller = TextEditingController();


  _Test2FormState(this.formBloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc,FormStatee>(
      cubit: formBloc,
      builder: (context,state){
        if (state is FormStateError) {
            print('loi');
        }

        return   Form(
          child: Column(
            children: [
              buildTexFormField(),
              RaisedButton(
                onPressed: login,
                child: Text('LOGIN'),
              ),
            ],
          ),
        );
      },
    );
  }
  buildTexFormField(){
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              hintText: "1"
          ),
          controller: emailController,
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: "2"
          ),
          controller: passwordContrller,
        ),
      ],
    );
  }
  login() {
    formBloc.add(FormEventAuth(emailController.text, passwordContrller.text));
  }
}

