import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_getconnect/app/data/models/user_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<User>?>(
          future: controller.getAllUser(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data?.length == 0){
              return Center(
                child: Text("Tidak ada data!"),
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];

                  return ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar!)),
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text("${user.email}"),
                  );
                },);
            }
            
          },
        ));
  }
}
