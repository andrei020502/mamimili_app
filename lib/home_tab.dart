import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category Carousel',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 12.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CategoryCarousel(),
        ],
      ),
    );
  }
}


class CategoryCarousel extends StatelessWidget {
  final List<String> categoryImages = [
    'assets/categories/bakery.jpg',
    'assets/categories/beverage.jpg',
    'assets/categories/canned goods.jpg',
    'assets/categories/dairy.jpg',
    'assets/categories/frozen.jpg',
    'assets/categories/meat.jpg',
    'assets/categories/others.jpg',
    'assets/categories/produce.jpg',
    'assets/categories/snacks.jpg',
  ];

  final List<String> categoryNames = [
    'Bakery',
    'Beverage',
    'Canned Goods',
    'Dairy',
    'Frozen',
    'Meat',
    'Others',
    'Produce',
    'Snacks',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: categoryImages.asMap().entries.map((entry) {
        final index = entry.key;
        final imagePath = entry.value;
        final categoryName = categoryNames[index];

        return Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0), // Adjust margins
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: Text(
                    categoryName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  right: 20.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the explore button press
                    },
                    child: Text(
                      'Explore',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Button color
                      onPrimary: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.9,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
