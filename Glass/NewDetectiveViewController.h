//
//  NewDetectiveViewController.h
//  Glass
//
//  Created by Jorge Martinez Carvajal on 16/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewDetectiveViewController : UIViewController {
    IBOutlet UIScrollView *scroller;
}

@property (weak, nonatomic) IBOutlet UITextField *NombreTextBox;

@property (weak, nonatomic) IBOutlet UITextField *ApellidosTextBox;

@property (weak, nonatomic) IBOutlet UIDatePicker *FechaPicker;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
