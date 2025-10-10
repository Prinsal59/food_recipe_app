import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_recipe_app/screens/breakfast_screen.dart';
import 'package:food_recipe_app/screens/dinner_screen.dart';
import 'package:food_recipe_app/screens/dessert_screen.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  int selectedTab =
      2; // 0 = All, 1 = Breakfast, 2 = Lunch, 3 = Dinner, 4 = Dessert
  int selectedBottomNav = 0;

  final List<String> tabs = ["All", "Breakfast", "Lunch", "Dinner", "Dessert"];

  final List<Map<String, dynamic>> lunchRecipes = [
    {
      "name": "Rustic Vegetable Soup",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/l1.png",
      "liked": false,
    },
    {
      "name": "Veggie Yaki Udon",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/L2.png",
      "liked": true,
    },
    {
      "name": "Spice-Crusted Tofu with Kumquat",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/L3.png",
      "liked": false,
    },
    {
      "name": "Sweet Potato Noodle Stir-Fry",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/L4.png",
      "liked": false,
    },
    {
      "name": "Veg Peel Fritters",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/L5.png",
      "liked": false,
    },
  ];

  void _onTabTap(int index) {
    setState(() {
      selectedTab = index;
    });

    final title = tabs[index];
    if (title == 'Breakfast') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const BreakfastScreen()),
      );
    } else if (title == 'Dinner') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const DinnerScreen()),
      );
    } else if (title == 'Dessert') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const DessertScreen()),
      );
    }
  }

  Widget _buildChip(String text, int index) {
    final isSelected = index == selectedTab;
    return GestureDetector(
      onTap: () => _onTabTap(index),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF79B34), Color(0xFFF46A1D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.maybePop(context);
                        },
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.white70),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Search...',
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.white70,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          'assets/images/profile_icon.png',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lunch',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // TABS
            SizedBox(
              height: 56,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (context, index) => _buildChip(tabs[index], index),
              ),
            ),

            const SizedBox(height: 8),

            // RECIPES LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: lunchRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = lunchRecipes[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          recipe['image'],
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 56,
                              height: 56,
                              color: Colors.grey[800],
                              child: const Icon(
                                Icons.image_not_supported,
                                color: Colors.white54,
                              ),
                            );
                          },
                        ),
                      ),
                      title: Text(
                        recipe['name'],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            recipe['rating'],
                            style: const TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.access_time,
                            color: Colors.white70,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            recipe['time'],
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          recipe['liked']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: recipe['liked'] ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            recipe['liked'] = !recipe['liked'];
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white70,
        currentIndex: selectedBottomNav,
        onTap: (index) {
          setState(() {
            selectedBottomNav = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
