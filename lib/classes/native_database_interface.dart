import 'dart:io';

import 'package:objectdb/src/objectdb_storage_filesystem.dart';
import 'package:qr_coder/classes/abstract_database_interface.dart';

class NativeDatabaseInterface implements DatabaseInterface {
	static dynamic storage() {
		return FileSystemStorage(Directory.current.path + '/theme.db');
	}
}
