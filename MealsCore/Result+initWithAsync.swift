extension Result where Failure == Error {
    public init(_ closure: () async throws -> Success) async {
        do {
            let value = try await closure()
            self = .success(value)
        } catch {
            self = .failure(error)
        }
    }
}
