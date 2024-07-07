void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("NanoSVG");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE.txt");
	properties.tags("use_header_only_mle");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./src"
	});

	properties.files({
		"./src/*.h",
		"./*.cpp"
	});

	{
		MultiBuild::ScopedFilter _(workspace, "project.compiler:VisualCpp");
		properties.disable_warnings("4244");
	}
}