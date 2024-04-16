import 'package:api/home/api_services.dart';
import 'package:api/home/model/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
        future: ApiService().getuserData(), // Corrected method call
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final result = snapshot.data!; // Changed to access the list directly
            return Column(
              // children: [
              //   ...result.data!((e) => ListTile(
              //     title: Text(e.email),
              //     trailing: Text(e.id.toString()),
              //   ))
                
              //   // ...result.map((e) => Text(e.email)).toList(),
              // ],
              children:List.generate(result.data!.length, (index) => ListTile(
                title: Text(result.data![index].id!.toString()),
                subtitle: Text(result.support!.url!.toString()),
              ))
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
