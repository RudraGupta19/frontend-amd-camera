import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController
    self.setContentSize(NSSize(width: 992, height: 744))
    self.minSize = NSSize(width: 992, height: 744)
    self.maxSize = NSSize(width: 992, height: 744)
    self.aspectRatio = NSSize(width: 4, height: 3)
    self.styleMask.remove(.resizable)
    self.center()

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
