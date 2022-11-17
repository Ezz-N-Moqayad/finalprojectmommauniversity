import 'package:flutter/material.dart';
import '../../firebase/fb_auth_controller.dart';
import '../../model/fb_response.dart';
import '../../utils/helpers.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with Helpers {
  late TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(
            height: 150,
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 5),
            child: Text(
              'Forget Password ?',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 5),
            child: Text(
              'Enter email to receive reset code!',
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w300,
                height: 1,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 50),
          TextField(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue.shade300,
                    width: 0.8,
                  ),
                )),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff6A90F2),
              minimumSize: const Size(0, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async => await _performForgetPassword(),
            child: const Text('SEND'),
          ),
        ],
      ),
    );
  }

  Future<void> _performForgetPassword() async {
    if (checkData()) {
      await _forgetPassword();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _forgetPassword() async {
    FbResponse fbResponse = await FbAuthController()
        .forgetPassword(email: _emailTextController.text);
    // ignore: use_build_context_synchronously
    showSnackBar(context,
        message: fbResponse.message, error: !fbResponse.states);
    // ignore: use_build_context_synchronously
    if (fbResponse.states) Navigator.pop(context);
  }
}
