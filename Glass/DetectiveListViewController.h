//
//  DetectiveListViewController.h
//  Glass
//
//  Created by Jorge Martinez Carvajal on 17/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetectiveListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tabla;

@end