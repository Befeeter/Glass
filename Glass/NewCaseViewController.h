//
//  NewCaseViewController.h
//  Glass
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 grupo 04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCaseViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *glassType;
@property (weak, nonatomic) IBOutlet UIButton *selectType;
@property (weak, nonatomic) IBOutlet UISlider *RI;

- (IBAction)selectType:(id)sender;


@end
