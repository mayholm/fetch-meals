extension Optional {
    public struct UnwrapError: Error {
        public init() { }
    }
    
    public func unwrap(orThrow error: Error = UnwrapError()) throws -> Wrapped {
        switch self {
        case .some(let value): value
        case .none: throw error
        }
    }
}
