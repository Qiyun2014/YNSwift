//
//  FlipPresentAnimationController.swift
//  YNTableView
//
//  Created by qiyun on 16/4/6.
//  Copyright © 2016年 ProDrone. All rights reserved.
//

import UIKit

class FlipPresentAnimationController: NSObject , UIViewControllerAnimatedTransitioning{

    
    var originFrame = CGRectZero
    
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // 1
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        // 2
        let initialFrame = originFrame
        let finalFrame = transitionContext.finalFrameForViewController(toVC)
        
        // 3
        let snapshot = toVC.view.snapshotViewAfterScreenUpdates(true)
        snapshot.frame = initialFrame
        snapshot.layer.cornerRadius = 25
        snapshot.layer.masksToBounds = true
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        toVC.view.hidden = true
        
        //AnimationHelper.perspectiveTransformForContainerView(containerView)
        //snapshot.layer.transform = AnimationHelper.yRotation(M_PI_2)
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        
        return 1
    }
    
    // This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
    func animationEnded(transitionCompleted: Bool){
        
        
    }
}
