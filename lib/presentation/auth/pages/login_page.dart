import 'package:flutter/material.dart';

import '../../../core/components/custom_text_field.dart';
import '../../../core/constants/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Log in'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          CustomTextField(
            controller: emailController,
            label: 'Email Address',
          ),
          const SizedBox(height: 16.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 42.0),
          // BlocConsumer<LoginBloc, LoginState>(
          //   listener: (context, state) {
          //     state.maybeWhen(
          //         orElse: () {},
          //         success: (data) {
          //           //simpan data ke local storage
          //           AuthLocalDatasource().saveAuthData(data);
          //           //snackbar
          //           ScaffoldMessenger.of(context).showSnackBar(
          //             const SnackBar(
          //               content: Text(
          //                 'Login success',
          //                 style: TextStyle(color: Colors.black),
          //               ),
          //               backgroundColor: AppColors.lightGreen,
          //             ),
          //           );
          //           context.pushReplacement(const DashboardPage());
          //         },
          //         error: (message) {
          //           ScaffoldMessenger.of(context).showSnackBar(
          //             SnackBar(
          //               content: Text(message,
          //                   style: const TextStyle(color: Colors.black)),
          //               backgroundColor: AppColors.lightRed,
          //             ),
          //           );
          //         });
          //   },
          //   builder: (context, state) {
          //     return state.maybeWhen(
          //         orElse: () => Button.filled(
          //               onPressed: () {
          //                 // context.pushReplacement(const DashboardPage());
          //                 final requestModel = LoginRequestModel(
          //                     email: emailController.text,
          //                     password: passwordController.text);
          //                 context
          //                     .read<LoginBloc>()
          //                     .add(LoginEvent.login(requestModel));
          //               },
          //               label: 'LOG IN',
          //             ),
          //         loading: () => const Center(
          //               child: CircularProgressIndicator(),
          //             ));
          //   },
          // ),
          const SizedBox(height: 24.0),
          GestureDetector(
            onTap: () {
              // context.pushReplacement(const RegisterPage());
            },
            child: const Text.rich(
              TextSpan(
                text: 'Don\'t have an account? ',
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
