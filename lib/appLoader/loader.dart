//this is the start of the app, where some basic logic will first go through before the user is taken into the main app
import 'package:dorcashub/jsonToModels/allCustomers.dart';
import 'package:dorcashub/jsonToModels/allOrders.dart';
import 'package:dorcashub/jsonToModels/allProducts.dart';
//import 'package:dorcashub/jsonToModels/company.dart';
import 'package:dorcashub/jsonToModels/user.dart';
import 'package:dorcashub/pages/authPages/parentAuth.dart';
import 'package:dorcashub/pages/navPages/products.dart';
//import 'package:dorcashub/pages/navPages/customers.dart';
//import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';
import 'package:dorcashub/general/allExports.dart';
//import 'package:flutter/material.dart';

import '../main.dart';

String userAccessToken;

User currentuser;

final _pages = [
  BottomNavIcons(
    'Home',
    Icons.home,
    HomePage(),
  ),
  // BottomNavIcons(
  //   'Customers',
  //   Ionicons.people_outline,
  //   Customers(),
  // ),
  BottomNavIcons(
    'Customers',
    Icons.person,
    Customers(),
  ),

  BottomNavIcons(
    'Orders',
    Icons.money,
    Sales(),
  ),

  BottomNavIcons(
    'Products',
    Icons.shopping_cart,
    ProdutsPage(),
  ),


  BottomNavIcons(
    'More',
    Icons.more,
    SettingsPage(),
  ),
  // BottomNavIcons(
  //   'More',
  //   Ionicons.list_outline,
  //   More(),
  // ),
];

DateTime taskDate = DateTime.now();

TextEditingController test = TextEditingController();

Function refreshAppLoader;

int selectedPageIndex = 0;

lauchApp() async {
  //functions that need to be run at the start of the app

  int expiresIn = authBox.get('accessTokenExpiresIn');
  String accessToken = authBox.get('accessToken');

  if (expiresIn != null && accessToken != null) {
    if (DateTime.now().add(Duration(days: 1)).microsecondsSinceEpoch >=
        expiresIn) {
      return 'unAuth';
    } else {
      userAccessToken = accessToken;

      await getDataOnAppStart(); //IMPORTANT

      return accessToken;
    }
  } else {
    return 'unAuth';
  }
}

class AppLoader extends StatefulWidget {
  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: lauchApp(), //IMPORTANT
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
              backgroundColor: AppColors().scaffoldColor,
              body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    CommonText(
                      text: 'Dorcas Hub',
                      size: 30,
                    ),
                  ])));
        } else {
          if (snapshot.data == 'unAuth') {
            return ParentAuth();
          } else {
            return MainApp();
          }
        }
      },
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    refreshAppLoader = () {
      setState(() {});
    };

    return Scaffold(
        backgroundColor: AppColors().scaffoldColor,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: _pages[selectedPageIndex].page,
        )),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedPageIndex,
            onTap: (int pageIndex) {
              selectedPageIndex = pageIndex;
              refreshAppLoader();
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: AppColors().textWhite,
            selectedLabelStyle: TextStyle(
              color: AppColors().mainColor,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'Sans',
              fontFamilyFallback: <String>[
                'Noto',
              ],
            ),
            unselectedLabelStyle: TextStyle(
              color: AppColors().darkGrey,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'Sans',
              fontFamilyFallback: <String>[
                'Noto',
              ],
            ),
            selectedItemColor: AppColors().mainColor,
            unselectedItemColor: AppColors().darkGrey,
            items: _pages.map((i) {
              return BottomNavigationBarItem(
                icon: Icon(i.pageIcon, color: AppColors().darkGrey, size: 23),
                activeIcon:
                    Icon(i.pageIcon, color: AppColors().mainColor, size: 23),
                label: i.pageName,
              );
            }).toList()));
  }
}

//function to be run on logout
logoutThisUser(BuildContext context) async{
  //clear out the accessToken and expiryData from hive
  await authBox.delete('accessTokenExpiresIn');
  await authBox.delete('accessToken');

  //clear other data
  currentuser = null;
  userAccessToken = null;
  allProducts = [];
  invoices = [];
  allCustomers = [];

  //push to login page

  return 'done';
}

//function to retrive all need able data on app start
getDataOnAppStart() async {
  //firstly clear past list data
  allProducts = [];
  invoices = [];
  allCustomers = [];

  //company data
  dynamic companyJsonData = await ApiRequests().retrieveCompanyData();

  //user data
  dynamic userJsonData = await ApiRequests().retrieveUserData();

  User userData = userJsonDataToUserModel(userJsonData, companyJsonData);

  currentuser = userData;

  //all products
  dynamic productsJsonData = await ApiRequests().listProducts();
  allProductsJsonDataToIndividualProductModel(productsJsonData);

  //all orders
  dynamic ordersJsonData = await ApiRequests().listOrders();
  allOrdersJsonDataToIndividualOrderModel(ordersJsonData);

  //all customers
  dynamic customersJsonData = await ApiRequests().listCustomers();
 allCustomersJsonDataToIndividualCustomerModel(customersJsonData);

  print('got here');

  return 'done';
}
