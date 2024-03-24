//
//  HomeController.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 24/3/24.
//

import Foundation
import UIKit
protocol HomeControllerProtocol {
  func onGetNotes()
    
    func onSuccessNotes(notes: [String])
}

class HomeController:  HomeControllerProtocol {
    
    
    
    
    private var view : HomeViewProtocol?
    private var model: HomeModelProtocol?
    
    
    init(view: HomeViewProtocol) {
        self.view = view
        self.model = HomeModel(controller: self)
    }
    
   
    
    
    
    
    func onGetNotes() {
        model?.getNote()
    }
    
    func onSuccessNotes(notes: [String]) {
        view?.succesNotes(notes: notes)
    }
    
}
