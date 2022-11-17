import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalprojectmommauniversity/screens/view.dart';
import 'package:flutter/material.dart';
import '../firebase/fb_auth_controller.dart';
import '../model/product.dart';
import '../utils/helpers.dart';
import 'add_product.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView>
    with SingleTickerProviderStateMixin, Helpers {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6A90F2),
        bottom: TabBar(
          labelColor: Colors.white,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          indicatorColor: Colors.white,
          indicatorWeight: 2,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          controller: _tabController,
          onTap: (int index) {
            setState(() {
              _tabController.index = index;
            });
          },
          tabs: const [
            Tab(
              text: 'View product',
            ),
            Tab(
              text: 'Cart product',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              // arrowColor: Color(0xff6A90F2),
              decoration: BoxDecoration(
                color: Color(0xff6A90F2),
              ),
              accountName: Text('khalil'),
              accountEmail: Text('khalilEmadothoht@gmail.com'),
              currentAccountPicture: CircleAvatar(
                  // child: Image.asset('images/'),
                  ),
              currentAccountPictureSize: Size(80, 80),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Color(0xff4267B2),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff4267B2),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff4267B2),
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/TabView');
              },
              leading: const Icon(
                Icons.home,
                color: Color(0xff5D5D5D),
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Color(0xff87879D),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Profial');
              },
              leading: const Icon(
                Icons.person,
                color: Color(0xff5D5D5D),
              ),
              title: const Text(
                'My Profile',
                style: TextStyle(
                  color: Color(0xff87879D),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Settings');
              },
              leading: const Icon(
                Icons.settings,
                color: Color(0xff5D5D5D),
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xff87879D),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Profial');
              },
              leading: const Icon(
                Icons.account_box_outlined,
                color: Color(0xff5D5D5D),
              ),
              title: const Text(
                'About',
                style: TextStyle(
                  color: Color(0xff87879D),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProduct(),
                  ),
                );
              },
              leading: const Icon(
                Icons.note_add_outlined,
                color: Color(0xff5D5D5D),
              ),
              title: const Text(
                'Add Product',
                style: TextStyle(
                  color: Color(0xff87879D),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              onTap: () async {
                await FbAuthController().Singout();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, '/SingIN');
              },
              leading: const Icon(
                Icons.logout,
                color: Color(0xff5D5D5D),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xff87879D),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          View(),
          AddProduct(),
        ],
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
}
