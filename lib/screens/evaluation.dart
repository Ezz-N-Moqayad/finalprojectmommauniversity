import 'package:flutter/material.dart';

class Evaluation extends StatefulWidget {
  const Evaluation({Key? key}) : super(key: key);

  @override
  State<Evaluation> createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '        How was your order \n experiences from it Momma?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star,
                    color: Colors.indigoAccent,
                  )),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star,
                    color: Colors.indigoAccent,
                  )),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star,
                    color: Colors.indigoAccent,
                  )),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star,
                    color: Colors.indigoAccent,
                  )),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: ElevatedButton(
              // ignore: sort_child_properties_last
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 60),
                primary: const Color(0xff6A90F2),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Not now! May be later',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
