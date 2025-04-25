import 'package:file_picker/file_picker.dart';

class FilePickerHelper {
  static Future<String?> pickImageFile() async {
    
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      // allowMultiple: true,

    );

    if (result != null && result.files.single.path != null) {
      return result.files.single.path;
    }
    return null;
  }
}


