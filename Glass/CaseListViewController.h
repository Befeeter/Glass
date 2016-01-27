//
//  CaseListViewController.h
//  Glass
//
//  Created by Salvador Briones Rosales on 11/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewCaseViewController.h"


@interface CaseListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,NewCaseViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tabla;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addCase;


-(IBAction)addRegistro:(id)sender;

@end
