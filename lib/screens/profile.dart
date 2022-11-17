import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6A90F2),
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/TabView');
              },
              icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          const CircleAvatar(
            backgroundImage: ExactAssetImage('images/Bg.png'),
            radius: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'John Deo',
            style: TextStyle(color: Color(0xff444657), fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'johndeo@yourmail.com',
            style: TextStyle(color: Color(0xff87879D), fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 15),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Icon(
                              Icons.offline_pin,
                              color: Color(0xff6A90F2),
                            )),
                        const Spacer(),
                        const Text(
                          'البيانات',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 30, end: 30),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      enabled: false,
                      decoration: InputDecoration(
                        enabled: true,
                        labelText: 'khalil emad hothot',
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                        labelStyle: const TextStyle(
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
                          maxHeight: 50,
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
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 30, end: 30),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      enabled: false,
                      decoration: InputDecoration(
                        enabled: true,
                        labelText: 'hthtkhlyl24@gmail.com',
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        constraints: const BoxConstraints(
                          maxWidth: 400,
                          maxHeight: 50,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
