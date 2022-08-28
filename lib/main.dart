import 'package:categories/Settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Categories());
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  // For Settings Page //
  static String resultA = 'Select Area'; static String resultA1 = 'Select Area';
  static String resultC = 'Select Country'; static String resultC1 = 'Select Country';

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Countries',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
      home: const CategorySelection(),
    );
  }
}

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {

  String? dropdownValueBol; String a = ''; String c = '';
  String dropdownValueUlk = 'Select Country';
  List<String> selectedCat = [];


  final List<String> kategoriler = [
    "Select Area","Africa", "Asia", "Europe", "Latin America",
    "Oceania", "Northern America"];

  //Countries//
  final List<String> africa = [
    "Select Country","Djibouti","Seychelles","DR Congo","Comoros","Togo","Sierra Leone",
    "Libya","Tanzania","South Africa","Cabo Verde","Congo","Kenya",
    "Liberia","Central African Republic","Mauritania","Uganda",
    "Algeria","Sudan","Morocco","Eritrea","Angola","Mozambique",
    "Ghana","Madagascar","Cameroon","Côte d'Ivoire","Namibia","Niger",
    "Gambia","Botswana","Gabon","Sao Tome & Principe","Lesotho",
    "Burkina Faso","Nigeria","Mali","Guinea-Bissau","Malawi","Zambia",
    "Senegal","Chad","Somalia","Zimbabwe","Equatorial Guinea","Guinea",
    "Rwanda","Mauritius","Benin","Burundi","Tunisia","Eswatini","Ethiopia",
    "South Sudan","Egypt"
    ];

  final List<String> asia = [
    "Select Country","United Arab Emirates","Vietnam","Tajikistan",
    "Israel","Turkey","Iran","Bhutan","Laos",
    "Thailand","Lebanon","Kyrgyzstan","Turkmenistan",
    "Singapore","Myanmar","Maldives","South Korea","Oman",
    "State of Palestine","Brunei ","Kuwait","Iraq","Georgia",
    "Afghanistan","Saudi Arabia","Uzbekistan","Mongolia",
    "Malaysia","Yemen","Armenia","Nepal","Qatar","Indonesia",
    "North Korea","Pakistan","Sri Lanka","Kazakhstan","Syria",
    "Bahrain","Cambodia","Bangladesh","China","Timor-Leste","Japan",
    "Cyprus","Philippines","Jordan","Azerbaijan","India"
  ];

  final List<String> europe = [
    "Select Country","Hungary","Belarus","Austria","Serbia","Switzerland",
    "Germany","Holy See","Andorra","Bulgaria","United Kingdom",
    "France","Montenegro","Luxembourg","Italy","Denmark","Finland",
    "Slovakia","Norway","Ireland","Spain","Malta","Ukraine","Croatia",
    "Moldova","Monaco","Liechtenstein","Poland","Iceland","San Marino",
    "Bosnia and Herzegovina","Albania","Lithuania","North Macedonia",
    "Slovenia","Romania","Latvia","Netherlands","Russia","Estonia",
    "Belgium","Czech Republic (Czechia)","Greece","Portugal","Sweden"
  ];

  final List<String> latinAmericaAndTheCaribbean = [
    "Select Country","Honduras","Antigua and Barbuda","Guyana",
    "Dominica","Paraguay","Nicaragua","El Salvador",
    "Suriname","Saint Kitts & Nevis","Costa Rica",
    "Colombia","Argentina","Panama","Belize","Bahamas",
    "Uruguay","Peru","Jamaica","Barbados","Venezuela",
    "Brazil","Chile","Saint Lucia","Guatemala","Ecuador",
    "Trinidad and Tobago","Mexico","Bolivia","Haiti",
    "Cuba","Grenada","St. Vincent & Grenadines","Dominican Republic"
  ];

  final List<String> oceania = [
    "Select Country","Fiji","Papua New Guinea","Solomon Islands",
    "Marshall Islands","Micronesia","New Zealand",
    "Vanuatu","Australia","Samoa","Palau","Kiribati","Tuvalu","Nauru","Tonga"
  ];

  final List<String> northernAmerica = [
    "Select Country","Canada","United States"
  ];
  //Countries//

  late final Map dogs = {
    "Africa" : africa,
    "Asia" : asia,
    "Europe" : europe,
    "Latin America" : latinAmericaAndTheCaribbean,
    "Oceania" : oceania,
    "Northern America" : northernAmerica
  };


  void _ulkeler() async {
  setState(() {
  dropdownValueUlk = 'Select Country';
  a = dropdownValueBol.toString();
  selectedCat = dogs[a];
  //print(selectedCat);
  });
}

  void _saved() {
  setState(() {
    Categories.resultA1 = Categories.resultA;
    Categories.resultC1 = Categories.resultC;
    ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("SAVED!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), 
            duration: Duration(seconds: 1),
            backgroundColor: Colors.green,
            )
          );
  });
}

void _clear() {
  setState(() {
    Categories.resultA1 = 'Select Area'; Categories.resultA = 'Select Area';
    Categories.resultC1 = 'Select Country'; Categories.resultC = 'Select Country';
    dropdownValueUlk = 'Select Country'; dropdownValueBol = 'Select Area';

    ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("RESET!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), 
            duration: Duration(seconds: 1),
            backgroundColor: Colors.blue,
            )
          );
  });
}
  void _settings() {
    Navigator.push(context,MaterialPageRoute(builder: (context) => const Settings()));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(  
        title: const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: _settings,
              child: const Icon(Icons.settings, size: 26.0),
              )
            ),
          ]
        ),
      body: Column(
        children: <Widget>[

          Container(
            padding: const EdgeInsets.all(48.00),
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              width: 300,
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30)),
              child: DropdownButton<String>(
                hint: const Center(child: Text('Select Area', style: TextStyle(color: Colors.black, fontSize: 20))),
                isExpanded: true,
                underline: Container(),
                value: dropdownValueBol,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueBol = newValue!;
                    Categories.resultA = dropdownValueBol.toString();
                    _ulkeler();
                    });},
                selectedItemBuilder:(BuildContext context) => kategoriler.map((e) => Center(child: Text(e, style: const TextStyle(fontSize: 20, color: Colors.black)))).toList(),
                items: kategoriler.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 20)));}).toList(),
                )
              ),
            ),
          
          Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              width: 300,
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30)),
              child:  DropdownButton<String>(
                hint: const Center(child: Text('Select Country', style: TextStyle(color: Colors.black, fontSize: 20))),
                isExpanded: true,
                underline: Container(),
                value: dropdownValueUlk,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueUlk = newValue!;
                      c = dropdownValueUlk.toString();
                      Categories.resultC = c;
                    });
                  },
                selectedItemBuilder:(BuildContext context) { 
                  return selectedCat.map((e) => Center(child: Text(e, style: const TextStyle(fontSize: 20, color: Colors.black)))).toList();},
                items: selectedCat.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 20)));}).toList(),
                )
              ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(48.00),
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  onPressed: _saved, 
                  child: const Text("SAVE", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                padding: const EdgeInsets.all(48.00),
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  onPressed: _clear, 
                  child: const Text("RESET", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              
            ],
          ),
        ],
      ),
      );
    }
  }