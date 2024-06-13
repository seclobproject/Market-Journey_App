// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:dio/dio.dart';
// import 'package:master_journey/services/home_service.dart';
//
// import 'package:master_journey/authentication_page/login.dart';
// import 'package:master_journey/resources/color.dart';
//
// class TransactionScreen extends StatefulWidget {
//   const TransactionScreen({super.key});
//
//   @override
//   State<TransactionScreen> createState() => _TransactionScreenState();
// }
//
// class _TransactionScreenState extends State<TransactionScreen> {
//   File? _image;
//   bool uploading = false;
//   bool isLoading = false;
//   String? _fileName;
//
//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//         _fileName = pickedFile.name; // Save the file name
//       });
//       print("Image selected: ${_image!.path}"); // Debug log
//     } else {
//       print("No image selected."); // Debug log
//     }
//   }
//
//   Future<void> uploadMedia() async {
//     if (uploading) return;
//
//     setState(() {
//       uploading = true;
//       isLoading = true;
//     });
//
//     try {
//       if (_image != null) {
//         Uint8List uint8List = await _image!.readAsBytes();
//
//         FormData formData = FormData.fromMap({
//           'media': MultipartFile.fromBytes(
//             uint8List,
//             filename: 'image.png',
//           ),
//           'description': 'Payment Screenshot',
//         });
//
//         print("Starting upload..."); // Debug log
//         var response = await homeservice.uploadScreenshot(formData);
//         print("Upload response: ${response.statusCode}"); // Debug log
//         handleResponse(response);
//       } else {
//         print("No image to upload."); // Debug log
//       }
//     } on DioError catch (e) {
//       print("Exception during media upload: $e");
//       String errorMessage = "Connection error. Please try again.";
//       if (e.type == DioErrorType.connectionError) {
//         errorMessage = "No Internet connection. Please check your network.";
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(errorMessage),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } catch (e) {
//       print("Exception during media upload: $e");
//     } finally {
//       setState(() {
//         uploading = false;
//         isLoading = false;
//       });
//     }
//   }
//
//   void handleResponse(Response response) {
//     if (response.statusCode == 200) {
//       var responseData = response.data;
//       var msg = responseData['msg'] ?? 'Upload successful!';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(msg),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Upload failed!'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Align(
//         alignment: Alignment.center,
//         child: SingleChildScrollView( // Wrap with SingleChildScrollView
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//             height: 350,
//             width: 312,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(17),
//               color: whitegray,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Package Amount',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 9,
//                 ),
//                 Text(
//                   '₹10000',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 24,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "Transaction ID",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 10,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 SizedBox(
//                   height: 32,
//                   width: 249,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(4),
//                         borderSide: BorderSide(color: yellow, width: 1),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(4),
//                         borderSide: BorderSide(color: yellow, width: 1),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 17,
//                 ),
//                 Text(
//                   "Payment Screenshot",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 10,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 GestureDetector(
//                   onTap: _pickImage,
//                   child: Container(
//                     width: 249,
//                     padding: EdgeInsets.symmetric(vertical: 10), // Add some padding
//                     decoration: BoxDecoration(
//                       border: Border.all(color: yellow, width: 1),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: Center(
//                       child: _fileName == null
//                           ? Text('Upload Screenshot')
//                           : Text(_fileName!, overflow: TextOverflow.ellipsis),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 GestureDetector(
//                   onTap: uploadMedia,
//                   child: Center(
//                     child: Container(
//                       height: 24,
//                       width: 104,
//                       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: yellow1,
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Submit',
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.w500,
//                             color: black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
