# NativePopup

![platforms](https://img.shields.io/badge/platforms-iOS-333333.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/mono0926/NativePopup/master/LICENSE)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Language: Swift](https://img.shields.io/badge/swift-3.1-4BC51D.svg?style=flat)](https://developer.apple.com/swift)

`NativePopup` is clone of Apple iOS AppStore review feedback popup.

NativePopup clones native popup's design and behavior(animation and user interaction).
And you can use custom image and emoji in addition to bad/good icons.

# Compared with Apple original popups.

NativePopup | Original
--- | ---
![NativePopup Done](https://github.com/mono0926/Resource/raw/master/NativePopup/GIF/done_np.gif) | ![Original Done](https://github.com/mono0926/Resource/raw/master/NativePopup/GIF/done.gif)
![NativePopup Good](https://github.com/mono0926/Resource/raw/master/NativePopup/GIF/good_np.gif) | ![Original Good](https://github.com/mono0926/Resource/raw/master/NativePopup/GIF/good.gif)



# Examples

## Good/Bad

Good | Bad 
--- | --- 
![good](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/NativePopup/good.png) | ![bad](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/NativePopup/bad.png)

## Custom Image/Emoji

Custom Image | Emoji
--- | ---
![custome image](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/NativePopup/custom_image.png) | ![bad](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/NativePopup/emoji.png)

# Usage

Very simple to use NativePopup🐶


```swift
// Good
NativePopup.show(image: Preset.Feedback.good,
                 title: "Helpful",
                 message: "Thanks for your feedback.")
// Bad
NativePopup.show(image: Preset.Feedback.bad,
                 title: "Not Helpful",
                 message: "Thanks for your feedback.")
// Custom Image
NativePopup.show(image: UIImage(named: "love")!,
                 title: "参考になった",
                 message: "フィードバックをありがとう\nございました。")
// Emoji
NativePopup.show(image: Character("🐶"),
                 title: "イッヌ",
                 message: "絵文字対応したワン")
// Title only
NativePopup.show(image: Preset.Feedback.good,
                 title: "Empty Message 🗑",
                 message: nil)
// Custom duration (default duration is 1.5 seconds)
NativePopup.show(image: Character("🔟"),
                    title: "10 seconds",
                    message: "Long duration🙇",
                    duration: 10)
// Like Apple Music
NativePopup.show(image: Preset.Feedback.done,
                 title: "Added to Library",
                 message: nil,
                 initialEffectType: .fadeIn)
```


`image` accepts `ImageConvertible` protocol.

```swift
public enum Image {
    case image(UIImage)
    case emoji(Character)

    func validate() {
        switch self {
        case .image(let image):
            assert(image.size.width == image.size.height, "Aspect ratio should be 1:1.")
        case .emoji:
            // MEMO: should check?
            break
        }
    }
}

public protocol ImageConvertible {
    var npImage: Image { get }
}
```

`UIImage` and `Character` conforms to `ImageConvertible` by default.

```swift
extension UIImage: ImageConvertible {
    public var npImage: Image { return .image(self) }
}

extension Character: ImageConvertible {
    public var npImage: Image { return .emoji(self) }
}
```

You can define custom preset image as below.

```swift
extension NativePopup {
    public struct Preset {
        private init() {}
        public enum Feedback: String, ImageConvertible {
            case
            good,
            bad

            public var npImage: Image {
                return .image(UIImage.init(nativePopupNamed: "feedback_\(rawValue)"))
            }
        }
    }
}
```

**Image size should be 112 x 112.**

# Installation

You can install by [Carthage](https://github.com/Carthage/Carthage) or add [NativePopup sources](https://github.com/mono0926/NativePopup/tree/master/NativePopup) manually.

## [Carthage](https://github.com/Carthage/Carthage)

Add this to Cartfile

```
github "mono0926/NativePopup"
```

```sh
$ carthage update
```
