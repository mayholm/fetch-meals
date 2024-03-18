import Foundation

public struct Meal: Decodable, Identifiable, Hashable {
    public let id: String
    public let name: String
    public let thumbnailURL: URL

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
    }
}

public struct MealDetailed {
    public let area: String
    public let category: String
    public let id: String
    public let ingredients: [String]
    public let instructions: String
    public let measures: [String]
    public let name: String
    public let sourceURL: URL?
    public let tags: [String]
    public let thumbnailURL: URL?
    public let youtubeURL: URL?
}

public let mockMeals: [Meal] = [
    Meal(id: "52893", name: "Apple & Blackberry Crumble", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")!),
    Meal(id: "2", name: "Bakewell tart", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg")!),
    Meal(id: "3", name: "Banana Pancakes", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg")!),
    Meal(id: "4", name: "Chocolate Souffle", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/twspvx1511784937.jpg")!),
    Meal(id: "5", name: "Dundee cake", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/wxyvqq1511723401.jpg")!),
    Meal(id: "6", name: "Eccles Cakes", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/wtqrqw1511639627.jpg")!),
    Meal(id: "7", name: "Madeira Cake", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/urtqut1511723591.jpg")!),
    Meal(id: "8", name: "Peanut Butter Cookies", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/1544384070.jpg")!),
    Meal(id: "9", name: "Tunisian Orange Cake", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/y4jpgq1560459207.jpg")!),
]

public let mockMealDetailed = MealDetailed(
    area: "British",
    category: "Dessert",
    id: "52893",
    ingredients: [
        "Plain Flour",
        "Caster Sugar",
        "Butter",
        "Braeburn Apples",
        "Butter",
        "Demerara Sugar",
        "Blackberrys",
        "Cinnamon",
        "Ice Cream"
    ],
    instructions: "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
    measures: [
        "120g",
        "60g",
        "60g",
        "300g",
        "30g",
        "30g",
        "120g",
        "¼ teaspoon",
        "to serve"
    ],
    name: "Apple & Blackberry Crumble",
    sourceURL: URL(string: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble")!,
    tags: ["Pudding"],
    thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")!,
    youtubeURL: URL(string: "https://www.youtube.com/watch?v=4vhcOwVBDO4")!
)
