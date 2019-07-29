//
//  ViewController.swift
//  DotAnimation
//
//  Created by Anh Nguyen on 7/29/19.
//  Copyright © 2019 Anh Nguyen. All rights reserved.
//

import UIKit
import Masonry
import SnapKit

class ViewController: UIViewController {
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var imageHome: UIImageView!
    
    let circleViewSize: CGFloat = fontSizeScaled(12)
    
    lazy var circleLarge1: UIView = {
        return initCircleView()
    }()
    
    lazy var circleLarge2: UIView = {
        return initCircleView()
    }()
    
    lazy var notifyView: UIView = {
        return initCircleView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.initConstraints()
        self.showAnimationDot()
    }
    
    private func initUI() {
        self.notifyView.alpha = 1.0;
        self.notifyView.layer.borderColor = UIColor.white.cgColor
        self.notifyView.layer.borderWidth = 1.5;
    }
    
    private func initConstraints() {
        self.notifyView.snp.makeConstraints { (make) in
            make.size.equalTo(self.circleViewSize)
            make.top.equalTo(self.imageHome.snp.top).offset(-fontSizeScaled(6))
            make.right.equalTo(self.imageHome.snp.right).offset(fontSizeScaled(6))
        }
        
        self.circleLarge1.snp.makeConstraints { (make) in
            make.size.equalTo(circleViewSize)
            make.top.equalTo(self.imageHome.snp.top).offset(-fontSizeScaled(6))
            make.right.equalTo(self.imageHome.snp.right).offset(fontSizeScaled(6))
        }

        self.circleLarge2.snp.makeConstraints { (make) in
            make.size.equalTo(circleViewSize)
            make.top.equalTo(self.imageHome.snp.top).offset(-fontSizeScaled(6))
            make.right.equalTo(self.imageHome.snp.right).offset(fontSizeScaled(6))
        }
    }
    
    private func initCircleView() -> UIView {
        let view = UIView()
        roundRectView(view: view, radius: circleViewSize/2)
        view.backgroundColor = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)
        view.alpha = 0.0;
        self.viewContent.addSubview(view)
        return view
    }
    
    private func roundRectView(view: UIView, radius: CGFloat) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
    }
    
    private func minimizeCircle(_ view: UIView, alpha: CGFloat) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            view.alpha = 0.0
            view.transform = CGAffineTransform(scaleX: 4.0, y: 4.0)
        }) { (finished) in
            if finished {
                view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
                self.expandCircle(view, alpha: alpha)
            }
        }
    }
    
    private func expandCircle(_ view: UIView, alpha: CGFloat) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveLinear, animations: {
            view.alpha = alpha
            view.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
        }) { (finished) in
            if finished {
                self.minimizeCircle(view, alpha: alpha)
            }
        }
    }
    
    private func resetAnimation(_ view: UIView) {
        view.alpha = 0.0
        view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
    private func showAnimationDot() {
        self.resetAnimation(self.circleLarge1)
        self.expandCircle(self.circleLarge1, alpha: 0.1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.resetAnimation(self.circleLarge2)
            self.expandCircle(self.circleLarge2, alpha: 0.2)
        }
    }
}

