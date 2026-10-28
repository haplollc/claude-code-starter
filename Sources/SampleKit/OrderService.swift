public struct OrderService: Sendable {
    public var store: OrderStore
    public let pricing: PricingService
    public let notifier: any Notifier

    public init(store: OrderStore = OrderStore(), pricing: PricingService = PricingService(), notifier: any Notifier = ConsoleNotifier()) {
        self.store = store
        self.pricing = pricing
        self.notifier = notifier
    }

    public mutating func placeOrder(_ order: Order, for customer: Customer) -> Double {
        let charged = pricing.discountedTotal(for: order, customer: customer)
        var placed = order
        placed.status = .paid
        store.save(placed)
        notifier.notify("Order \(order.id) placed for \(customer.name), charged \(charged).")
        return charged
    }

    public func totalSpent(by customer: Customer) -> Double {
        store.orders(forCustomerID: customer.id)
            .map { pricing.total(for: $0) }
            .reduce(0, +)
    }
}
