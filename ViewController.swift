//
//  ViewController.swift
//  testsubivews
//
//  Created by Batuhan Baran on 20.11.2020.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var flag = false
    var myViewHeightConstraint: NSLayoutConstraint!
    
    let scrollView: UIScrollView = {
     
        let scrollView = UIScrollView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
     
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = false
      
        return scrollView
    }()

    let stackView: UIStackView = {
     
        let view = UIStackView()
    
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
     
        return view
    }()
    
    let first: UIView = {
     
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        
        return view
    }()
    
    let second: UIView = {
     
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        
        return view
    }()
    
    let third: UIView = {
     
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        
        return view
    }()
    
    let button: UIButton = {
     
        let button = UIButton()
        let image = UIImage(systemName: "arrowtriangle.down")
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(myAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
     
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myViewHeightConstraint = NSLayoutConstraint(item: self.second, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 300)
        myViewHeightConstraint.isActive = true
        
        
        view.addSubview(scrollView)

        scrollView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(stackView)
     
        stackView.addArrangedSubview(first)
        stackView.addArrangedSubview(second)
        stackView.addArrangedSubview(third)
        
        first.addSubview(button)
        button.centerXAnchor.constraint(equalTo: self.first.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.first.bottomAnchor).isActive = true
        


        first.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        first.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        second.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        
        
        third.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        third.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 900)

        scrollView.isScrollEnabled = true
        scrollView.bounces = true
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor,constant: -50).isActive = true

        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        

    }
    
    @objc func myAction(){
        
        
        if self.flag{
          
            
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.button.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
                self.myViewHeightConstraint.constant = 300
                self.view.layoutIfNeeded()
                
            })
            
            
           self.flag = false
            
        }else{
            
            
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.button.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.myViewHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
            
            
            self.flag = true
            
        }
        
    }

}

