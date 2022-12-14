import 'package:flutter/material.dart';
import '../../firebase/fb_auth_controller.dart';
import '../../model/fb_response.dart';
import '../utils/helpers.dart';

class SingIN extends StatefulWidget {
  const SingIN({Key? key}) : super(key: key);

  @override
  State<SingIN> createState() => _SingINState();
}

class _SingINState extends State<SingIN> with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.only(start: 33),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Color(0xff23203F),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(start: 33, bottom: 10),
                  child: Text(
                    'Login to continue your account,',
                    style: TextStyle(
                      color: Color(0xff716F87),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 30, end: 30),
                  child: TextField(
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabled: true,
                      hintText: 'Email ',
                      filled: true,
                      fillColor: const Color(0xffFFFFFF),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                        maxHeight: 60,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff6A90F2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xff5D5D5D),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 30, end: 30),
                  child: TextField(
                    controller: _passwordTextController,
                    keyboardType: TextInputType.visiblePassword,
                    obscuringCharacter: '*',
                    obscureText: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabled: true,
                      hintText: 'Password  ',
                      filled: true,
                      fillColor: const Color(0xffFFFFFF),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                        maxHeight: 60,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff6A90F2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xff5D5D5D),
                      ),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                        color: Color(0xff5D5D5D),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/ForgetPasswordScreen'),
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 35, end: 35),
                  child: ElevatedButton(
                    onPressed: () async => await _performLogin(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(328, 60),
                      primary: const Color(0xff6A90F2),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 35, end: 35),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    //icon data for elevated button
                    label: const Padding(
                      padding: EdgeInsetsDirectional.only(start: 10),
                      child: Text(
                        "Login with facebook",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(328, 60),
                      primary: const Color(0xff4267B2),
                    ), //label text
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don???t have an account?',
                      style: TextStyle(
                        color: Color(0xff9391A4),
                      ),
                    ),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/Sign_Up'),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Color(0xff23203F),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _performLogin() async {
    if (checkData()) {
      await _login();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _login() async {
    FbResponse fbResponse = await FbAuthController().SignIn(
        email: _emailTextController.text,
        password: _passwordTextController.text);
    // ignore: use_build_context_synchronously
    showSnackBar(context,
        message: fbResponse.message, error: !fbResponse.states);
    if (fbResponse.states) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/TabView');
    }
  }
}
