[![CI Status](http://img.shields.io/travis/Lazar Otasevic/RHBCombinatorics.svg?style=flat)](https://travis-ci.org/Lazar Otasevic/RHBCombinatorics)
[![Version](https://img.shields.io/cocoapods/v/RHBCombinatorics.svg?style=flat)](http://cocoapods.org/pods/RHBCombinatorics)
[![License](https://img.shields.io/cocoapods/l/RHBCombinatorics.svg?style=flat)](http://cocoapods.org/pods/RHBCombinatorics)
[![Platform](https://img.shields.io/cocoapods/p/RHBCombinatorics.svg?style=flat)](http://cocoapods.org/pods/RHBCombinatorics)

## Looping trough combinations made easy

Following snippet:

        let combinatons = RHBCombinations(N: 4, K: 3)
        (0..<combinatons.count).forEach {
            
            print($0, combinatons[$0])
        }
Produces following output:

```ruby
0 [0, 1, 2]
1 [0, 1, 3]
2 [0, 2, 3]
3 [1, 2, 3]
```

## Installation

RHBCombinatorics is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RHBCombinatorics"
```

## Author

Lazar Otasevic, redhotbits@gmail.com

## License

RHBCombinatorics is available under the MIT license. See the LICENSE file for more info.
