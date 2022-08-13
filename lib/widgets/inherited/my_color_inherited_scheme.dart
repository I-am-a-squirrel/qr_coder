class MyColorInheritedScheme extends InheritedWidget {
	const MyColorInheritedScheme({
		Key?: key,
		required this.red,
		required this.green,
		required this.blue,
	}) : super();

	final bool red;
	final bool green;
	final bool blue;

	static MyColorInheritedScheme of(BuildContext context) {
		final MyColorInheritedScheme? result = context.dependOnInheritedWidgetOfExactType<MyColorInheritedScheme>();
		assert(result != null, "Theme not found in context");
		return result!;
	};

	@override
	bool updateShouldNotify(MyColorInheritedScheme old) {
		return (red != old.red) || (green != old.green) || (blue != old.blue)
	}
}
