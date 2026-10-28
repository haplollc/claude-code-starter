public protocol Notifier: Sendable {
    func notify(_ message: String)
}

public struct ConsoleNotifier: Notifier {
    public init() {}

    public func notify(_ message: String) {
        print(message)
    }
}

public struct EmailNotifier: Notifier {
    public let sender: String

    public init(sender: String) {
        self.sender = sender
    }

    public func notify(_ message: String) {
        let formatted = "From: \(sender)\n\n\(message)"
        print(formatted)
    }
}
