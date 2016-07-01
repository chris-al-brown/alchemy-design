<center> 
    <h1>AlchemyDesign</h1> 
</center>

<p align="center">
    <img src="https://img.shields.io/badge/platform-osx-lightgrey.svg" alt="Platform">
    <img src="https://img.shields.io/badge/language-swift-orange.svg" alt="Language">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
</p>

<p align="center">
    <a href="#requirements">Requirements</a>
    <a href="#installation">Installation</a>
    <a href="#usage">Usage</a>
    <a href="#references">References</a>
    <a href="#license">License</a>
</p>

AlchemyDesign is a Swift package for generative and inverse problem design

## Requirements

- Xcode
    - Version: **8.0 beta (8S128d)**
    - Language: **Swift 3.0**
- OS X
    - Latest SDK: **macOS 10.12**
    - Deployment Target: **OS X 10.10**

## Installation

Install using the [Swift Package Manager](https://swift.org/package-manager/)

Add the project as a dependency to your Package.swift:

```swift
import PackageDescription

let package = Package(
    name: "MyProjectUsingAlchemyDesign",
    dependencies: [
        .Package(url: "https://github.com/chris-al-brown/alchemy-design", majorVersion: 0, minor: 1)
    ]
)
```

Then import `import AlchemyDesign`.

## Usage

Check out 'Demo.playground' for example usage.

## References

1. [Generative Gestaltung](http://www.generative-gestaltung.de)

## License

AlchemyDesign is released under the [MIT License](LICENSE.md).
