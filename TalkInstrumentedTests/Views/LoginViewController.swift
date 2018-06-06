//
//  LoginViewController.swift
//  TalkInstrumentedTests
//
//  Created by Joao Souza on 26/04/2018.
//  Copyright © 2018 Concrete. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, CodableView {

    let textFieldUsername: UITextField = {
        let txf = UITextField()
        txf.placeholder = "Nome de usuário"
        txf.borderStyle = .roundedRect
        txf.accessibilityIdentifier = AccessibilityIdentifiers.TextFields.username

        return txf
    }()

    let textFieldPassword: UITextField = {
        let txf = UITextField()
        txf.placeholder = "Senha"
        txf.borderStyle = .roundedRect
        txf.accessibilityIdentifier = AccessibilityIdentifiers.TextFields.password

        return txf
    }()

    lazy var buttonLogin: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Entrar", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        btn.addTarget(self, action: #selector(login), for: .touchUpInside)
        btn.accessibilityIdentifier = AccessibilityIdentifiers.Buttons.login

        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func configViews() {
        title = "Login"

        view.accessibilityIdentifier = AccessibilityIdentifiers.Views.login
        view.backgroundColor = .white
    }

    func buildViews() {
        view.addSubview(textFieldUsername)
        view.addSubview(textFieldPassword)
        view.addSubview(buttonLogin)
    }

    func configConstraints() {
        textFieldUsername.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            constraint.left.equalToSuperview().offset(15)
            constraint.right.equalToSuperview().inset(15)
            constraint.height.equalTo(37)
        }

        textFieldPassword.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(textFieldUsername.snp.bottom).offset(10)
            constraint.left.equalToSuperview().offset(15)
            constraint.right.equalToSuperview().inset(15)
            constraint.height.equalTo(37)
        }

        buttonLogin.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(textFieldPassword.snp.bottom).offset(20)
            constraint.left.equalToSuperview().offset(15)
            constraint.right.equalToSuperview().inset(15)
            constraint.height.equalTo(43)
        }
    }

    private func pushWelcomeViewController(username: String) {
        let welcomeViewController = WelcomeViewController(username: username)
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }

    private func validate() -> Bool {
        if textFieldUsername.text!.isEmpty {
            showAlertError(errorMessage: "Nome de usuário obrigatório")
            return false
        }

        if textFieldPassword.text!.isEmpty {
            showAlertError(errorMessage: "Senha obrigatória")
            return false
        } else if textFieldPassword.text!.count != 6 {
            showAlertError(errorMessage: "Senha deve ter 6 dígitos")
            return false
        }

        return true
    }

    @objc func login() {
        if validate() {
            pushWelcomeViewController(username: textFieldUsername.text!)
        }
    }
}

extension LoginViewController {
    func showAlertError(errorMessage: String) {
        let alertController = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }
}
