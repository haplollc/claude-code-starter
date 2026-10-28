public struct Customer: Sendable, Hashable {
    public let id: String
    public let name: String
    public let email: String

    public init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}

public enum OrderStatus: Sendable, Hashable {
    case placed
    case paid
    case shipped
    case cancelled
}

public struct Order: Sendable, Hashable {
    public let id: String
    public let customerID: String
    public var status: OrderStatus
    public let itemPrices: [Double]

    public init(id: String, customerID: String, status: OrderStatus = .placed, itemPrices: [Double]) {
        self.id = id
        self.customerID = customerID
        self.status = status
        self.itemPrices = itemPrices
    }

    public var subtotal: Double {
        itemPrices.reduce(0, +)
    }
}
