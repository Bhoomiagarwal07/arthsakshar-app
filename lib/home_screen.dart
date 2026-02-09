import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'अर्थसाक्षर',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),

     
             body: SingleChildScrollView(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      // Welcome
      const Text(
        'स्वागत है! Welcome Back 👋',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 6),
      const Text(
        'अपनी financial literacy journey जारी रखें',
        style: TextStyle(fontSize: 16),
      ),

      const SizedBox(height: 20),

      // Quick Actions (IMAGE PART)
      Column(
        children: [
          actionCard('▶ Resume Learning', 'सीखना जारी रखें'),
          const SizedBox(width: 10),
          actionCard('📘 Start New Course', 'नया कोर्स शुरू करें'),
        ],
      ),
      const SizedBox(height: 10),
      actionCard('💰 Financial Tools', 'वित्तीय टूल्स देखें'),

      const SizedBox(height: 25),

      // AI Section
      const Text(
        'AI Tools | एआई टूल्स',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 12),

      dashboardCard(
        title: '🤖 AI Chatbot | एआई चैटबॉट',
        desc: 'अपने सवाल पूछें | Ask questions instantly',
        btnText: 'Start Chat | चैट शुरू करें',
      ),

      dashboardCard(
        title: '🔊 Text to Speech | टेक्स्ट से आवाज',
        desc: 'लिखे हुए शब्दों को आवाज में सुनें',
        btnText: 'Play Voice | आवाज सुनें',
      ),

      dashboardCard(
        title: '🧠 AI Quiz Generator | एआई क्विज',
        desc: 'किसी भी विषय पर क्विज बनाएं',
        btnText: 'Create Quiz | क्विज बनाएं',
      ),

      const SizedBox(height: 20),

      // My Courses
      const Text(
        'My Courses | मेरे कोर्स',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),

      courseCard(),
    ],
  ),
),

    );
  }
}

// Feature Card Widget
Widget featureCard({
  required String title,
  required String description,
  required String buttonText,
  required VoidCallback onTap,
}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    ),
  );
}
Widget actionCard(String title, String subtitle) {
  return SizedBox(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(subtitle),
          ],
        ),
      ),
    ),
  );
}

Widget courseCard() {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'बुनियादी वित्तीय साक्षरता',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text('Progress'),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: 0.4,
            color: Colors.green,
            backgroundColor: Colors.green.shade100,
          ),
        ],
      ),
    ),
  );
}


Widget dashboardCard({
  required String title,
  required String desc,
  required String btnText,
}) {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.only(bottom: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(desc),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {},
              child: Text(btnText),
            ),
          ),
        ],
      ),
    ),
  );
}
