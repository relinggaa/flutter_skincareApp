import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _claimController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Get screen width
    double height = MediaQuery.of(context).size.height; // Get screen height

    return Scaffold(
      body: Stack(
        children: [
          // Body container (background content behind AppBar)
          Container(
            height: height, // Ensure container takes full height of the screen
            color: Color(0xFFE8EFF9), // Background color
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ), // No padding at the top
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 160), // Space for AppBar at the top
                  // Product Name Field
                  _buildTextField(
                    "Product Name",
                    "e.g., Miracle Anti-Aging Serum …",
                    _productController,
                  ),
                  SizedBox(height: 20),

                  // Brand Name Field
                  _buildTextField(
                    "Brand Name",
                    "e.g., SkinGlow",
                    _brandController,
                  ),
                  SizedBox(height: 20),

                  // Claim to Report Field
                  _buildTextField(
                    "Claim to Report",
                    "e.g., Reduces wrinkles by 80% in 2 weeks",
                    _claimController,
                  ),
                  SizedBox(height: 20),

                  // Additional Details Field
                  _buildTextField(
                    "Additional Details",
                    "Why do you believe this claim is misleading?",
                    _detailsController,
                  ),
                  SizedBox(height: 20),

                  // File Upload Section
                  _buildFileUploadSection(),
                  SizedBox(height: 20),

                  // Submit Button
                  _buildSubmitButton(),
                ],
              ),
            ),
          ),

          // AppBar Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildAppBar(width), // AppBar without any gap
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(), // Bottom navigation bar
    );
  }

  // AppBar Section
  PreferredSizeWidget _buildAppBar(double width) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100), // Specify the height of the app bar
      child: Container(
        height: 100,
        width: width,
        padding: EdgeInsets.only(top: 40, left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Claim Reporting",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Text Field for each section
  Widget _buildTextField(
    String label,
    String hintText,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            // Set the border to OutlineInputBorder with no border side
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Apply border radius
              borderSide: BorderSide.none, // Remove the outline border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none, // Remove the focus border
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none, // Remove the enabled border
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
      ],
    );
  }

  // File Upload Section
  Widget _buildFileUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload Evidence",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Icon(Icons.cloud_upload, color: Colors.blue, size: 40),
              SizedBox(height: 10),
              Text(
                "Drag your file(s) or browse",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 6),
              Text(
                "Max 10 MB files are allowed",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Submit Button
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement form submission logic here
        print("Claim Submitted!");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        "Submit Claim",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      color: Colors.white,
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
    );
  }
}
