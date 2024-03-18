import Combine
import MealsCore
import SwiftUI

struct MealsList: View {
    @ObservedObject var viewModel: DessertsViewModel

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.desserts.value == nil,
                   let error = viewModel.desserts.error {
                    Text(error.localizedDescription)
                } else {
                    let desserts = viewModel.desserts.value ?? mockMeals

                    List(desserts) { dessert in
                        NavigationLink {
                            MealDetailsView(
                                mealID: dessert.id,
                                viewModel: viewModel
                            )
                            .navigationTitle(dessert.name)
                            .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            MealRow(meal: dessert).loading(viewModel.desserts.isLoading)
                        }
                        .disabled(viewModel.desserts.isLoading)
                    }
                    .refreshable {
                        await viewModel.updateDesserts()
                    }
                }
            }
            .navigationTitle("Desserts")
        }
        .task {
            await viewModel.updateDesserts()
        }
    }
}

struct MealRow: View {
    let meal: Meal
    @State var image: Loaded<UIImage> = .loading()

    var body: some View {
        HStack {
            HStack {
                if let image = image.value {
                    Image(uiImage: image).resizable()
                }
            }
            .frame(width: 50, height: 50)
            .background(Color(uiColor: .quaternarySystemFill))
            .clipShape(.rect(cornerRadius: 5))

            Text(meal.name)
        }
        .task {
            await image.load { try await fetchImage(url: meal.thumbnailURL) }
        }
    }
}

#Preview {
    MealsList(viewModel: DessertsViewModel())
}
