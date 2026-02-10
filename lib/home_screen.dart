import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';
import '../screens/home_page.dart';
import 'screens/courses_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeContent(),
    DashboardScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // TOP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        title: const Text(
          "स्वागत है! Welcome back!",
          style: TextStyle(color: Colors.black),
        ),
      ),

      // DRAWER
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'ArthSakshar',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading:  Icon(Icons.home),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
      Text("गृह", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Home", style: TextStyle(fontSize: 12, color: Colors.grey)),
    ],
  ),
    onTap: () {
    Navigator.pop(context);
  },
  ),

            ListTile(
  leading: const Icon(Icons.book),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text("पाठ्यक्रम", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Courses", style: TextStyle(fontSize: 12, color: Colors.grey)),
    ],
  ),
  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CoursesPage()),
  );
},

),

            ListTile( leading: const Icon(Icons.warning),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text("सुरक्षा अलर्ट", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Safety Alerts", style: TextStyle(fontSize: 12, color: Colors.grey)),
    ],
  ),),
            ListTile(leading: const Icon(Icons.gavel),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text("आपके अधिकार", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Your Rights", style: TextStyle(fontSize: 12, color: Colors.grey)),
    ],
  ),),
            ListTile( leading: const Icon(Icons.help),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text("सहायता और समर्थन", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Help & Support", style: TextStyle(fontSize: 12, color: Colors.grey)),
    ],
  ),),
          ],
        ),
      ),

      // PAGE BODY
      body: pages[selectedIndex],

      // BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// ================= HOME DASHBOARD CONTENT =================

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "अपनी वित्तीय साक्षरता यात्रा जारी रखें",
            style: TextStyle(color: Colors.grey.shade700),
          ),

          const SizedBox(height: 20),

          // DASHBOARD ICONS
          Row(
               children: [
    DashboardIcon(
      Icons.play_arrow,
      "सीखना जारी रखें",
      "Resume Learning",
    ),
    const SizedBox(width: 12),
    DashboardIcon(
      Icons.menu_book,
      "नया कोर्स शुरू करें",
      "Start New Course",
    ),
    const SizedBox(width: 12),
    DashboardIcon(
      Icons.calculate,
      "वित्तीय उपकरण",
      "Financial Tools",
    ),
  ],
          ),

          const SizedBox(height: 20),

Row(
  children: [
    DashboardIcon(
      Icons.smart_toy,
      "एआई चैटबॉट",
      "AI Chatbot",
    ),
    const SizedBox(width: 12),
    DashboardIcon(
      Icons.volume_up,
      "आवाज़ सहायता",
      "Voice Help",
    ),
    const SizedBox(width: 12),
    DashboardIcon(
      Icons.quiz,
      "ऑनलाइन क्विज़",
      "Online Quiz",
    ),
  ],
),


          const SizedBox(height: 30),

          const Text(
            "My Courses",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "बुनियादी वित्तीय साक्षरता",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Basic Financial Literacy",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.green,
                    minHeight: 8,
                  ),
                  const SizedBox(height: 8),
                  const Text("Progress: 2 / 8 lessons"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= DASHBOARD ICON CARD =================

class DashboardIcon extends StatelessWidget {
       final IconData icon;
  final String hindiText;
  final String englishText;
  final VoidCallback? onTap;

  const DashboardIcon(
    this.icon,
    this.hindiText,
    this.englishText, {
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Icon(icon, size: 38, color: Colors.green),
                const SizedBox(height: 8),
                Text(
                  hindiText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  englishText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


