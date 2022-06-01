workspace "TinyXML"
    architecture "x86_64"

    configurations
    {
        "Debug",
        "Release"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    project "TinyXML"
        location "TinyXML"
        kind "StaticLib"
        language "C++"
        toolset "v143"

        targetdir ("bin/" .. outputdir .. "/%{prj.name}")
        objdir ("int/" .. outputdir .. "/%{prj.name}")

        files
        {
            "%{prj.name}/include/**.h",
            "%{prj.name}/include/**.cpp"
        }

        includedirs
        {
            "%{prj.name}/include"
        }

        defines
        {
            "TIXML_USE_STL"
        }

        filter "system:windows"
            cppdialect "C++17"
            systemversion "latest"

        filter "system:linux"
            cppdialect "C++17"
            pic "On"
            systemversion "latest"

        filter "configurations:Debug"
            symbols "On"

        filter "configurations:Release"
            optimize "On"