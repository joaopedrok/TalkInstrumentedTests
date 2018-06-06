//
//  CodableView.swift
//  TalkInstrumentedTests
//
//  Created by Joao Souza on 26/04/2018.
//  Copyright © 2018 Concrete. All rights reserved.
//

import Foundation

protocol CodableView {
    func configViews()
    func buildViews()
    func configConstraints()
}

extension CodableView {
    func setupViews() {
        configViews()
        buildViews()
        configConstraints()
    }
}
