//
//  HomeModel.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 24/3/24.
//

import Foundation
protocol HomeModelProtocol {
    func getNote()
}
class HomeModel: HomeModelProtocol {
   
    
    private let controller: HomeControllerProtocol? 
    
    init(controller: HomeControllerProtocol) {
        self.controller = controller
        
    }

    // связь с контроллером
    private var notes: [String] = ["School notes","Funny Jokes","TravelBucket list","Cooking Ideas"]
    
    func getNote() {
        controller?.onSuccessNotes(notes: notes)
        
    }
}
