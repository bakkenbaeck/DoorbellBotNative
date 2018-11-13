import Foundation
import ScriptyCore

do {
  try Scripty.run()
} catch {
  debugPrint("Error: \(error)")
  exit(1)
}
