//
//  NewDetectiveViewController.h
//  Glass
//
//  Created by Jorge Martinez Carvajal on 16/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewDetectiveViewController : UIViewController {
    
    
    UIDatePicker *fechaPicker;
    
}

@property (weak, nonatomic) IBOutlet UITextField *NombreTextBox;

@property (weak, nonatomic) IBOutlet UITextField *ApellidosTextBox;
@property (weak, nonatomic) IBOutlet UITextField *fecha;



@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
