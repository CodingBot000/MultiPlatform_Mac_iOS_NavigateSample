//
//  Extensions.swift
//  MultiPlaformSample
//
//  Created by switchMac on 11/19/24.
//

import SwiftUI

extension NavigationPath {
    mutating func appendRoute(_ route: AnyHashable) {
        if let viewIdentifier = route as? ViewIdentifier {
            self.append(viewIdentifier)
        } else if let viewIdentifier2 = route as? ViewIdentifier2 {
            self.append(viewIdentifier2)
        } else {
            print("Unsupported route type: \(route)")
        }
    }
}
