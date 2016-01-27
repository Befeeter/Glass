//
//  GlassDetectiveViewController.m
//  Glass
//
//  Created by Salvador Briones Rosales on 11/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import "GlassDetectiveViewController.h"

@interface GlassDetectiveViewController ()

@end

@implementation GlassDetectiveViewController


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
    // Do any additional setup after loading the view.ç
    
#ifdef VERSION2
    [_botonConsultar setTitle:@"Consult Case" forState:UIControlStateNormal];
#endif
#ifdef VERSION3
    [_botonConsultar setTitle:@"Consult Case" forState:UIControlStateNormal];
#endif

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

@end
