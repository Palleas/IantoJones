# IantoJones

Ianto Jones is a Swift framework to add a control panel into your application.

## Installation 

You can use Carthage, drop `github "Palleas/IantoJones"` in your Cartfile and run `carthage update`. You can also
use Cocoapods, add `pod "IantoJones"` in your Podfile and run `pod install`. This is a framework so it's iOS 8 only.

## Basic Usage

```swift
import IantoJones

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    let panel = IantoJones()
    panel.registerPanel("Environment", panel: Values(["Dev", "Preprod", "Production"]), preferenceKey: "env")
    panel.installInViewController(window!.rootViewController)
}
```

## License 

See [License file](LICENSE), but I'm pretty sure I went for MIT.
