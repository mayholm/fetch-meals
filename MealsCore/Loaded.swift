public enum Loaded<Value> {
    case loading(loaded: Value? = nil)
    case loaded(Value)
    case failed(Error, loaded: Value? = nil)
}

extension Loaded {
    public var error: Error? {
        switch self {
        case .failed(let error, _): error
        case .loading, .loaded: nil
        }
    }

    public var isLoading: Bool {
        switch self {
        case .loading: true
        case .loaded, .failed: false
        }
    }

    public var value: Value? {
        switch self {
        case .loaded(let value), .loading(let value?): value
        case .failed(_, let value?): value
        case .loading, .failed: nil
        }
    }
}

extension Loaded {
    public mutating func load(_ closure: () async throws -> Value) async {
        update(with: await Result(closure))
    }

    public mutating func update(with result: Result<Value, Error>) {
        switch result {
        case .success(let value): self = .loaded(value)
        case .failure(let error): self = .failed(error, loaded: value)
        }
    }
}


