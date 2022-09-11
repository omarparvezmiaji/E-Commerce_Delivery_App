import 'dart:io';
import 'package:delivery_app/screens/Pending_Delivery/pdf_viewer_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

// Future<File> loadPdfFromNetwork(String url) async {
//   final response = await http.get(Uri.parse(url));
//   final bytes = response.bodyBytes;
//   return _storeFile(url, bytes);
// }

// Future<File> _storeFile(String url, List<int> bytes) async {
//   final filename = basename(url);
//   final dir = await getApplicationDocumentsDirectory();
//   final file = File('${dir.path}/$filename');
//   await file.writeAsBytes(bytes, flush: true);
//   if (kDebugMode) {
//     print('$file');
//   }
//   return file;
// }

// openPdf(BuildContext context, File file, String url) =>
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => PdfViewerPage(
//           file: file,
//           url: url,
//         ),
//       ),
//     );
