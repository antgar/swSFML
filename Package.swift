import PackageDescription

let package = Package (
name: "swSFML",
        dependencies: [
		      .Package(url: "https://github.com/Scellow/swsfml_graphics.git", majorVersion:1),
		      .Package(url: "https://github.com/Scellow/swsfml_system.git", majorVersion:1),
		      .Package(url: "https://github.com/Scellow/swsfml_window.git", majorVersion:1),
		      .Package(url: "https://github.com/Scellow/swsfml_audio.git", majorVersion:1),
		      .Package(url: "https://github.com/Scellow/swsfml_network.git", majorVersion:1),
		      ]
	 )