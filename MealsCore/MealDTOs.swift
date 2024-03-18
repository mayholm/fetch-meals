import Foundation

struct MealsDTO: Decodable {
    let meals: [Meal]
}

struct MealsDetailedDTO: Decodable {
    let meals: [MealDetailedDTO]
}

struct MealDetailedDTO: Decodable {
    let area: String
    let category: String
    let id: String
    let instructions: String
    let name: String
    let sourceURLString: String?
    let tags: String?
    let thumbnailURLString: String
    let youtubeURLString: String

    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let ingredient16: String?
    let ingredient17: String?
    let ingredient18: String?
    let ingredient19: String?
    let ingredient20: String?

    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let measure16: String?
    let measure17: String?
    let measure18: String?
    let measure19: String?
    let measure20: String?

    enum CodingKeys: String, CodingKey {
        case area = "strArea"
        case category = "strCategory"
        case id = "idMeal"
        case instructions = "strInstructions"
        case name = "strMeal"
        case sourceURLString = "strSource"
        case tags = "strTags"
        case thumbnailURLString = "strMealThumb"
        case youtubeURLString = "strYoutube"

        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"

        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
    }

    func toMealDetailed() -> MealDetailed {
        // trims whitespace and returns nil if empty after
        func trim(_ string: String?) -> String? {
            let trimmed = string?.trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmed.flatMap { $0.isEmpty ? nil : $0 }
        }

        let ingredients = [
            trim(ingredient1),
            trim(ingredient2),
            trim(ingredient3),
            trim(ingredient4),
            trim(ingredient5),
            trim(ingredient6),
            trim(ingredient7),
            trim(ingredient8),
            trim(ingredient9),
            trim(ingredient10),
            trim(ingredient11),
            trim(ingredient12),
            trim(ingredient13),
            trim(ingredient14),
            trim(ingredient15),
            trim(ingredient16),
            trim(ingredient17),
            trim(ingredient18),
            trim(ingredient19),
            trim(ingredient20)
        ].compactMap { $0 }

        let measures = [
            trim(measure1),
            trim(measure2),
            trim(measure3),
            trim(measure4),
            trim(measure5),
            trim(measure6),
            trim(measure7),
            trim(measure8),
            trim(measure9),
            trim(measure10),
            trim(measure11),
            trim(measure12),
            trim(measure13),
            trim(measure14),
            trim(measure15),
            trim(measure16),
            trim(measure17),
            trim(measure18),
            trim(measure19),
            trim(measure20)
        ].compactMap { $0 }

        return MealDetailed(
            area: area,
            category: category,
            id: id,
            ingredients: ingredients,
            instructions: instructions,
            measures: measures,
            name: name,
            sourceURL: sourceURLString.flatMap { URL(string: $0) },
            tags: (tags ?? "").split(separator: ",").map(String.init),
            thumbnailURL: URL(string: thumbnailURLString),
            youtubeURL: URL(string: youtubeURLString)
        )
    }
}
