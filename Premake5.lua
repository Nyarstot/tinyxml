project "TinyXML"
    kind "StaticLib"
    language "C++"
    toolset "v143"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "TinyXML/include/tinystr.h",
        "TinyXML/include/tinystr.cpp",
        "TinyXML/include/tinyxml.h",
        "TinyXML/include/tinyxml.cpp",
        "TinyXML/include/tinyxmlerror.cpp",
        "TinyXML/include/tinyxmlparser.cpp"
    }

    filter "system:windows"
        systemversion "latest"

        defines
        {
           -- "DTIXML_USE_STL"
        }

    filter "system:linux"
        pic "On"
        systemversion "latest"

        defines
        {
           -- "TIXML_USE_STL"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"