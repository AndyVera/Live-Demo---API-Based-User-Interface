//
//  ViewController.swift
//  Live Demo - API Based User Interface
//
//  Created by Andy Vera on 9/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    var firstButton: UIButton!
    var secondButton: UIButton!
    var secondbuttonLeadingCon: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad() - Finished")
    }
    
    
    override func loadView() {
        
        //Need this to respect the super function
        super.loadView()
        
        //Make the first button
        self.firstButton = UIButton(type: .system)
        self.firstButton.translatesAutoresizingMaskIntoConstraints = false
        self.firstButton.setTitle(
            "First Button",
            for: UIControl.State.normal
        )
        self.firstButton.addTarget(
            self,
            action: #selector(firstButtonClicked(_:)),
            for: UIControl.Event.touchUpInside
        )
        self.firstButton.addTarget(
            self,
            action: #selector(firstButtonDragExit(_:)),
            for: UIControl.Event.touchDragExit
        )
        
        //Make the second button
        self.secondButton = UIButton(type: UIButton.ButtonType.infoDark)
        self.secondButton.translatesAutoresizingMaskIntoConstraints = false
        self.secondButton.setTitle(
            "Second Button",
            for: UIControl.State.normal
        )
        self.secondButton.backgroundColor = UIColor.lightGray
        self.secondButton.addTarget(
            self,
            action: #selector(secondButtonClicked(_:)),
            for: UIControl.Event.touchUpInside
        )
        
        // Add the buttons to our primary viewe
        self.view.addSubview(self.firstButton)
        self.view.addSubview(self.secondButton)
        
        // Create the center constraint and store to a variable,
        // so we can activate it later
        // Make sure this a;; happens *after* we've added
        // these views to the main view, so they share
        // a common ancestor in our view Hierarchy
        let b1TrailingCon = self.firstButton.trailingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerXAnchor,
            constant: -20
        )
        let b1TopCon = self.firstButton.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        )
        b1TrailingCon.isActive = true
        b1TopCon.isActive = true
        
        
        self.secondbuttonLeadingCon = self.secondButton.leadingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerXAnchor,
            constant: 20
        )
        let b2TopCon = self.secondButton.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        )
        secondbuttonLeadingCon.isActive = true
        b2TopCon.isActive = true
        
        
        print("loadView() - Finished")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var offset: Double = self.view.frame.width
        offset = offset / 4.0
        
        // First deactive the exisitng constraint
        self.secondbuttonLeadingCon.isActive = false
        self.secondbuttonLeadingCon =
            self.secondButton.leadingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerXAnchor,
            constant: offset)
        secondbuttonLeadingCon.isActive = true
    }
        
    
    @objc func firstButtonClicked(_ b: UIButton){
        print("First button clicked!")
    }
    
    @objc func firstButtonDragExit(_ b: UIButton){
        print("First button received a drag exit event!")
    }
    
    @objc func secondButtonClicked(_ b: UIButton){
        print("Second button clicked!")
    }

}

