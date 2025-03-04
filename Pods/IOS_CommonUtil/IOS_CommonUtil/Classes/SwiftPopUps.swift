//
//  SwiftPopUps.swift
//  IOS_CommonUtil
//
//  Created by JD on 8/21/20.
//

import UIKit

/**
 Extension of UIViewController to conveniently show an alert or action sheet with a single line of code. Please note that these methods must be called from a UIViewController instance.
 */
extension UIViewController {
    
    // MARK: - Alert Style
    /**
     Present a title-only alert controller and an OK button to dissmiss the alert.
     - parameter title: The title of the alert.
     */
    public func showAlertWithTitle(_ title: String?) {
        showAlert(title, message: nil, cancelButtonTitle: "_Ok".translate())
    }
    
    /**
     Present a message-only alert controller and an OK button to dissmiss the alert.
     - parameter message: The message content of the alert.
     */
    public func showAlertWithMessage(_ message: String?) {
        showAlert("", message: message, cancelButtonTitle: "_Ok".translate())
    }
    
    /**
     Present an alert controller with a title, a message and an OK button. Tap the OK button will dissmiss the alert.
     - parameter title: The title of the alert.
     - parameter message: The message content of the alert.
     */
    public func showAlert(_ title: String?, message: String?) {
        showAlert(title, message: message, cancelButtonTitle: "_Ok".translate())
    }
    
    /**
     Present an alert controller with a title, a message and a cancel/dismiss button with a title of your choice.
     - parameter title: The title of the alert.
     - parameter message: The message content of the alert.
     - parameter cancelButtonTitle: Title of the cancel button of the alert.
     */
    public func showAlert(_ title: String?, message: String?, cancelButtonTitle: String) {
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        showAlert(title, message: message, alertActions: [cancelAction])
    }
    
    /**
     Present an alert controller with a title, a message and an array of handler actions.
     - parameter title: The title of the alert.
     - parameter message: The message content of the alert.
     - parameter alertActions: An array of alert action in UIAlertAction class.
     */
    public func showAlert(_ title: String?, message: String?, alertActions: [UIAlertAction]) {
        showAlert(title, message: message, preferredStyle: .alert, alertActions: alertActions)
    }
    
    // MARK: - Action Sheet Style
    /**
     Present a title-only action sheet and an OK button to dissmiss the alert.
     - parameter title: The title of the action sheet.
     */
    public func showActionSheetWithTitle(_ title: String?) {
        showActionSheet(title, message: nil, cancelButtonTitle: "_Ok".translate())
    }
    
    /**
     Present a message-only action sheet and an OK button to dissmiss the alert.
     - parameter message: The message content of the action sheet.
     */
    public func showActionSheetWithMessage(_ message: String?) {
        showActionSheet(nil, message: message, cancelButtonTitle: "_Ok".translate())
    }
    
    /**
     Present an action sheet with a title, a message and an OK button. Tap the OK button will dissmiss the alert.
     - parameter title: The title of the action sheet.
     - parameter message: The message content of the action sheet.
     */
    public func showActionSheet(_ title: String?, message: String?) {
        showActionSheet(title, message: message, cancelButtonTitle: "_Ok".translate())
    }
    
    /**
     Present an action sheet with a title, a message and a cancel/dismiss button with a title of your choice.
     - parameter title: The title of the action sheet.
     - parameter message: The message content of the action sheet.
     - parameter cancelButtonTitle: The title of the cancel button of the action sheet.
     */
    public func showActionSheet(_ title: String?, message: String?, cancelButtonTitle: String) {
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        showActionSheet(title, message: message, alertActions: [cancelAction])
    }
    
    /**
     Present an action sheet with a title, a message and an array of handler actions.
     - parameter title: The title of the action sheet.
     - parameter message: The message content of the action sheet.
     - parameter alertActions: An array of alert actions in UIAlertAction class.
     */
    public func showActionSheet(_ title: String?, message: String?, alertActions: [UIAlertAction]) {
        showAlert(title, message: message, preferredStyle: .actionSheet, alertActions: alertActions)
    }
    
    // MARK: - Common Methods
    /**
     Present an alert or action sheet with a title, a message and an array of handler actions.
     - parameter title: The title of the alert/action sheet.
     - parameter message: The message content of the alert/action sheet.
     - parameter alertActions: An array of alert action in UIAlertAction class.
     */
    public func showAlert(_ title: String?, message: String?, preferredStyle: UIAlertController.Style, alertActions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
       if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }

        for alertAction in alertActions {
            alertController.addAction(alertAction)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
//    public func showNoInternetAlert( alertActions: [UIAlertAction] = [UIAlertAction]()) {
//        var actions = alertActions
//               if  actions.isEmpty {
//                let alertAction = UIAlertAction(title: "_DONE", style: .cancel, handler: nil)
//                   actions.append(alertAction)
//               }
//
//        showActionSheet("_NO_INTERNET", message: "NO_INTERNET_MESSAGE", alertActions: actions)
//       }
//    public func showRequestTimeoutAlert( alertActions: [UIAlertAction] = [UIAlertAction]()) {
//        var actions = alertActions
//        if  actions.isEmpty {
//        let alertAction = UIAlertAction(title: "_DONE", style: .cancel, handler: nil)
//            actions.append(alertAction)
//        }
//        showActionSheet("REQUEST_TIMEOUT", message: "NO_INTERNET_MESSAGE", alertActions: actions)
//
//          }
//    public func showImageNotFoundError( alertActions: [UIAlertAction] = [UIAlertAction]()) {
//       var actions = alertActions
//        if  actions.isEmpty {
//        let alertAction = UIAlertAction(title: "_DONE", style: .cancel, handler: nil)
//            actions.append(alertAction)
//        }
//        showActionSheet("IMAGE_NOT_FOUND", message: "_IMAGE_ERROR", alertActions: actions)
//
//      }
//
//    public func showAudioWritingFoundError( alertActions: [UIAlertAction] = [UIAlertAction]()) {
//          var actions = alertActions
//           if  actions.isEmpty {
//           let alertAction = UIAlertAction(title: "_DONE", style: .cancel, handler: nil)
//               actions.append(alertAction)
//           }
//        showActionSheet("_SAVING_FAILED", message: "_AUDIO_ERROR", alertActions: actions)
//
//         }
//    public func showVideoSavingFoundError( alertActions: [UIAlertAction] = [UIAlertAction]()) {
//             var actions = alertActions
//              if  actions.isEmpty {
//              let alertAction = UIAlertAction(title: "_DONE", style: .cancel, handler: nil)
//                  actions.append(alertAction)
//              }
//        showActionSheet("_SAVING_FAILED", message: "PREPARE_DESIGN_FAILED", alertActions: actions)
//
//            }
  

}
