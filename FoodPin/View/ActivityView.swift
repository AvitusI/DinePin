//
//  ActivityView.swift
//  FoodPin
//
//  Created by MacMini on 23/03/2025.
//

// This is a Swift file

import Foundation
import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> some UIActivityViewController {
        let activitycontroller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return activitycontroller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
