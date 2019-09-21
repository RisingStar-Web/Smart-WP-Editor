//
//  ViewController.h
//  NoNotch
//
//  Created by Андрей Зябкин on 06.03.2019.
//  Copyright © 2019 Андрей Зябкин. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
    IBOutlet UIImageView *imageView;
    
    IBOutlet UIView *containerView;
    
    IBOutlet UIImageView *upperImageView;
    
    IBOutlet UILabel *textLabel;
    
    int numberOfDevice;
}


@end

