# Swifty Open Chinese Convert

[![GitHub CI Status](https://github.com/ddddxxx/SwiftyOpenCC/workflows/CI/badge.svg)](https://github.com/ddddxxx/SwiftyOpenCC/actions)
![platforms](https://img.shields.io/badge/platforms-Linux%20%7C%20macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg)
[![codebeat badge](https://codebeat.co/badges/39f17620-4f1c-4a46-b3f9-8f5b248ac28f)](https://codebeat.co/projects/github-com-ddddxxx-swiftyopencc-master)

Swift port of [Open Chinese Convert](https://github.com/BYVoid/OpenCC), currently vendoring OpenCC 1.4.2.

## Requirements

- macOS 10.10+ / iOS 8.0+ / tvOS 9.0+ / watchOS 2.0+
- Swift 5.4+

## Usage

### Quick Start

```swift
import OpenCC

let str = "鼠标里面的硅二极管坏了，导致光标分辨率降低。"
let converter = try! ChineseConverter(options: [.traditionalize, .twStandard, .twIdiom])
converter.convert(str)
// 滑鼠裡面的矽二極體壞了，導致游標解析度降低。
```

## Documentation

[GitHub Pages](http://ddddxxx.github.io/SwiftyOpenCC) (100% Documented)

## Build Your Own

1. Install requirements

    ```shell
    brew install cmake doxygen
    ```

2. Check out the desired OpenCC submodule tag, for example `ver.1.4.2`

   ```shell
   cd OpenCC
   git fetch upstream tag ver.1.4.2 --tags
   git checkout ver.1.4.2
   cd ..
   ```

3. Make OpenCC

   ```shell
   cd OpenCC
   make
   ```

4. Copy the generated `*.ocd2` dictionaries to `./Sources/OpenCC/Dictionary/`

   ```shell
   cd ..
   cp ./OpenCC/build/rel/data/*.ocd2 ./Sources/OpenCC/Dictionary/
   ```

5. Update `Package.swift` and `Sources/OpenCC/DictionaryName.swift` if the OpenCC source layout or dictionary set changed.

6. Run tests

   ```shell
   swift test
   ```

## License

SwiftyOpenCC is available under the MIT license. See the [LICENSE file](LICENSE).
