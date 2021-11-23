import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  decoration: const InputDecoration(
                    hintText: 'Mobile Number'
                  ),
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Password'
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){},
                        child: const Text('Login')),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
