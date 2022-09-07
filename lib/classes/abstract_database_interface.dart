import 'package:objectdb/src/objectdb_storage_in_memory.dart';
import ''
	if(dart.library.io) 'package:qr_coder/classes/native_database_interface.dart'
	if(dart.library.html) 'package:qr_coder/classes/web_database_interface.dart';

abstract class DatabaseInterface {
	static dynamic storage() {
		return InMemoryStorage();
	}
}
