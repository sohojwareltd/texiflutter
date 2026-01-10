import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taxiflutter/color_Theme/color_theme.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/text_fields/input_Text_field.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff142541),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Center(child: Image.asset('assets/images/logo.png')),
                    const SizedBox(height: 24),
                    Text(
                      'It’s almost too easy',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Color(0xff60A5FA),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Registration is mandatory to access the \n\napp and process fares.',
                      style: TextStyle(
                        fontFamily: 'inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF5F7FA),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        minimumSize: Size.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Go to form',
                            style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 16,
                              color: Color(0xffF5F7FA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.asset('assets/images/icon.png'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        color: Color(0x803E1817),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xff9B2013), width: 1.2),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.error_outline, color: Colors.redAccent, size: 20),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Wrong email or password. Please try again.",
                              style: TextStyle(
                                color: Color(0xffF1948A),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                  ],

                ),
              ),
              Text(
                  'Driver email*',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.start
              ),
              const SizedBox(height: 8),
              InputTextField(
                hint: 'Type in your email..',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                enableBorderColor: Colors.blue,
                fillColor: Colors.white,
                focusedBorderColor: Colors.white,
              ),

              const SizedBox(height:20),
              Text(
                  'Password*',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.start
              ),
              const SizedBox(height: 8),
              InputTextField(
                hint: 'Type in your password..',
                keyboardType: TextInputType.visiblePassword,
                controller: emailController,
                enableBorderColor: ColorTheme.coreBlue,
                fillColor: ColorTheme.platinum,
                focusedBorderColor: ColorTheme.platinum,
              ),
              const SizedBox(height: 20),
              NormalButton(text: 'Login',
                  textColor: ColorTheme.platinum,
                  color: ColorTheme.coreBlue,
                  strokeColor: ColorTheme.coreBlue,
                  onPressed: (){
                context.push('/profile_menu');
                  },
                  strokeWidth: 0.0),

              const SizedBox(height: 20),
              Center(
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white70),
                    children: [
                      const TextSpan(text: 'By logging in, you agree to our '),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: '\n\n'),
                      TextSpan(
                        text: 'Forgot password?',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),

                      ),
                      const TextSpan(text: '  |  '),
                      TextSpan(
                        text: 'Try it as guest',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
