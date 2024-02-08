import "package:path_provider/path_provider.dart";
import "package:intl/intl.dart";
import "dart:io";
import "dart:developer" as developer;

class FileHandler {
  // "_"를 붙이면 private 이다.
  FileHandler._constructor();
  // '/data/user/0/패키지 이름/cache'
  Directory? _tempDir;
  // '/data/user/0/패키지 이름/app_flutter'
  Directory? _appDocDir;
  // '/data/user/0/패키지 이름/files'
  Directory? _appSupportDir;
  static final FileHandler _instance = FileHandler._constructor();

  void _initDir() async {
    _tempDir = await getTemporaryDirectory();
    _appDocDir = await getApplicationDocumentsDirectory();
    _appSupportDir = await getApplicationSupportDirectory();
  }

  factory FileHandler() {
    _instance._initDir();
    return _instance;
  }

  void read() {

  }

  void write() {
    var today = DateTime.now();
    var dateString = DateFormat("yyyyMMddhhmmss").format(today);

    String? appDocumentPath = _appDocDir?.path;
    var file = File("$appDocumentPath/$dateString.txt");
    file.writeAsString("$dateString: test1");
    developer.log("file.path: $file.path");
  }
}