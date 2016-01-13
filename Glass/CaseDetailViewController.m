//
//  CaseDetailViewController.m
//  Glass
//
//  Created by Salvador Briones Rosales on 14/12/15.
//  Copyright (c) 2015 grupo 04. All rights reserved.
//

#import "CaseDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface CaseDetailViewController ()

@end

@implementation CaseDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.SiLabel.layer.borderWidth=1.0;
    self.SiLabel.layer.borderColor=[UIColor greenColor].CGColor;
    UIImage *imagen = [UIImage imageNamed:@"prueba.jpg"];
 [self.botonImagen setBackgroundImage:imagen forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)botonImagen:(id)sender {
}
@end
