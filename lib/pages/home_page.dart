import 'package:donuts_shop/pages/login_page.dart';
import 'package:donuts_shop/pages/test.dart';
import 'package:donuts_shop/tab/burger_tab.dart';
import 'package:donuts_shop/tab/donut_tab.dart';
import 'package:donuts_shop/tab/pancake_tab.dart';
import 'package:donuts_shop/tab/pizza_tab.dart';
import 'package:donuts_shop/tab/smoothie_tab.dart';
import 'package:donuts_shop/util/my_tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTab = const [
    // Donut Tab
    MyTab(
      iconPath: 'lib/icons/donut.png',
    ),
    // burger tab
    MyTab(
      iconPath: 'lib/icons/burger.png',
    ),
    // smoothie tab
    MyTab(
      iconPath: 'lib/icons/smoothie.png',
    ),
    // pancake tab
    MyTab(
      iconPath: 'lib/icons/pancakes.png',
    ),
    // pizza tab
    MyTab(
      iconPath: 'lib/icons/pizza.png',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
                size: 36.0,
              ),
              onPressed: () {
                // open drawer
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 25.0),
        //       child: IconButton(
        //         icon: Icon(
        //           Icons.person,
        //           color: Colors.grey[800],
        //           size: 36.0,
        //         ),
        //         onPressed: () {
        //           // Action Button pressed
        //         },
        //       ),
        //     )
        //   ],
        // ),
        drawer: Drawer(
          backgroundColor: Colors.pink[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //Logo
                  DrawerHeader(
                    child: ListTile(
                      leading: Image.asset('lib/images/icecream_donut.png',
                          width: 100.0),
                    ),
                  ),
                  // const Divider(
                  //   height: 20.0, // Adjust the height of the divider
                  //   thickness: 2.0, // Adjust the thickness of the divider
                  //   color: Colors.red, // Adjust the color of the divider
                  // ),
                  //Other pages
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: IconButton(
                        icon: const Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                      ),
                      title: GestureDetector(
                        child: const Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: IconButton(
                        icon: const Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Test()),
                          );
                        },
                      ),
                      title: GestureDetector(
                        child: const Text(
                          'About',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Test()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 25.0),
                child: ListTile(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogIn()),
                      );
                    },
                  ),
                  title: GestureDetector(
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogIn()),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),

        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 18.0),
              child: Row(
                children: [
                  Text(
                    'I want to Eat ',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    'EAT',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 24.0,
            ),

            // Tab Bar
            TabBar(tabs: myTab),

            // tab bar view
            Expanded(
                child: TabBarView(
              children: [
                // donut page
                DonutTab(),
                // burger page
                const BurgerTab(),
                // smoothie page
                SmoothieTab(),
                // pancake page
                const PancakeTab(),
                // pizza page
                const PizzaTab(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
