import 'database_interface_stub.dart'
	if(dart.library.io) 'package:objectdb/src/objectdb_storage_filesystem.dart'
	if(dart.library.html) 'package:objectdb/src/objectdb_storage_indexeddb.dart';

abstract class DatabaseInterface {
	dynamic storage();
}
