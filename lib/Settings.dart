
import 'package:categories/main.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () {
          Navigator.pop(context,MaterialPageRoute(builder: (context) => const Categories()));
        },),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          
          children: <Widget> [
            Row(
              children: [
                const Text("AREA: ", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 20)),
                Text(Categories.resultA1, style: const TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const Text("COUNTRY: ", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 20)),
                Text(Categories.resultC1, style: const TextStyle(fontSize: 20)),
              ],
            )
          ],
          
        ),
      ),
      );
  }
}