//
//  DetectiveDetailViewController.h
//  Glass
//
//  Created by Tarik on 25/01/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detective.h"

@interface DetectiveDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UILabel *apellidos;
@property (weak, nonatomic) IBOutlet UILabel *fecha;
@property (nonatomic, strong) Detective *detectiveguardado;
@property (weak, nonatomic) IBOutlet UIButton *foto;

@end
