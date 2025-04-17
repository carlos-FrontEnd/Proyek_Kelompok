import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/widgets/container_list_tile.dart';
import '../widgets/custom_list_tile.dart';
class ProfileAccount extends StatelessWidget {
  const ProfileAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black26, title: Text('More'),),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children:  [
              ContainerListTile(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 20),
                        Expanded(child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('No account'),
                            Text('Sign in to enjoy mote !',style: TextStyle(fontSize: 10),),
                          ],
                        ),),
                        Expanded(child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(onPressed: (){}, child: Text('sign-in', style: TextStyle(fontSize: 10),),),
                         ),
                        )



                      ]
                    )
                  ]
              ),
              ContainerListTile(
                children: [
                  CustomListTile(title: 'Setting'),
                  Divider(color: Colors.white, thickness: 0.8,),
                  CustomListTile(title: 'Content Languange'),
                  Divider(color: Colors.white, thickness: 0.8,),
                  CustomListTile(title: 'Mangatsu Labs'),
                ],
              ),
              ContainerListTile(
                children: [
                  CustomListTile(title: 'About'),
                  Divider(color: Colors.white, thickness: 0.8,),
                  CustomListTile(title: 'Help Center'),
                  Divider(color: Colors.white, thickness: 0.8,),
                  CustomListTile(title: 'Version'),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}