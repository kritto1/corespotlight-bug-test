//
//  corespotlight_bug_testApp.swift
//  corespotlight-bug-test
//
//  Created by qitmacoo1526 on 2025/4/23.
//

import SwiftUI
import CoreSpotlight
import Foundation

@main
struct corespotlight_bug_testApp: App {
    init(){
        addToSpotlightIndex()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
}

struct QSpotlightItem {
    let id: String
    let title: String
    let contentDescription: String
    let thumbnailImage: Data?
    let keywords: [String]
}

@available(iOS 14, *)
func addItemToIndex(_ item: QSpotlightItem) {
    let attributeSet = CSSearchableItemAttributeSet(contentType: .item)
    attributeSet.title = item.title
    attributeSet.displayName = item.title
    attributeSet.contentDescription = item.contentDescription
    attributeSet.keywords = item.keywords
    attributeSet.thumbnailData = item.thumbnailImage
    attributeSet.contactKeywords = item.keywords
    attributeSet.supportsNavigation = true

    let searchableItem = CSSearchableItem(uniqueIdentifier: item.id, domainIdentifier: "com.qunar.iphone.spotlight", attributeSet: attributeSet)
    searchableItem.expirationDate = .distantFuture

    CSSearchableIndex.default().indexSearchableItems([searchableItem]) { error in
        if let error = error {
        } else {

        }
    }
}

@available(iOS 14, *)
func addToSpotlightIndex() {
    let spotlightHotel = QSpotlightItem(
                        id: "corespotlight_1",
                        title: "Search for hotel accommodation",
                        contentDescription: "",
                        thumbnailImage: UIImage(named: "img2")?.pngData(),
                        keywords: ["find", "welcome", "name"]
                    )
    addItemToIndex(spotlightHotel)
    
    let spotlightFlight = QSpotlightItem(
                        id: "corespotlight_2",
                        title: "Search and book air tickets",
                        contentDescription: "",
                        thumbnailImage: UIImage(named: "img2")?.pngData(),
                        keywords: ["find", "welcome", "name"]
                    )

    addItemToIndex(spotlightFlight)
    
    let spotlightSight = QSpotlightItem(
                        id: "corespotlight_3",
                        title: "Make inquiries about and book tickets for attractions",
                        contentDescription: "",
                        thumbnailImage: UIImage(named: "img2")?.pngData(),
                        keywords: ["find", "welcome", "name"]
                    )

    addItemToIndex(spotlightSight)
}
