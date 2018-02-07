//
//  ViewController.swift
//  StickerViewSample
//
//  Created by Edgar Sia on 2/7/18.
//  Copyright © 2018 Edgar Sia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var _selectedStickerView:StickerView?
    var selectedStickerView:StickerView? {
        get {
            return _selectedStickerView
        }
        set {
            
            // if other sticker choosed then resign the handler
            if _selectedStickerView != newValue {
                if let selectedStickerView = _selectedStickerView {
                    selectedStickerView.showEditingHandlers = false
                }
                _selectedStickerView = newValue
            }
            
            // assign handler to new sticker added
            if let selectedStickerView = _selectedStickerView {
                selectedStickerView.showEditingHandlers = true
                selectedStickerView.superview?.bringSubview(toFront: selectedStickerView)
            }
        }
    }

}

// MARK: UIViewController cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize()
    }
}

// MARK: Functions
extension ViewController {
    func initialize() {
        
        // UIView as a container
        let testView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 150, height: 100))
        testView.backgroundColor = UIColor.red
        
        let stickerView = StickerView.init(contentView: testView)
        stickerView.center = self.view.center
        stickerView.delegate = self
        stickerView.outlineBorderColor = UIColor.blue
        stickerView.setImage(UIImage.init(named: "Close")!, forHandler: StickerViewHandler.close)
        stickerView.setImage(UIImage.init(named: "Rotate")!, forHandler: StickerViewHandler.rotate)
        stickerView.setImage(UIImage.init(named: "Flip")!, forHandler: StickerViewHandler.flip)
        stickerView.setHandlerSize(40)
        self.view.addSubview(stickerView)
        
        // UILabel as a container
        let testLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 50))
        testLabel.text = "Test Label"
        testLabel.textAlignment = .center
        
        let stickerView2 = StickerView.init(contentView: testLabel)
        stickerView2.center = CGPoint.init(x: 100, y: 100)
        stickerView2.delegate = self
        stickerView2.setImage(UIImage.init(named: "Close")!, forHandler: StickerViewHandler.close)
        stickerView2.setImage(UIImage.init(named: "Rotate")!, forHandler: StickerViewHandler.rotate)
        stickerView2.showEditingHandlers = false
        self.view.addSubview(stickerView2)
        
        // UIImageView as a container
        let testImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 50))
        testImage.image = UIImage.init(named: "HotDog")
        
        let stickerView3 = StickerView.init(contentView: testImage)
        stickerView3.center = CGPoint.init(x: 150, y: 150)
        stickerView3.delegate = self
        stickerView3.setImage(UIImage.init(named: "Close")!, forHandler: StickerViewHandler.close)
        stickerView3.setImage(UIImage.init(named: "Rotate")!, forHandler: StickerViewHandler.rotate)
        stickerView3.setImage(UIImage.init(named: "Flip")!, forHandler: StickerViewHandler.flip)
        stickerView3.showEditingHandlers = false
        self.view.addSubview(stickerView3)
        
        // first off assign handler to stickerView
        self.selectedStickerView = stickerView
    }
}

// MARK: TapGestureRecognizer
extension ViewController {
    @IBAction func tap(_ sender:UITapGestureRecognizer) {
        self.selectedStickerView?.showEditingHandlers = false
    }
}

// MARK: StickerViewDelegate
extension ViewController: StickerViewDelegate {
    func stickerViewDidBeginMoving(_ stickerView: StickerView) {
        self.selectedStickerView = stickerView
    }
    
    func stickerViewDidChangeMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidEndMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidBeginRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidChangeRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidEndRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidClose(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidTap(_ stickerView: StickerView) {
        self.selectedStickerView = stickerView
    }
}
