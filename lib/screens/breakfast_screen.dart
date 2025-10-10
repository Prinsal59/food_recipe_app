import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_recipe_app/screens/lunch_screen.dart';
import 'package:food_recipe_app/screens/dinner_screen.dart';
import 'package:food_recipe_app/screens/dessert_screen.dart';

class BreakfastScreen extends StatefulWidget {
  const BreakfastScreen({Key? key}) : super(key: key);

  @override
  State<BreakfastScreen> createState() => _BreakfastScreenState();
}

class _BreakfastScreenState extends State<BreakfastScreen> {
  int selectedTab =
      1; // 0 = All, 1 = Breakfast, 2 = Lunch, 3 = Dinner, 4 = Dessert

  final List<String> tabs = ["All", "Breakfast", "Lunch", "Dinner", "Dessert"];

  final List<Map<String, dynamic>> breakfastRecipes = [
    {
      "name": "Idli (South India)",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/idli.png",
      "liked": true,
    },
    {
      "name": "Mandu Vada (South India)",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/mandu_vada.png",
      "liked": false,
    },
    {
      "name": "Pongal",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/pongal.png",
      "liked": false,
    },
    {
      "name": "Grilled Cheese Unforgettable",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/berry cack.png",
      "liked": false,
    },
    {
      "name": "Orange Julius",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/orange juice.png",
      "liked": false,
    },
    {
      "name": "Chocolate Covered Katie",
      "rating": "4.8",
      "time": "10 min",
      "image": "assets/images/pancacks.png",
      "liked": false,
    },
  ];

  void _onTabTap(int index) {
    setState(() {
      selectedTab = index;
    });

    final title = tabs[index];
    if (title == 'Lunch') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LunchScreen()),
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
    // "All" and "Breakfast" only change selection locally
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
                      // back button
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.maybePop(context);
                        },
                      ),

                      const SizedBox(width: 6),

                      // Search bar
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

                      // Profile avatar
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage: const AssetImage(
                          'assets/images/profile_icon.png',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // optional: subtitle row (if you want a title)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Breakfast',
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

            // ===== Category chips =====
            SizedBox(
              height: 56,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (context, index) => _buildChip(tabs[index], index),
              ),
            ),

            const SizedBox(height: 12),

            // ===== Recipe list =====
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: breakfastRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = breakfastRecipes[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          recipe['image'],
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // show placeholder if asset missing
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
                          fontWeight: FontWeight.bold,
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
    );
  }
}
