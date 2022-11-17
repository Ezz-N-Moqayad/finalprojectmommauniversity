import 'package:flutter/material.dart';
import '../../firebase/fb_auth_controller.dart';
import '../../model/fb_response.dart';
import '../utils/helpers.dart';

// ignore: camel_case_types
class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

// ignore: camel_case_types
class _Sign_UpState extends State<Sign_Up> with Helpers {
  // late TextEditingController _fullNameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  // ignore: non_constant_identifier_names
  late TextEditingController _UserNameContoller;
  late TextEditingController _phone;
  late TextEditingController _lastname;

  @override
  void initState() {
    super.initState();
    // _fullNameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _lastname = TextEditingController();
    _phone = TextEditingController();
    _UserNameContoller = TextEditingController();
  }

  @override
  void dispose() {
    // _fullNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _phone.dispose();
    _UserNameContoller.dispose();
    _lastname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                    color: Color(0xff23203F),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(start: 33),
                child: Text(
                  'Create an account',
                  style: TextStyle(
                    color: Color(0xff9391A4),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 30, end: 30),
                child: TextField(
                  controller: _UserNameContoller,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabled: true,
                    hintText: 'user name ',
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
                    // focusColor: Colors.red,
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
                      Icons.person,
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
                  controller: _lastname,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabled: true,
                    hintText: 'Last name ',
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
                    // focusColor: Colors.red,
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
                      Icons.person,
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
                  controller: _emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  // obscuringCharacter: '*',
                  // obscureText: true,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabled: true,
                    hintText: 'Email  ',
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
                    // focusColor: Colors.red,
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
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  // obscuringCharacter: '*',
                  // obscureText: true,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabled: true,
                    hintText: 'phone  ',
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
                    // focusColor: Colors.red,
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
                      Icons.phone,
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
                    // focusColor: Colors.red,
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
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Color(0xff5D5D5D),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff5D5D5D),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 35, end: 35),
                child: ElevatedButton(
                  onPressed: () async => await _performRegister(),
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
                    'Already have an account? ',
                    style: TextStyle(
                      color: Color(0xff9391A4),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xff23203F),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performRegister() async {
    if (checkData()) {
      await _register();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _phone.text.isNotEmpty &&
        _UserNameContoller.text.isNotEmpty &&
        _lastname.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    FbResponse fbResponse = await FbAuthController().CreateAccount(
        email: _emailTextController.text,
        password: _passwordTextController.text);
    // ignore: use_build_context_synchronously
    showSnackBar(context,
        message: fbResponse.message, error: !fbResponse.states);
    if (fbResponse.states) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }
}
