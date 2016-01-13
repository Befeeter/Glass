//
//  NewDetectiveViewController.h
//  Glass
//
//  Created by Aula1 on 11/01/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewDetectiveViewController : UIViewController
- (IBAction)guardar:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nombreText;
@property (weak, nonatomic) IBOutlet UITextField *apellidoText;
@property (weak, nonatomic) IBOutlet UITextField *idNumeroText;
@property (weak, nonatomic) IBOutlet UITextField *dateText;
- (IBAction)ocultarTeclado1:(id)sender;
- (IBAction)ocultarTeclado2:(id)sender;
- (IBAction)ocultarTeclado3:(id)sender;
- (IBAction)ocultarTeclado4:(id)sender;

@end
