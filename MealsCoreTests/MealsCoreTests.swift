import Foundation
import XCTest
@testable import MealsCore

let testBundle = Bundle(for: MealsCoreTests.self)

class MealsCoreTests: XCTestCase {

    let client = Client()

    func testNullEmptyMealDetailValues() throws {
        let mealResourceURL = testBundle.url(forResource: "meal_detailed", withExtension: "json")!
        let mealJSON = try! Data(contentsOf: mealResourceURL)
        let decoder = JSONDecoder()
        let result = try! decoder.decode(MealsDetailedDTO.self, from: mealJSON)
        guard let meal = result.meals.first?.toMealDetailed() else {
            XCTFail()
            return
        }
        XCTAssert(meal.ingredients.count == 9)
        XCTAssert(meal.measures.count == 9)
    }
}
