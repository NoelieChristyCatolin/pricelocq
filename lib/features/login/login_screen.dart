import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq/features/login/bloc/login_cubit.dart';
import 'package:pricelocq/features/login/bloc/login_state.dart';
import 'package:pricelocq/features/search_station/search_station_map_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('pricelocq', style: TextStyle(color: Colors.deepPurple, fontSize: 60, fontWeight: FontWeight.w900),),
                    const SizedBox(height: 100,),
                    TextFormField(
                      controller: mobileController,
                      decoration: const InputDecoration(
                          hintText: 'Mobile Number'
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          hintText: 'Password'
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () async {
                          context.read<LoginCubit>()
                              // .login(mobile: mobileController.text, password: passwordController.text)
                              .login(mobile: '09021234567', password: '123456')
                              .then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchStationMapScreen())));
                        },
                            child: const Text('Login')),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
