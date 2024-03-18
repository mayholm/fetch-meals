import MealsCore
import SwiftUI

@main
struct MealsApp: App {
    var body: some Scene {
        WindowGroup {
            MealsList(viewModel: DessertsViewModel())
        }
    }
}
