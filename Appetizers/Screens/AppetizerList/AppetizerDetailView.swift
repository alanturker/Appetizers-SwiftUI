//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Turker Alan on 3.01.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 80, height: 242)
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 30) {
                    NutritionInfoView(title: "Calories", value: appetizer.calories)
                    NutritionInfoView(title: "Carbs", value: appetizer.carbs)
                    NutritionInfoView(title: "Protein", value: appetizer.protein)
                }
                .padding()
            }
            
            Spacer()
            Button {
                order.add(appetizer)
                isShowingDetailView = false
            } label: {
//                APButton(price: appetizer.price)
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
        }
        .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height - 300)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetailView = false
            } label: {
                XDismissButton()
            }
           
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(true))
}

struct NutritionInfoView: View {
    var title: String
    var value: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(Color.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
