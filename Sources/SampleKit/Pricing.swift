public struct PricingService: Sendable {
    public let vipDiscount: Double

    public init(vipDiscount: Double = 0.10) {
        self.vipDiscount = vipDiscount
    }

    public func total(for order: Order) -> Double {
        order.subtotal
    }

    public func discountedTotal(for order: Order, customer: Customer) -> Double {
        let base = total(for: order)
        if customer.email.hasSuffix("@example.com") {
            return base * (1 - vipDiscount)
        }
        return base
    }
}
