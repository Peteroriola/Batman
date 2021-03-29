//
//  HelperFunctions.swift
//  Batman
//
//  Created by Peter on 27/03/2021.
//

import UIKit



func CLEAR_PAGE_LOADING_AND_TOASTS(viewcontroller:UIViewController) {
  
    UIActivityIndicatorView.stopLoading()
}


func START_PAGE_LOADING(viewcontroller: UIViewController){
  
    
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
    




    
   

