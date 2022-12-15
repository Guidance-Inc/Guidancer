//
//  SigUpViewController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

protocol SingUpRouterDelegate: AnyObject {
    func didSelect(_ viewController: SigUpViewController)
}

final class SigUpViewController: UIViewController, ViewControllerProtocol {
    
    var routerDelegate: SingUpRouterDelegate?
    
    private let emailTextField = GTextField(imageName: "user",
                                            placeholder: "Enter e-mail adress",
                                            font: .medium18)
    private let passwordTextField = GTextField(imageName: "lock",
                                               placeholder: "Create password",
                                               font: .medium18)
    private let nicknameTextField = GTextField(imageName: "at",
                                               placeholder: "Choose your nickname",
                                               font: .medium18)
    private let titleLabel = GLabel(text: "Start exploring the world around!",
                                    font: .bold27)
    private let choiceLabel = UILabel()
    private let signUpButton = GRectangleButton(title: "Sign Up")
    private let appleButton = GRectangleButton(title: "Continue with Apple",
                                               image: UIImage(systemName: "applelogo"))
    private let googleButton = GRectangleButton(title: "Continue with Google",
                                                image: UIImage(systemName: "applelogo"))
    private let alreadyHaveAccountButton = haveAccaountButton(firstPart: "Already have an account? ",
                                                              secondPart: "Login here")
    lazy var stack = UIStackView(arrangedSubviews: [emailTextField,
                                                    passwordTextField,
                                                    nicknameTextField,
                                                    signUpButton,
                                                    choiceLabel,
                                                    googleButton,
                                                    appleButton])
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    private func configureUI() {
        view.backgroundColor = .white
        configLabel()
        configStackView()
        configAlreadyHaveAccountButton()
    }
    func configLabel() {
        view.addSubview(titleLabel)
        titleLabel.addAnchors(top: view.safeAreaLayoutGuide.topAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 20,
                              paddingLeft: 44,
                              paddinRight: 20)
        titleLabel.textAlignment = .left
        choiceLabel.text = "or"
        choiceLabel.font = .medium21
        choiceLabel.textAlignment = .center
    }
    func configStackView() {
        view.addSubview(stack)
        passwordTextField.textField.isSecureTextEntry = true
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
    }
    func configAlreadyHaveAccountButton() {
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.addAnchors(left: view.leftAnchor,
                                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                            right: view.rightAnchor,
                                            paddingLeft: 40,
                                            paddinRight: 40)
    }
}
