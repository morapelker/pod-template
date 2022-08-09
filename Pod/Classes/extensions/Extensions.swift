//
//  Extensions.swift
//  TedoooChatScreen
//
//  Created by Mor on 29/07/2022.
//

import Foundation

extension UIEdgeInsets {

    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }

    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

}

extension String {

    var capFirstWord: String {
        prefix(1).capitalized + dropFirst()
    }

    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }

}

extension Date {
    var milliseconds: Int64 {
        Int64(timeIntervalSince1970 * 1000)
    }

    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

enum DelayedResult<T> {
    case loading
    case success(_ result: T)
    case failure
}

class GPHelper {
    
    public static func presentActivityViewController(from parent: UIViewController, activityViewController: UIActivityViewController) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popover = activityViewController.popoverPresentationController {
                popover.sourceRect = .init(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
                popover.sourceView = parent.view
                popover.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
                parent.present(activityViewController, animated: true, completion: nil)
            }
        } else {
            parent.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    public static func displayActionSheet(alert: UIAlertController, presentor: UIViewController) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popoverController = alert.popoverPresentationController {
                alert.modalPresentationStyle = .popover
                popoverController.sourceView = presentor.view //to set the source of your alert
                popoverController.sourceRect = CGRect(x: presentor.view.bounds.midX, y: presentor.view.bounds.midY, width: 0, height: 0) // you can set this as per your requirement.
                popoverController.permittedArrowDirections = [] //to hide the arrow of any particular direction
                presentor.present(alert, animated: true, completion: nil)
            }
        } else {
            presentor.present(alert, animated: true, completion: nil)
        }
    }
}

