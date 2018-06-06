//
//  LoginViewControllerSpec.swift
//  TalkInstrumentedTests
//
//  Created by Joao Souza on 26/04/2018.
//Copyright © 2018 Concrete. All rights reserved.
//

import Quick
import Nimble
import KIF
@testable import TalkInstrumentedTests

class LoginViewControllerSpec: BaseTest {
	override func spec() {
		describe("LoginViewController") {
            it("should show error with empty username") {
                self.loadSreen()
                    .tapLoginButton()
                    .isAlertWith(message: "Nome de usuário obrigatório")
            }

            it("should show error with empty password") {
                self.loadSreen()
                    .withUsername()
                    .tapLoginButton()
                    .isAlertWith(message: "Senha obrigatória")
            }

            it("should show error with password out of rule") {
                self.loadSreen()
                    .withUsername()
                    .withPasswordWithFiveDigits()
                    .tapLoginButton()
                    .isAlertWith(message: "Senha deve ter 6 dígitos")
            }
		}
	}
}

extension LoginViewControllerSpec {
    func loadSreen() -> LoginViewControllerSpec {
        KIFEnableAccessibility()
        UIApplication.shared.keyWindow!.rootViewController = UINavigationController(rootViewController: LoginViewController())
        UIApplication.shared.keyWindow!.makeKeyAndVisible()

        return self
    }

    func withUsername() -> LoginViewControllerSpec {
        tester().enterText("João Pedro", intoViewWithAccessibilityIdentifier: AccessibilityIdentifiers.TextFields.username)

        tester().enterText(<#T##text: String!##String!#>, intoViewWithAccessibilityLabel: <#T##String!#>, traits: <#T##UIAccessibilityTraits#>, expectedResult: <#T##String!#>)

        return self
    }

    func withPasswordWithFiveDigits() -> LoginViewControllerSpec {
        tester().enterText("12345", intoViewWithAccessibilityIdentifier: AccessibilityIdentifiers.TextFields.password)

        return self
    }

    func tapLoginButton() -> LoginViewControllerSpec {
        tester().tapView(withAccessibilityIdentifier: AccessibilityIdentifiers.Buttons.login)

        return self
    }
}
