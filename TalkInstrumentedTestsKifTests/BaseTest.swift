//
//  BaseTest.swift
//  TalkInstrumentedTestsKifTests
//
//  Created by Joao Souza on 26/04/2018.
//  Copyright © 2018 Concrete. All rights reserved.
//

import Quick
import Nimble
import KIF

extension QuickSpec {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }

    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

class BaseTest: QuickSpec {

    override open func spec() {
        super.spec()        
    }

    func isAlertWith(message: String?) {
        tester().waitForView(withAccessibilityLabel: message)
    }
}

