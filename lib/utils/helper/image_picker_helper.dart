// import 'package:file_picker/file_picker.dart';

// class FilePickerHelper {
//   static Future<String?> pickImageFile() async {
    
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//       // allowMultiple: true,

//     );

//     if (result != null && result.files.single.path != null) {
//       return result.files.single.path;
//     }
//     return null;
//   }
// }


import 'package:file_selector/file_selector.dart';

class FilePickerHelper {
  static Future<String?> pickImageFile() async {
    const XTypeGroup imageTypeGroup = XTypeGroup(
      label: 'images',
      extensions: ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'],
    );

    final XFile? file = await openFile(acceptedTypeGroups: [imageTypeGroup]);

    if (file != null) {
      return file.path;
    }
    return null;
  }
}
