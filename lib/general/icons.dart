import 'package:ionicons/ionicons.dart';

import 'allExports.dart';

class CommonSvgIconModel {//model for svg icons of theHub
  final String assetPath;
  final String label;
  final IconData placeHolder;

  CommonSvgIconModel(this.assetPath, this.label, this.placeHolder);
}

class AppIcons {
  
  //home bottom navBar
  var home = CommonSvgIconModel('assets/icons/home.svg', 'Home', Icons.home);
  var orders = CommonSvgIconModel('assets/icons/checklist.svg', 'Orders', Icons.list_rounded);
  var products = CommonSvgIconModel('assets/icons/price-tag.svg', 'Products', Ionicons.pricetag_outline);
  var store = CommonSvgIconModel('assets/icons/store.svg', 'Hub Space', Icons.store);

  //tip icons
  var customer = CommonSvgIconModel('assets/icons/customer.svg', 'Customer', Ionicons.person_add_outline);
  var tag = CommonSvgIconModel('assets/icons/sale-tag.svg', 'Tag', Ionicons.pricetags_outline);
  var verification = CommonSvgIconModel('assets/icons/verification.svg', 'Mail Verification', Ionicons.mail);


  //main onboard icons
  var target = CommonSvgIconModel('assets/icons/target.svg', 'Target', Ionicons.pricetags_outline);
  var megaphone = CommonSvgIconModel('assets/icons/megaphone.svg', 'Megaphone', Ionicons.pricetags_outline);
  var business = CommonSvgIconModel('assets/icons/business.svg', 'Business', Ionicons.pricetags_outline);
  var marketing = CommonSvgIconModel('assets/icons/marketing.svg', 'Marketing', Ionicons.pricetags_outline);
  var level = CommonSvgIconModel('assets/icons/level.svg', 'Level', Ionicons.pricetags_outline);

  //
  var box = CommonSvgIconModel('assets/icons/box.svg', 'Box', Ionicons.gift_outline);
  var tag2 = CommonSvgIconModel('assets/icons/tag.svg', 'Tag', Ionicons.pricetags_outline);
  var automation = CommonSvgIconModel('assets/icons/automation.svg', 'Machine', Ionicons.car_outline);
  var internet = CommonSvgIconModel('assets/icons/internet.svg', 'Internet', Ionicons.globe_outline);

}