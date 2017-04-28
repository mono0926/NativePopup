# NativePopup

Copy of Apple iOS AppStore review feedback popup.

NativePopup clones native popup's design and behavior(animation and user interaction).

## Original

Good | Bad
--- | ---
![good](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/Original/good.png) | ![bad](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/Original/bad.png)

## NativePopup

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
NativePopup.show(image: UIImage(named: "love")!,
                 title: "参考になった",
                 message: "フィードバックをありがとう\nございました。")
NativePopup.show(image: NativePopup.Preset.Feedback.good,
                 title: "Helpful",
                 message: "Thanks for your feedback.")
NativePopup.show(image: NativePopup.Preset.Feedback.bad,
                 title: "Not Helpful",
                 message: "Thanks for your feedback.")
NativePopup.show(image: NativePopup.Preset.Feedback.good,
                 title: "Empty Message 🗑",
                 message: nil)
NativePopup.show(image: Character("🐶"),
                 title: "イッヌ",
                 message: "絵文字対応したワン")
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
    var image: Image { get }
}
```

`UIImage` and `Character` conforms to `ImageConvertible` by default.

```swift
extension UIImage: ImageConvertible {
    public var image: Image { return .image(self) }
}

extension Character: ImageConvertible {
    public var image: Image { return .emoji(self) }
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

            public var image: Image {
                return .image(UIImage.init(nativePopupNamed: "feedback_\(rawValue)"))
            }
        }
    }
}
```