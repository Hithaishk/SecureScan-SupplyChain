// import 'package:flutter/material.dart';
// import 'package:project/Screens/add_product.dart';

// import 'all_products.dart';

// class second_screen extends StatefulWidget {
//   const second_screen({Key? key}) : super(key: key);

//   @override
//   _second_screenState createState() => _second_screenState();
// }

// class _second_screenState extends State<second_screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Admin Page'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               child: Container(
//                 width: 100.0,
//                 color: Colors.white,
//                 child: Image.asset("images/plus.png"),
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AddProductsScreen()),
//                 );
//               },
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             const Text(
//               'Add Product',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 17.0,
//               ),
//             ),
//             const SizedBox(
//               height: 100.0,
//             ),
//             GestureDetector(
//               child: Container(
//                 width: 100.0,
//                 color: Colors.white,
//                 child: Image.asset("images/listi.png"),
//               ),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const AllProductsScreen()));
//               },
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             const Text(
//               'All Products',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 17.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:securScan/Screens/add_product.dart';
import 'all_products.dart';

class second_screen extends StatefulWidget {
  const second_screen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<second_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Admin Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductsScreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue, // Keep the color as blue
                minimumSize: Size(150, 50), // Set the minimum size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Set the border radius for a squared button
                ),
              ),
              child: Text(
                'Add Product',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const SizedBox(
              height: 100.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllProductsScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue, // Keep the color as blue
                minimumSize: Size(150, 50), // Set the minimum size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Set the border radius for a squared button
                ),
              ),
              child: Text(
                'All Products',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
