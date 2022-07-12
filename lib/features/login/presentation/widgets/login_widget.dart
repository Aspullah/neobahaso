import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:neobahaso/features/login/presentation/bloc/login_bloc.dart';
import 'package:neobahaso/features/login/presentation/models/models.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }else
        if(state.status.isSubmissionSuccess){
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Success'),backgroundColor: Colors.green,),
            );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage("assets/images/pandoo.gif"),width: 80, height: 80,),
            Padding(padding: EdgeInsets.all(5)),
            Text("bahaso"),
            Padding(padding: EdgeInsets.all(12)),
            _EmailInput(),
            Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: Key('loginForm_EmailInput_textField'),
          onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email)),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white70,
            hintText: "Email",
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: state.email.invalid
                  ? BorderSide(color: Colors.red, width: 2.0)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(50.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: state.email.invalid
                  ? BorderSide(color: Colors.red, width: 2.0)
                  : BorderSide(color: Colors.blue, width: 1.0),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(50.0),
            ),
            errorText:
                state.email.invalid ? _getErrorEmail(state.email.error) : null,
          ),
        );
      },
    );
  }

  String _getErrorEmail(EmailValidationError? err) {
    switch (err) {
      case EmailValidationError.empty:
        return "email can\'t be empty";
      case EmailValidationError.invalid:
        return "email invalid";
      default:
        return "";
    }
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white70,
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: state.password.invalid
                  ? BorderSide(color: Colors.red, width: 2.0)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(50.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: state.password.invalid
                  ? BorderSide(color: Colors.red, width: 2.0)
                  : BorderSide(color: Colors.blue, width: 1.0),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(50.0),
            ),
            errorText: state.password.invalid
                ? _getErrorPassword(state.password.error)
                : null,
          ),
        );
      },
    );
  }

  String _getErrorPassword(PasswordValidationError? err) {
    switch (err) {
      case PasswordValidationError.empty:
        return "password can\'t be empty";
      case PasswordValidationError.invalid:
        return "password invalid";
      default:
        return "";
    }
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_buttonLogin_raisedButton'),
                child: const Text('Login'),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 40),
                  primary: Colors.blue,
                  textStyle: const TextStyle(fontSize: 15),
                ),
              );
      },
    );
  }
}
