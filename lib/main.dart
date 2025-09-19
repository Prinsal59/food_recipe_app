import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RecipeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Recipe model
class Recipe {
  final String id;
  final String title;
  final String category;
  final String time;
  final double rating;
  final String image;

  Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.time,
    required this.rating,
    required this.image,
  });
}

/// Dummy data
final sampleRecipes = [
  Recipe(
    id: '1',
    title: 'Chocolate Berry Cake',
    category: 'Dessert',
    time: '40 min',
    rating: 4.8,
    image:
        'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=800&q=60',
  ),
  Recipe(
    id: '2',
    title: 'Garden Fresh Salad',
    category: 'Lunch',
    time: '10 min',
    rating: 4.6,
    image:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=800&q=60',
  ),
  Recipe(
    id: '3',
    title: 'Vegan Banana Pancakes',
    category: 'Breakfast',
    time: '20 min',
    rating: 4.8,
    image:
        'https://images.unsplash.com/photo-1584270354949-96f27202b8f0?auto=format&fit=crop&w=800&q=60',
  ),
];

/// Provider to manage state (favorites + category filter)
class RecipeProvider extends ChangeNotifier {
  String activeCategory = 'All';
  final Map<String, bool> favorites = {};

  void toggleFavorite(String id) {
    favorites[id] = !(favorites[id] ?? false);
    notifyListeners();
  }

  void setCategory(String cat) {
    activeCategory = cat;
    notifyListeners();
  }

  List<Recipe> getFilteredRecipes() {
    if (activeCategory == 'All') return sampleRecipes;
    return sampleRecipes.where((r) => r.category == activeCategory).toList();
  }
}

/// Home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RecipeProvider>();
    final recipes = provider.getFilteredRecipes();
    final categories = ['All', 'Breakfast', 'Lunch', 'Dinner', 'Dessert'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            /// Gradient Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF28B2F), Color(0xFFFF7B00)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(18),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Greeting + Avatar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hello Divya",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text("Welcome back!", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=200&q=60',
                        ),
                        radius: 22,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// Search
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Search...",
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.notifications, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Category pills
            SizedBox(
              height: 48,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final active = provider.activeCategory == cat;
                  return GestureDetector(
                    onTap: () => provider.setCategory(cat),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: active ? Colors.orangeAccent : Colors.grey[900],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          color: active ? Colors.black : Colors.white70,
                          fontWeight: active
                              ? FontWeight.bold
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// Recipe List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 70),
                itemCount: recipes.length,
                itemBuilder: (context, i) {
                  final r = recipes[i];
                  final fav = provider.favorites[r.id] ?? false;
                  return Card(
                    color: Colors.grey[900],
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          r.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        r.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "${r.rating} ⭐ • ${r.time}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          fav ? Icons.favorite : Icons.favorite_border,
                          color: fav ? Colors.redAccent : Colors.white70,
                        ),
                        onPressed: () => provider.toggleFavorite(r.id),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// Bottom Nav
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
