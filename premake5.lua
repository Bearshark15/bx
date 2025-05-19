include "../../Premake/common.lua"

project "bx"
	kind "StaticLib"
    location "."
	language "C++"
	cppdialect "C++20"
	exceptionhandling "Off"
	rtti "Off"

	defines "__STDC_FORMAT_MACROS"

	targetdir (dirs.build .. outputdir .. "/%{prj.name}")
    objdir (dirs.bin .. outputdir .. "/%{prj.name}")

	conformancemode "Yes"

	files {
		"include/bx/*.h",
		"include/bx/inline/*.inl",
		"src/*.cpp",
	}

	excludes {
		"src/amalgamated.cpp",
		"src/crtnone.cpp"
	}

	includedirs {
		"3rdparty",
		"include"
	}

    filter "configurations:Debug"
		defines "BX_CONFIG_DEBUG=1"

	filter "configurations:Release"
		defines "BX_CONFIG_DEBUG=0"

    filter "configurations:Retail"
		defines "BX_CONFIG_DEBUG=0"

	filter "action:vs*"
		buildoptions {
			"/Zc:__cplusplus",
			"/Zc:preprocessor"
		}
		defines "_CRT_SECURE_NO_WARNINGS"
        includedirs { "include/compat/msvc" }