import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController

    // Force default size and position, ignoring macOS saved window state
    let targetSize = NSSize(width: 1024, height: 768)
    self.setContentSize(targetSize)
    self.setFrameAutosaveName("")
    self.center()

    // Set a minimum window size so the layout cannot break
    self.minSize = NSSize(width: 400, height: 600)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
