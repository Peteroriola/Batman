//
//  HelperFunctions.swift
//  Batman
//
//  Created by Peter on 27/03/2021.
//

import UIKit

func presentSimpleToast(message:String, self:UIViewController){
    self.view.makeToast(message, duration: 4, position: .bottom)
}

func presentSimpleErrorToast(message:String, self:UIViewController){
    self.view.makeToast(message, duration: 10, position: .bottom)
}

func CLEAR_PAGE_LOADING_AND_TOASTS(viewcontroller:UIViewController) {
    viewcontroller.view.hideAllToasts()
    UIActivityIndicatorView.stopLoading()
}


func START_PAGE_LOADING(viewcontroller: UIViewController){
    viewcontroller.view.hideAllToasts()
    
    let resultingView = UIActivityIndicatorView.startLoading()
    resultingView.center = viewcontroller.self.view.center;
    viewcontroller.view.addSubview(resultingView)
}

func STOP_PAGE_LOADING(){
     UIActivityIndicatorView.stopLoading()
}

    func colorNavigationBar(navigationController:UINavigationController?){
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.backgroundColor = UIColor.green
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
       // navigationController?.isNavigationBarHidden = false
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
     
    }
    
    func handleErrorOnSuccess(errorDict: [String: Any], self: UIViewController) {
        if let error = errorDict["error"]  as? String {
            CLEAR_PAGE_LOADING_AND_TOASTS(viewcontroller: self)
            print("handleErrorOnSuccess Err is: ", error)
            if let msg = errorDict["message"] as? String {
                presentSimpleErrorToast(message: msg, self: self)
            } else {
                presentSimpleErrorToast(message: "Something went wrong! - Please try again", self: self)
            }
            return
        }
    }



    
   

