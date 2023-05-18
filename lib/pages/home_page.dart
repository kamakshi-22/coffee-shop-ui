import 'package:coffee_ui/utils/coffe_tile.dart';
import 'package:coffee_ui/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeType = [
    [
      'Latte',
      true,
    ],
    [
      'Espresso',
      false,
    ],
    [
      'Cappuccino',
      false,
    ],
    [
      'Mocha',
      false,
    ],
    [
      'Macchiato',
      false,
    ],
  ];

  // coffee types detector
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        if (i == index) {
          coffeeType[i][1] = true;
        } else {
          coffeeType[i][1] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Find the best coffee for you',
            style: GoogleFonts.bebasNeue(
              fontSize: 56,
            ),
          ),
        ),
        const SizedBox(height: 25),

        //Search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Find your coffee',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)),
            ),
          ),
        ),
        const SizedBox(height: 25),

        // coffee types
        SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    },
                  );
                })),

        // Coffe tiles
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(
                  coffeeImagePath: 'assets/images/cappucino.jpeg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.99'),
              CoffeeTile(
                  coffeeImagePath: 'assets/images/latte.jpeg',
                  coffeeName: 'Espresso',
                  coffeePrice: '4.99'),
              CoffeeTile(
                  coffeeImagePath: 'assets/images/milk.jpeg',
                  coffeeName: 'Cappuccino',
                  coffeePrice: '4.99'),
              CoffeeTile(
                  coffeeImagePath: 'assets/images/latte.jpeg',
                  coffeeName: 'Mocha',
                  coffeePrice: '4.99'),
              CoffeeTile(
                  coffeeImagePath: 'assets/images/cappucino.jpeg',
                  coffeeName: 'Macchiato',
                  coffeePrice: '4.99'),
            ],
          ),
        ),
      ]),
    );
  }
}
