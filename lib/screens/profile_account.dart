import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/widgets/container_list_tile.dart';
import 'package:home/widgets/theme_notifier.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_list_tile.dart';

class ProfileAccount extends StatefulWidget {
  const ProfileAccount({super.key});

  @override
  State<ProfileAccount> createState() => _ProfileAccountState();
}

class _ProfileAccountState extends State<ProfileAccount> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: const Text('More'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: ListView(
            children: [
              ContainerListTile(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('No account'),
                          Text(
                            'Sign in to enjoy more!',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'sign-in',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  ContainerListTile(
                    children: [
                      CustomListTile(title: 'Setting'),

                      CustomListTile(title: 'Content Language'),

                      CustomListTile(
                        title: 'Dark Mode',
                        trailing: Switch(
                          value: themeNotifier.isDarkMode,
                          onChanged: (value) {
                            themeNotifier.toggleTheme();
                          },
                        ),
                      ),
                    ],
                  ),
                  ContainerListTile(
                    children: [
                      CustomListTile(title: 'About'),
                      CustomListTile(title: 'Help Center'),
                      CustomListTile(title: 'Version'),
                      CustomListTile(title: 'Privacy Policy'),
                    ],
                  ),
                  ContainerListTile(
                    children: [
                      CustomListTile(title: 'Terms of Service'),
                      CustomListTile(title: 'Copyright'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/instagram.svg', height: 20),
                      const SizedBox(width: 10),
                      SvgPicture.asset('assets/twitter.svg', height: 20),
                      const SizedBox(width: 10),
                      SvgPicture.asset('assets/facebook.svg', height: 20),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
