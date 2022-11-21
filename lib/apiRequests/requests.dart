import 'package:dorcashub/general/allExports.dart';
import 'package:dio/dio.dart';

String _clientSecret = "vM0Waw8Zm3TbVNYbYkQ9aoRbzwEcFAPR3EaINF6g";
int _clientId = 1;

String getBaseUrl () {
  return 'https://core-portal.edcmarketplace.com.ng';
}


//
class ApiRequests{


  Function registerUser = (User user, String password) async {

    try {

      print('started request');

      var response = await Dio().post(

          getBaseUrl() + "/register",
          options: Options(contentType: Headers.jsonContentType),
          data: {"firstname": user.firstName, "lastname": user.lastName, "email": user.email, "password": password, "company": user.company.name, "phone": user.phoneNumber.toString(), "client_id": _clientId, "client_secret": _clientSecret, "feature_select": "all" }

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return true;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }



  };


  Function authorizeViaPassword = (String email, String password) async {

    try {

      print('started request');

      var response = await Dio().post(

          getBaseUrl() + "/oauth/token",
          options: Options(contentType: Headers.formUrlEncodedContentType),

          data: {"grant_type": "password", "username": email, "password": password, "client_id": _clientId, "client_secret": _clientSecret, "scope": "*" }

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }



  };



  Function retrieveCompanyData = () async {

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/company/status",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };
  Function updateProfile = ( ) async {

    try {

      print('started request');

      var response = await Dio().put(

        getBaseUrl() + "/customers",
        options: Options(
          headers: {
            'Authorization': 'Bearer $userAccessToken',
          },
          contentType: Headers.jsonContentType,
          validateStatus: (status) => true,
        ),

        data: { },


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  };


  Function retrieveUserData = () async {

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function addCustomer = (Customer customer) async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(

        getBaseUrl() + "/customers",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),

        data: {"firstname": customer.firstName, "lastname": customer.lastName, "phone": customer.phoneNumber, "email": customer.email},

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  };

  Function listCustomers = () async {

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/customers",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Function editCustomer = (Customer customer) async {

    try {

      print('started request');

      var response = await Dio().put(

          getBaseUrl() + "/customers/${customer.customerId}",
          options: Options(
            headers: {
              'Authorization': 'Bearer $userAccessToken',
            },
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ),

        data: {"firstname": customer.firstName, "lastname": customer.lastName, "phone": customer.phoneNumber, "email": customer.email},


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }

  };


  Function deleteCustomer = (String customerId) async {

    try {

      print('started request');

      var response = await Dio().delete(

        getBaseUrl() + "/customers/$customerId",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };




  Function addProduct = (Product product) async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";


      var response = await Dio().post(

          getBaseUrl() + "/products",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }),

          data: {"name": product.name, "description": product.description, "inventory": product.stockAmount, "prices": [{"price": product.unitPrice, "currency": product.currency}]}

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };




  Function deleteProduct = (String productID) async {

    try {

      print('started request');

      var response = await Dio().delete(

        getBaseUrl() + "/products/$productID",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),

      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function listProducts = () async {

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/products",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function createOrder = (Order order) async {

    try {

      print('started request');

      var response = await Dio().post(

          getBaseUrl() + "/orders",
          options: Options(headers: {
            'Authorization': 'Bearer $userAccessToken',
          }),

          data: {"title": order.invoiceTitle, "description": order.invoiceDescription, "currency": order.currency, "products":[{"id":order.product.productId, "quantity": order.amountOrdered}], "customers": ["sa"]}


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function listOrders = () async {

    try {

      print('started request');

      var response = await Dio().get(

        getBaseUrl() + "/orders",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function editOrder = (Order order) async {

    try {

      print('started request');

      var response = await Dio().put(

          getBaseUrl() + "/orders/${order.invoiceId}",
          options: Options(
            headers: {
              'Authorization': 'Bearer $userAccessToken',
            },
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ),

          data: {"title": order.invoiceTitle, "description": order.invoiceDescription, "currency": order.currency, "products":[{"id":order.product.productId, "quantity": order.amountOrdered}], "customers": ["123R"]}//order.customer.id


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };


  Function deleteOrder = (String orderId) async {

    try {

      print('started request');

      var response = await Dio().delete(

        getBaseUrl() + "/orders/$orderId",
        options: Options(headers: {
          'Authorization': 'Bearer $userAccessToken',
        }),


      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}'); //length of this is the customer count

      return response.data;

    } catch (e) {
      print('error');
      print(e);
      return false;
    }


  };

  Function createScan = (String product_id,
      String barcode,
      String quantity,
      String action,

      ) async {
    try {
      print('started request');
      final token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(
          getBaseUrl() + "/product/scan",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
        data: {"barcode": barcode, "product_id": product_id, "quantity" : quantity, "action":action },
      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.data}');
      return response.data;
    } catch (e) {
      print('error');
      print(e);
      return false;
    }
  };

  Future createHub(

      {String slug,

      })
  async {

    try {

      print('started request');
      final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmIwZDM4NTAwZTMzZGNhNTQzY2QzN2JjZDg0YjQ3MTE1YzkwZGJjNWUzZWFmNzU0NTJiNzQ2NDE3N2JkNjkwOTcyYzNjYTFhNzU3MWM5NzgiLCJpYXQiOjE2NjYwOTM2NzAuMDQ0Mjk0LCJuYmYiOjE2NjYwOTM2NzAuMDQ0Mjk2LCJleHAiOjE2OTc2Mjk2NzAuMDA0ODA1LCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.xmPJamqquGMMulv5UAfZdhjAtJTkv1L9hC44QnFZR-wGUG2T103iM5izWP-kDd9GMa644NOify5w-h4upZDWM0h_Xs_hTDmHTZuG2IogyEwMqP_wMWCaVC8FpZSxrYAebWIOJy8Bzln4CtznbNEparTbAQrwvykBc8y_yde4J7jC_Py_18l5xElejbhU-ZgBsMFa9HsYkajvR9plylrreLkQPxRtY0c7IsefoNppsDe0HVd4Zaio3nTrFACM40DCGJzJxVPx9PLW6L-pKwfTn-h8lw4vFhmord4wU0zQRAWzjTq6TjbX6koIFC1X6Ex0HMjVCdLAOoujOOzDipjZz9GjTaVu6iVHdKnPuNl45xsG3g3hDTYb3VY9yy2Sbpt8kgosha7RstE2Q8dfHaXLTxatR1Qwr_qZp-7N3SChmNvO8jFGpC0vfdAkFmdb9_JGMUlBKwIUWwK1Ob-MpexM_bOv5A1PM7Go3SPik2Hl48D21CG-q4HgrDBUf8EeJcoclwv4RjTGXOskAF_cIyOhqZd-Or_RHgue2vEDBi0DPY1pPAICLNhbxuqvBKXDoWU1odKCrA6qTJ6K8qLIOFQAR13xTRT0KKuT1oJzyBUx5GIPUtw1U5_l0SoF47fZPDhppkcConSL2v8HGFs7Zlu5ZSOZE6ci72IXIcrJA53QAmM";

      var response = await Dio().post(
        "https://bridge.dorcas.io/partner",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            "Accept": "application/json",
            "content-type":"application/json"
          }),

          data: {"slug": slug}
      );

      print('Response status: ${response.statusCode}');
      print('Response status: ${response.statusMessage}');
      print('Response status: ${response.data}'); //length of this is the department count

      return response.data;

    } catch (e) {
      print('error');
      print(e.toString());
      return false;
    }


  }


}





