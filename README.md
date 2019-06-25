# xcframeworks
Demonstration of creating and integrating xcframeworks and their co-op with static libraries and Swift packages


## Pre-requisities
- Xcode 11
- command line tools set to Xcode 11 beta, command line tools can be changed in Xcode or by running command xcode-select -s path/to/Xcode/beta in terminal.
- Github/Gitlab/Bitbucket account set in Xcode's account preferences

# Xcode workspace description

`XCFrameworks` workspace consists of:
- `StaticLibrary` project - represents static library project
- `DynamicFramework` project - represents project that builds dylib
- `Package` - Swift Package

- `Sample` - Sample project that includes all of the above + `TextAttributes` remote Swift Package.

# .xcframeworks generation
The archiving and creating of `.xcframeworks` is excercised by `create_xcframeworks.sh` script.
This script takes 1 parameter that defines output directory.
`Output directory` will create subfolder for `archives` and `xcframeworks`.

The script will archive the `StaticLibrary`, archive & create .xcframework for `DynamicFramework`.

`Usage`

```
create_xcframeworks.sh Products
```
