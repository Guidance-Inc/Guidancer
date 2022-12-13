//
//  LoginViewController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

protocol LoginRouterDelegate: AnyObject {
    func didSelect(_ controller: LoginViewController)
}

final class LoginViewController: UIViewController, ViewControllerProtocol {
    
    var routerDelegate: LoginRouterDelegate?
    
    private let emailTextField = GTextField(imageName: "user", placeholder: "Email", font: .medium18)
    
    private let passwordTextField = GTextField(imageName: "lock", placeholder: "Password", font: .medium18)
    
    private let titleLabel = GLabel(text: "Start exploring the world around!", font: .bold27)
    private let choiceLabel = UILabel()
    
    private let signInButton = GRectangleButton(title: "Sign In")
    private let appleButton = GRectangleButton(title: "Continue with Apple",
                                       image: UIImage(systemName: "applelogo"))
    private let googleButton = GRectangleButton(title: "Continue with Google")
    
    private let dontHaveAccountButton = HaveAccountButton().attributedButton("Don't have an account ? ", "Sign up here")
    
    lazy var stack = UIStackView(arrangedSubviews: [emailTextField,
                                                    passwordTextField,
                                                    signInButton,
                                                    choiceLabel,
                                                    appleButton,
                                                    googleButton])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        configLabel()
        configStackView()
        configDontHaveAccountButton()
    }
    
    func configLabel() {
        view.addSubview(titleLabel)
        titleLabel.addAnchors(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 20, paddingLeft: 20, paddinRight: 20)
        titleLabel.textAlignment = .center
        choiceLabel.text = "or"
        choiceLabel.font = .medium21
        choiceLabel.textAlignment = .center
    }
    
    func configStackView() {
        view.addSubview(stack)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
    }
    
    func configDontHaveAccountButton() {
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.addAnchors(left: view.leftAnchor,
                                            bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                                            paddingLeft: 40,
                                            paddinRight: 40)

    }
  
}
