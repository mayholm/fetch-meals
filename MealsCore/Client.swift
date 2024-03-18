import Combine
import Foundation
import UIKit

let apiURLString = "https://themealdb.com/api/json/v1/1/"
let dessertsURL = URL(string: apiURLString + "filter.php?c=Dessert")!

func lookupURL(id: String) -> URL {
    return URL(string: apiURLString + "lookup.php?i=\(id)")!
}

public protocol MealsAPI {
    func fetchDesserts() async throws -> [Meal]
    func fetchMealDetails(id: String) async throws -> MealDetailed
}

public class Client: MealsAPI {
    public init() { }

    private let jsonDecoder = JSONDecoder()

    public func fetchDesserts() async throws -> [Meal] {
        let (data, _) = try await URLSession.shared.data(from: dessertsURL)
        return try self.jsonDecoder.decode(MealsDTO.self, from: data).meals
    }

    public func fetchMealDetails(id: String) async throws -> MealDetailed {
        let (data, _) = try await URLSession.shared.data(from: lookupURL(id: id))
        return try jsonDecoder.decode(MealsDetailedDTO.self, from: data).meals[0].toMealDetailed()
    }
}

public func fetchImage(url: URL) async throws -> UIImage {
    let (data, _) = try await URLSession.shared.data(from: url)
    return try UIImage(data: data).unwrap()
}
