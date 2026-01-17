//
//  ContentView.swift
//  FoodPin
//
//  Created by MacMini on 22/03/2025.
//

import SwiftUI

struct RestaurantListView: View {
    
    //  @State var restaurantIsFavorites = Array(repeating: false, count: 21)

    @State var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isFavorite: false, phone: "+852 1234 5678", description: "A cozy corner cafe offering freshly brewed coffee and homemade pastries. Perfect for a quiet morning or catching up with friends."),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isFavorite: false, phone: "+852 2345 6789", description: "A hidden gem known for its warm ambiance, great coffee, and delightful breakfast options. Loved by both locals and tourists."),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false, phone: "+852 3456 7890", description: "Serving artisan teas and light snacks, this charming tea house offers a peaceful escape from the bustling city streets."),
        Restaurant(name: "Cafe Loisl", type: "Austrian / Casual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false, phone: "+852 4567 8901", description: "A slice of Vienna in Hong Kong, offering traditional Austrian pastries, strong coffee, and a laid-back, artsy vibe."),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false, phone: "+852 5678 9012", description: "A small, elegant French bistro specializing in fresh oysters, seafood, and classic French dishes with a modern twist."),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee", isFavorite: false, phone: "+852 6789 0123", description: "A neighborhood favorite, serving freshly baked bread, hearty breakfast platters, and comforting local favorites."),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false, phone: "+852 7890 1234", description: "An artisan bakery famous for its unique bread varieties, pastries, and minimalist yet inviting interior."),
        Restaurant(name: "Bourke Street Bakery", type: "Chocolate", location: "Hong Kong", image: "bourkestreetbakery", isFavorite: false, phone: "+852 8901 2345", description: "Sydney’s renowned bakery brings its rich, handcrafted chocolates and rustic pastries to Hong Kong."),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh", isFavorite: false, phone: "+61 2 1234 5678", description: "An iconic chocolate cafe known for its rich, velvety truffles, hot chocolate, and indulgent desserts."),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false, phone: "+61 2 2345 6789", description: "A trendy spot combining American-style breakfast and fresh seafood, served with expertly crafted espresso."),
        Restaurant(name: "Upstate", type: "American", location: "Sydney", image: "upstate", isFavorite: false, phone: "+61 2 3456 7890", description: "Famous for its hearty burgers, crispy fries, and laid-back vibe, making it a go-to for comfort food lovers."),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false, phone: "+1 212 123 4567", description: "A vibrant, eclectic restaurant serving bold American flavors with global influences in a lively setting."),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false, phone: "+1 212 234 5678", description: "A classic deli known for its hearty sandwiches, breakfast platters, and welcoming, old-school charm."),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false, phone: "+44 20 1234 5678", description: "A traditional British pub offering a selection of ales, comforting pub grub, and a lively, friendly atmosphere."),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false, phone: "+44 20 2345 6789", description: "A fusion pub combining classic British beers with Thai-inspired dishes, creating a unique dining experience.")
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants.indices, id: \.self) { index in
                    // ZStack + EmptyView for removing disclosure indicators
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: RestaurantDetailView(restaurant: restaurants[index])) {
                            EmptyView()
                        }
                        .opacity(0)
                            
                        BasicTextImageRow(
                                restaurant: $restaurants[index]
                        )
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                    
                            } label: {
                                Image(systemName: "heart")
                            }
                            .tint(.green)
                                
                            Button {
                                    
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                            }
                            .tint(.orange)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    restaurants.remove(atOffsets: indexSet)
                })
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .tint(.white)
    }
}

#Preview {
    RestaurantListView()
}

#Preview("Dark mode") {
    RestaurantListView()
        .preferredColorScheme(.dark)
}

struct BasicTextImageRow: View {
    
    // MARK: - State variables
    @State private var showOptions = false
    @State private var showError = false
    
    // MARK: - Binding
    @Binding var restaurant: Restaurant
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 118)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                    //.font(.custom("Nunito-Regular", size: 25))
                
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
            }
            
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .contextMenu {
            
            Button(action: {
                self.showError.toggle()
            }) {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            
            Button(action: {
                self.restaurant.isFavorite.toggle()
            }) {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
            
            Button(action: {
                self.showOptions.toggle()
            }) {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .alert("Not yet available", isPresented: $showError) {
            Button("OK") {}
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
        .sheet(isPresented: $showOptions) {
            let defaultText = "Just checking in at \(restaurant.name)"
            
            if let imageToShare = UIImage(named: restaurant.image) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            }
        }
    }
}

struct FullImageRow: View {
    
    var imageName: String
    var name: String
    var type: String
    var location: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(.title2, design: .rounded))
                
                Text(type)
                    .font(.system(.body, design: .rounded))
                
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}
