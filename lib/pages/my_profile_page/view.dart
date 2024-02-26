
import 'package:exchange/common/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/controller.dart';
import 'controller.dart';


class MyProfilePage extends StatelessWidget {

   MyProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('User Profile'),
      ),
      body: ListView(
        children: [
          UserHeaderSection(), // 用户头像和信息部分
          QuickLinksSection(), // 快速链接部分
          ProfileDetailsSection(), // 个人详情部分
          AccountSettingsSection(), // 账户设置部分
        ],
      ),
    );
  }
}

class UserHeaderSection extends StatelessWidget {

   MyProfileController controller = MyProfileController();
  UserHeaderSection({Key? key}) : super(key: key);
   final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                homeController.state.customerProfilesDetails['avatar'] ?? 'https://gravatar.com/avatar/default?s=400&d=robohash&r=x',
            ),
          ),
          const SizedBox(width: 16), // Provide some spacing between the avatar and the text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homeController.state.customerProfilesDetails['name'] ?? 'No Name',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4), // Provide some spacing between the texts
                Text(
                  homeController.state.customerProfilesDetails['email'] ?? 'No Email',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  homeController.state.customerProfilesDetails['phone'] ?? 'No Phone',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class QuickLinksSection extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final MyProfileController controller = MyProfileController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My public page'),
            onTap: () {
              Get.toNamed(AppRoutes.userProfile,arguments:homeController.state.customerProfilesDetails );
            },
          ),
          // ...更多ListTile组件
        ],
      ),
    );
  }
}

class ProfileDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ListTile(
            title: Text('Personal details'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          // ...更多ListTile组件
        ],
      ),
    );
  }
}

class AccountSettingsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
    child: Column(
    children: [
      ListTile(
        title: Text('Manage account'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
      ListTile(
        title: Text('Notification preferences'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
      // ...更多ListTile组件
    ],
    ),
    );
  }
}

