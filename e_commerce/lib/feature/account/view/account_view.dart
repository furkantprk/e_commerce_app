import 'package:e_commerce/feature/account/widget/account_menu_item.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final List<Map<String, dynamic>> accountMenuItems = [
    {
      AppString.icon: Icons.delivery_dining,
      AppString.text: AppString.orders,
      AppString.onTap: () {}
    },
    {
      AppString.icon: Icons.perm_identity,
      AppString.text: AppString.myDetails,
      AppString.onTap: () {}
    },
    {
      AppString.icon: Icons.location_on,
      AppString.text: AppString.deliveryAdress,
      AppString.onTap: () {}
    },
    {
      AppString.icon: Icons.credit_card_outlined,
      AppString.text: AppString.paymenMethods,
      AppString.onTap: () {}
    },
    {
      AppString.icon: Icons.discount,
      AppString.text: AppString.promoCode,
      AppString.onTap: () {}
    },
    {
      AppString.icon: Icons.notification_add,
      AppString.text: AppString.notifications,
      AppString.onTap: () {}
    },
    {
      AppString.icon: Icons.help_outline,
      AppString.text: AppString.help,
      AppString.onTap: () {}
    },
    {
      AppString.icon: Icons.warning_rounded,
      AppString.text: AppString.about,
      AppString.onTap: () {}
    },
  ];

  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper.initialize(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: ScreenSizeHelper.screenHeight * 0.04,
                left: ScreenSizeHelper.screenHeight * 0.05,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: ScreenSizeHelper.screenWidth * 0.1,
                    backgroundImage: AssetImage(AppString.profilePhoto),
                  ),
                  SizedBox(width: ScreenSizeHelper.screenWidth * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.furkantprk,
                        style: TextStyle(
                          fontSize: ScreenSizeHelper.screenHeight * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppString.mail,
                        style: TextStyle(
                          fontSize: ScreenSizeHelper.screenHeight * 0.025,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: accountMenuItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    AccountMenuItem(
                      icon: accountMenuItems[index][AppString.icon],
                      text: accountMenuItems[index][AppString.text],
                      onTap: accountMenuItems[index][AppString.onTap],
                    ),
                    if (index < accountMenuItems.length - 1)
                      Divider(thickness: 1, color: Colors.grey),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSizeHelper.screenWidth * 0.1,
                vertical: ScreenSizeHelper.screenHeight * 0.02,
              ),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.logout, color: AppColor.mainColor),
                  label: Text(AppString.logOut,
                      style: TextStyle(color: AppColor.mainColor)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.grey.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
