include "../../premake/common_premake_defines.lua"

project "NanoSVG"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"
	tags { "use_header_only_mle" }

	files {
		"./src/*.h",
		"./*.cpp"
	}

	includedirs {
		"%{IncludeDir.nanosvg}"
	}

	filter "toolset:msc"
		disablewarnings { "4244" }