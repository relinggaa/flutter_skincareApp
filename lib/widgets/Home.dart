import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gabriela_app/widgets/validation.dart'; // Gunakan ini

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color blue = Color(0xFF1A64AF);
    Color bc = Color(0xFFE8EFF9);

    // Sample data for carousel
    final List<Map<String, String>> recentActivities = [
      {
        'image': 'assets/images/lany.jpg',
        'user': 'Avery Quinn',
        'time': '2 hours ago',
        'title': 'Product Launch',
        'description': 'New skincare product launched.',
        'comments': '15',
      },
      {
        'image': 'assets/images/lany.jpg',
        'user': 'Jordan Black',
        'time': '1 hour ago',
        'title': 'Event Recap',
        'description': 'Highlights from the latest event.',
        'comments': '8',
      },
      // Add more items as needed
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Second Background Container with 'bc' color
          Positioned.fill(
            child: SingleChildScrollView(
              child: Container(
                color: bc, // Apply 'bc' color to the second container
                child: Column(
                  children: [
                    SizedBox(
                      height: 180, // Added space here to push content lower
                    ),
                    // Option Buttons Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOptionCard(
                          'Validate Product',
                          'assets/images/icon1.png', // Path ke gambar lokal Anda
                          'Scan or search to verify claims',
                          () {
                            // Fungsi yang akan dijalankan saat card 'Validate Product' ditekan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Validation(),
                              ),
                            );
                          },
                        ),
                        _buildOptionCard(
                          'Report a Claim',
                          'assets/images/icon2.png',
                          'Submit exaggerated or false claims',
                          () {
                            // Fungsi yang akan dijalankan saat card 'Validate Product' ditekan
                            print('Validate Product clicked');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOptionCard(
                          'Explore Ingredients',
                          'assets/images/icon3.png',
                          'Learn about skincare ingredients',
                          () {
                            // Fungsi yang akan dijalankan saat card 'Validate Product' ditekan
                            print('Validate Product clicked');
                          },
                        ),
                        _buildOptionCard(
                          'My Recommendations',
                          'assets/images/icon4.png',
                          'Get personalized product suggestions',
                          () {
                            // Fungsi yang akan dijalankan saat card 'Validate Product' ditekan
                            print('Validate Product clicked');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Skincare Tip Section
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Skincare Tip',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Use sunscreen daily',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromARGB(
                                    255,
                                    157,
                                    156,
                                    156,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Recent Activity',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Recent Activity Section (Carousel)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CarouselSlider.builder(
                        itemCount: recentActivities.length,
                        itemBuilder: (context, index, realIndex) {
                          final activity = recentActivities[index];
                          return Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: blue,
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFF9CBCE2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row for Image and user info (name and time)
                                  SizedBox(
                                    height: 12,
                                  ), // Space after the user info row
                                  // Insert Image Above the Title
                                  Image.asset(
                                    activity['image']!, // Replace with your image path
                                    width: double.infinity,
                                    height: 150, // Adjust the height as needed
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 12), // Space after image
                                  // Title and description
                                  Row(
                                    children: [
                                      // Profile Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          activity['image']!, // Replace with your image path
                                          width: 50, // Adjusted image size
                                          height: 50, // Adjusted image size
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ), // Space between image and text
                                      // Column to display user name and time next to it
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Username and time combined into one row
                                          Row(
                                            children: [
                                              Text(
                                                activity['user']!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ), // Space between user and time
                                              Text(
                                                activity['time']!,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    activity['title']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    activity['description']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                  SizedBox(height: 8),

                                  // Comments section
                                  Row(
                                    children: [
                                      // Comment Icon
                                      Icon(
                                        Icons.chat,
                                        size: 16,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ), // Space between the comment icon and comment text
                                      // Comment Text
                                      Text(
                                        activity['comments']!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                      ),

                                      // Spacer to push icons to the right side
                                      Spacer(),

                                      // Bookmark Icon
                                      IconButton(
                                        icon: Icon(
                                          Icons.bookmark,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          // Handle the bookmark action
                                        },
                                      ),

                                      // More options (three dots) Icon
                                      IconButton(
                                        icon: Icon(
                                          Icons.more_horiz,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          // Handle more options action
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 370,
                          viewportFraction: 1.0,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlay: false,
                          scrollPhysics:
                              BouncingScrollPhysics(), // Smooth scrolling
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Header Section with 'blue' color
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: width,
              height: 150,
              decoration: BoxDecoration(
                color: blue, // Apply 'blue' color to the header container
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(17),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/lany.jpg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Gabriela',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: Icon(Icons.home), onPressed: () {}),
              IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
              IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    String title,
    String imagePath,
    String description,
    VoidCallback onPressed,
  ) {
    Color blue = Color(0xFF1A64AF);
    return Expanded(
      child: GestureDetector(
        onTap: onPressed, // Menambahkan fungsi onPressed saat card diklik
        child: Card(
          elevation: 10,
          shadowColor: blue, // Mengatur warna shadow menjadi biru
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white, // Set the card color to white
          child: Container(
            height: 220,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath, // Menampilkan gambar dari file lokal
                    width: 100, // Atur ukuran gambar sesuai keinginan
                    height: 100,
                  ),
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
