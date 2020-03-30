//
//  BasePresenter.swift
//  Channels
//
//  Created Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

class BasePresenter<View: BaseViewProtocol, Model: BaseModelProtocol>: NSObject, BasePresenterProtocol {

    private var view: View?
    private var model: Model?
    
    private override init() {
        
    }
    
    init(view: View, model: Model ) {
        self.view = view
        self.model = model
    }

    func showErrorMessage(message: String) {
        view?.showError(message: message)
    }

}
