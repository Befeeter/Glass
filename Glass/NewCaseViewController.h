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
@property (weak, nonatomic) IBOutlet UITextField *NameText;
@property (weak, nonatomic) IBOutlet UIButton *selectDetective;
@property (weak, nonatomic) IBOutlet UIPickerView *detectivePicker;

 //Sliders:
@property (weak, nonatomic) IBOutlet UISlider *RISlider;
@property (weak, nonatomic) IBOutlet UISlider *NaSlider;
@property (weak, nonatomic) IBOutlet UISlider *MgSlider;
@property (weak, nonatomic) IBOutlet UISlider *AlSlider;
@property (weak, nonatomic) IBOutlet UISlider *SiSlider;
@property (weak, nonatomic) IBOutlet UISlider *KSlider;
@property (weak, nonatomic) IBOutlet UISlider *CaSlider;
@property (weak, nonatomic) IBOutlet UISlider *BaSlider;
@property (weak, nonatomic) IBOutlet UISlider *FeSlider;
 //Labels:
@property (weak, nonatomic) IBOutlet UILabel *NaLabel;
@property (weak, nonatomic) IBOutlet UILabel *RILabel;
@property (weak, nonatomic) IBOutlet UILabel *MgLabel;
@property (weak, nonatomic) IBOutlet UILabel *AlLabel;
@property (weak, nonatomic) IBOutlet UILabel *SiLabel;
@property (weak, nonatomic) IBOutlet UILabel *KLabel;
@property (weak, nonatomic) IBOutlet UILabel *CaLabel;
@property (weak, nonatomic) IBOutlet UILabel *BaLabel;
@property (weak, nonatomic) IBOutlet UILabel *FeLabel;

- (IBAction)selectType:(id)sender;

@end
