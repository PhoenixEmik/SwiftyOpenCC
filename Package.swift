// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SwiftyOpenCC",
    products: [
        .library(
            name: "OpenCC",
            targets: ["OpenCC"]),
    ],
    targets: [
        .target(
            name: "OpenCC",
            dependencies: ["copencc"],
            resources: [
                .copy("Dictionary")
            ]),
        .testTarget(
            name: "OpenCCTests",
            dependencies: ["OpenCC"],
            resources: [
                .copy("benchmark"),
                .copy("testcases"),
            ]),
        .target(
            name: "copencc",
            dependencies: ["cmarisa"],
            exclude: [
                "src/benchmark",
                "src/tools",
                "src/pyd",
                "src/BinaryDictTest.cpp",
                "src/Config.cpp",
                "src/ConfigTest.cpp",
                "src/ConversionChainTest.cpp",
                "src/ConversionTest.cpp",
                "src/DartsDictTest.cpp",
                "src/DictGroupTest.cpp",
                "src/MarisaDictTest.cpp",
                "src/MaxMatchSegmentationTest.cpp",
                "src/PhraseExtractTest.cpp",
                "src/SerializedValuesTest.cpp",
                "src/SimpleConverter.cpp",
                "src/SimpleConverterTest.cpp",
                "src/TextDictTest.cpp",
                "src/UTF8StringSliceTest.cpp",
                "src/UTF8UtilTest.cpp",
                "src/LexiconAnnotationTest.cpp",
                "src/ConversionInspectionTest.cpp",
                "deps/google-benchmark",
                "deps/googletest-1.15.0",
                "deps/pybind11-2.13.1",
                "deps/rapidjson-1.1.0",
                "deps/tclap-1.2.5",

                "src/CmdLineOutput.hpp",
                "src/Config.hpp",
                "src/ConfigTestBase.hpp",
                "src/DictGroupTestBase.hpp",
                "src/SimpleConverter.hpp",
                "src/TestUtils.hpp",
                "src/TestUtilsUTF8.hpp",
                "src/TextDictTestBase.hpp",
                "src/py_opencc.cpp",
                "src/opencc_config.h",
                "src/opencc_config.h.in",
                "src/version.rc.in",

                // ???
                "src/README.md",
                "src/CMakeLists.txt",
                "src/BUILD.bazel",
                "deps/marisa-0.3.1/AUTHORS",
                "deps/marisa-0.3.1/CMakeLists.txt",
                "deps/marisa-0.3.1/COPYING.md",
                "deps/marisa-0.3.1/README.md",
            ],
            sources: [
                "source.cpp",
                "src",
            ],
            cxxSettings: [
                .headerSearchPath("src"),
                .headerSearchPath("configure"),
                .headerSearchPath("deps/darts-clone-0.32"),
                .headerSearchPath("deps/marisa-0.3.1/include"),
                .headerSearchPath("deps/marisa-0.3.1/lib"),
            ]),
        .target(
            name: "cmarisa",
            path: "OpenCC/deps/marisa-0.3.1/lib",
            sources: [
                "marisa",
            ],
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("../include"),
            ]),
    ],
    cxxLanguageStandard: .cxx17
)
