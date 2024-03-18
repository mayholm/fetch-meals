import Dispatch
import Combine
import MealsCore

@MainActor
class DessertsViewModel: ObservableObject {
    @Published var desserts: Loaded<[Meal]> = .loading()

    private let client = Client()

    func updateDesserts() async {
        desserts = .loading(loaded: desserts.value)
        let dessertsResult = await Result(client.fetchDesserts)
        desserts.update(with: dessertsResult)
    }

    func fetchDessertDetailed(id: String) async throws -> MealDetailed {
        return try await client.fetchMealDetails(id: id)
    }
}
