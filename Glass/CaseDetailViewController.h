//
//  CaseDetailViewController.h
//  Glass
//
//  Created by Salvador Briones Rosales on 14/12/15.
//  Copyright (c) 2015 grupo 04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaseDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *foto;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *RIcell;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *NAcell;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *MGcell;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *ALcell;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *SIcell;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *Kcell;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *CAcell;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *BAcell;
@property (weak, nonatomic) IBOutlet UICollectionViewCell *FEcell;


@end
