import 'package:flutter/material.dart';

class Validation extends StatefulWidget {
  const Validation({super.key});

  @override
  _ValidationState createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  final TextEditingController _controller = TextEditingController();
  String _product = '';
  String _claimStatus = '';
  String _explanation = '';
  String _skincareTip = '';
  bool _isVerified = false;
  bool _isSearching = false; // Track if search is performed
  bool _isProductNotFound = false; // To track if no result is found
  bool _isFirstTimeSearch = true; // Track if this is the first search
  bool _isKeyboardVisible = false;

  // Function to trigger search based on input
  void _searchProduct(String query) {
    setState(() {
      _isSearching = true; // Mark that search is performed
      _isProductNotFound = false; // Reset product not found state
      _isFirstTimeSearch = false; // First search is now complete

      if (query.toLowerCase() == 'hydra boost serum') {
        _product = 'SkinGlow - Hydra Boost Serum';
        _claimStatus = 'Suitable for all skin types';
        _isVerified = true;
        _explanation =
            'This claim is supported by clinical studies. Dermatologist tested on various skin types with no adverse reactions.';
        _skincareTip =
            'Tip: Always apply sunscreen as the last step of your morning routine.';
      } else if (query.toLowerCase() == 'retinol renewal night cream') {
        _product = 'AgeLess - Retinol Renewal Night Cream';
        _claimStatus = 'Reduces wrinkles by 50% in 8 weeks';
        _isVerified = false;
        _explanation =
            'This claim is not supported by scientific evidence. Studies showed only a 20-25% reduction in wrinkle depth after 12 weeks.';
        _skincareTip =
            'Tip: Patch test new products on your inner arm for 24 hours before facial application.';
      } else {
        _product = '';
        _claimStatus = '';
        _explanation = '';
        _skincareTip = '';
        _isVerified = false;
        _isProductNotFound = true; // Mark as product not found
      }
      _isSearching = false; // End loading state after search completes
    });
  }

  @override
  void initState() {
    super.initState();
    // Listen for keyboard visibility changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Get screen width
    double height = MediaQuery.of(context).size.height; // Get screen height

    // Check if keyboard is visible
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent bottom overflow
      body: Stack(
        children: [
          // Background container for the body
          Container(
            width: width,
            height: height,
            color: Color(0xFFE8EFF9), // Background color for the body
          ),
          // AppBar replacement with rounded bottom corners
          Positioned(top: 0, left: 0, right: 0, child: _buildAppBar(width)),
          // Body content container
          Positioned.fill(
            top: 100, // Ensure this starts below the AppBar
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search bar with rounded corners and padding
                    SizedBox(height: 20),
                    _buildSearchBar(width),
                    SizedBox(height: 20),

                    // "Or" separator
                    Center(child: Text("Or")),
                    SizedBox(height: 20),

                    // Scan barcode button with visible shadow
                    _buildScanBarcodeButton(width),
                    SizedBox(height: 30),

                    // Show the "How Validation Works" only if no product is found
                    if (_isFirstTimeSearch || _product.isEmpty)
                      _buildHowValidationWorks(width),

                    // Show the validation description when product is found
                    if (!_isProductNotFound && _product.isNotEmpty)
                      _buildValidationResult(width),
                    SizedBox(height: 30),
                    if (_product.isNotEmpty) _buildSkincareTip(width),
                    // Show message when product not found
                    if (_isProductNotFound) _buildNoResultMessage(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar with white background, conditionally hide it when keyboard is visible
      bottomNavigationBar:
          isKeyboardVisible ? null : _buildBottomNavigationBar(),
    );
  }

  Widget _buildAppBar(double width) {
    return Container(
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
          "Claim Validation",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(double width) {
    return Container(
      width: width * 0.9, // 90% of the screen width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 12,
            spreadRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: "Search by product name or brand",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          suffixIcon: Icon(Icons.search, color: Colors.grey),
        ),
        onSubmitted: (value) => _searchProduct(value),
      ),
    );
  }

  Widget _buildScanBarcodeButton(double width) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.camera_alt),
      label: Text("Scan Barcode"),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey, // Subtle color for the icon
        minimumSize: Size(width * 0.9, 50),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        shadowColor: Colors.black.withOpacity(0.9),
        elevation: 5,
      ),
    );
  }

  Widget _buildHowValidationWorks(double width) {
    return Container(
      width: width * 0.9,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, color: Colors.blue, size: 30),
          SizedBox(height: 10),
          Text(
            "How Validation Works",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "We check product claims against peer-reviewed research and clinical studies to determine if they’re supported by scientific evidence.",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildValidationResult(double width) {
    return Container(
      width: width * 0.9,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Validation Result",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            _product,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          // Claim section
          Text(
            "Claim:",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "\"$_claimStatus\"",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          // Status section with the colored background and checkmark
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color:
                  _isVerified
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: _isVerified ? Colors.green : Colors.red,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  _isVerified ? "Verfied" : "False",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _isVerified ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Explanation section
          Text(
            "Explanation:",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 6),
          Text(
            _explanation,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5, // Adjust line height for readability
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildSkincareTip(double width) {
    return Container(
      width: width * 0.9,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A64AF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skincare Tip",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6),
          Text(
            _skincareTip,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResultMessage() {
    return Center(
      child: Text("", style: TextStyle(fontSize: 16, color: Colors.red)),
    );
  }

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
