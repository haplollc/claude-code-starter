public struct OrderStore: Sendable {
    private var orders: [String: Order] = [:]

    public init() {}

    public mutating func save(_ order: Order) {
        orders[order.id] = order
    }

    public func order(id: String) -> Order? {
        orders[id]
    }

    public func allOrders() -> [Order] {
        Array(orders.values)
    }

    public func orders(forCustomerID customerID: String) -> [Order] {
        orders.values.filter { $0.customerID == customerID }
    }
}
