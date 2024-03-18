import MealsCore
import SwiftUI

struct MealDetailsView: View {
    let mealID: String
    let viewModel: DessertsViewModel

    @State private var meal: Loaded<MealDetailed> = .loading()
    @State private var image: Loaded<UIImage> = .loading()

    var body: some View {
        ScrollView {
            Image(uiImage: image.value ?? UIImage(named: "meal_thumbnail")!)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 300)
                .clipped()
                .loading(image.isLoading)

            VStack(alignment: .leading, spacing: 20) {
                if let error = meal.error {
                    Text(error.localizedDescription)
                } else {
                    let meal = meal.value ?? mockMealDetailed
                    TagsView(tags: [meal.area] + meal.tags)
                    IngredientsView(ingredients: meal.ingredients, measures: meal.measures)
                    InstructionsView(text: meal.instructions)
                }
            }
            .padding()
            .loading(meal.isLoading)
        }
        .task {
            await meal.load { try await viewModel.fetchDessertDetailed(id: mealID) }
            if let url = meal.value?.thumbnailURL {
                await image.load { try await fetchImage(url: url)}
            }
        }
    }
}

private struct IngredientsView: View {
    let ingredients: [String]
    let measures: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients").font(.headline)

            ForEach(0..<ingredients.count, id: \.self) { index in
                HStack {
                    Text(measures[index]).foregroundStyle(.green)
                    Text(ingredients[index])
                }
            }
        }
    }
}

private struct TagsView: View {
    let tags: [String]

    var body: some View {
        FlowStack(spacing: .init(width: 5, height: 5)) {
            ForEach(tags, id: \.self) { tag in
                Text(tag)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.yellow)
                    )
            }
        }
    }
}

private struct InstructionsView: View {
    let text: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions").font(.headline)

            VStack(alignment: .leading, spacing: 15) {
                let paragraphs = text.split(whereSeparator: \.isNewline)
                ForEach(0..<paragraphs.count, id: \.self) { index in
                    Text(paragraphs[index])
                }
            }
        }
    }
}

#Preview {
    MealDetailsView(mealID: "52893", viewModel: DessertsViewModel())
}
