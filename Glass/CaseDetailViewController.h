//
//  CaseDetailViewController.h
//  Glass
//
//  Created by Salvador Briones Rosales on 14/12/15.
//  Copyright (c) 2015 grupo 04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaseDetailViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *RILabel;
@property (weak, nonatomic) IBOutlet UILabel *NaLabel;
@property (weak, nonatomic) IBOutlet UILabel *MgLabel;
@property (weak, nonatomic) IBOutlet UILabel *AlLabel;
@property (weak, nonatomic) IBOutlet UILabel *SiLabel;
@property (weak, nonatomic) IBOutlet UILabel *KLabel;
@property (weak, nonatomic) IBOutlet UILabel *CaLabel;
@property (weak, nonatomic) IBOutlet UILabel *BaLabel;
@property (weak, nonatomic) IBOutlet UILabel *FeLabel;

@property (weak, nonatomic) IBOutlet UIButton *botonImagen;

- (IBAction)botonImagen:(id)sender;

@end
