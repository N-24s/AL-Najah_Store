


// class ProfileScreen2 extends StatelessWidget {
//   final ProfileController profileController = Get.put(ProfileController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Obx(() {
//         if (profileController.userProfile.isEmpty) {
//           return Center(child: CircularProgressIndicator());
//         } else {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Name: ${profileController.userProfile['name']}',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Email: ${profileController.userProfile['email']}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 // إضافة المزيد من الحقول حسب البيانات المستلمة
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }

