import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../firebase/fb_fire_store_controller.dart';
import '../model/product.dart';
import '../utils/helpers.dart';
import '../widget/page_view_home.dart';
import 'add_product.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> with Helpers {
  late PageController _pageController;
  int _cuurentpage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int page) {
                  setState(() {
                    _cuurentpage = page;
                  });
                },
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const page_view_home(
                    image: 'images/imagepageview1.png',
                  ),
                  const page_view_home(
                    image: 'images/imagepageview1.png',
                  ),
                  const page_view_home(
                    image: 'images/imagepageview1.png',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelectorIndicator(
                    backgroundColor:
                        _cuurentpage == 0 ? Colors.blue : Colors.grey,
                    borderColor: Colors.grey,
                    size: 10),
                TabPageSelectorIndicator(
                    backgroundColor:
                        _cuurentpage == 1 ? Colors.blue : Colors.grey,
                    borderColor: Colors.grey,
                    size: 10),
                TabPageSelectorIndicator(
                    backgroundColor:
                        _cuurentpage == 2 ? Colors.blue : Colors.grey,
                    borderColor: Colors.grey,
                    size: 10),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            StreamBuilder<QuerySnapshot<Product>>(
                stream: FbFireStoreController().read(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 12, end: 12),
                        child: GridView.builder(
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 13,
                              mainAxisSpacing: 13,
                              childAspectRatio: 100 / 160,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 1),
                                    Image.asset(
                                      'images/im1.png',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 20),
                                      child: Text(
                                        snapshot.data!.docs[index].data().title,
                                        style: const TextStyle(
                                          color: Color(0xff474559),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 20, end: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]
                                                .data()
                                                .price,
                                            style: const TextStyle(
                                              color: Color(0xff9E9DB0),
                                              fontSize: 15,
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () async {
                                                _deleteProduct(snapshot
                                                    .data!.docs[index].id);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Color(0xffDD2828),
                                              )),
                                          IconButton(
                                            onPressed: () async {
                                              navigateToUpdateNoteScreen(
                                                  snapshot, index);
                                            },
                                            icon: Image.asset(
                                                'images/update.png'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("NO DATA"),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  void navigateToUpdateNoteScreen(
      AsyncSnapshot<QuerySnapshot<Product>> snapshot, int index) {
    QueryDocumentSnapshot<Product> noteSnapshot = snapshot.data!.docs[index];
    Product product = noteSnapshot.data();
    product.id = noteSnapshot.id;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProduct(
          product: product,
        ),
      ),
    );
  }

  Future<void> _deleteProduct(String id) async {
    bool deleted = await FbFireStoreController().delete(path: id);
    String message =
        deleted ? 'Note deleted successfully' : 'Note delete failed!';
    // ignore: use_build_context_synchronously
    showSnackBar(context, message: message, error: !deleted);
  }
}
