//
//  DetectiveDetailViewController.m
//  Glass
//
//  Created by Tarik on 25/01/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//


#import "DetectiveDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GestorBD.h"

@interface DetectiveDetailViewController ()


@property (nonatomic, strong) GestorBD* gestorBD;
@property (nonatomic, strong) NSArray* arrayDatos;
@property (nonatomic) int idRegistro;
- (void) cargarDatos;

@end

@implementation DetectiveDetailViewController



/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self cargarDatos];
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
-(void) cargarDatos {
    
    if (self.detectiveguardado != NULL){
        
        
        // establezco los valores:
        
        self.nombre.text =[NSString stringWithFormat:@"%@", self.detectiveguardado._Nombre];
        
        self.apellidos.text =[NSString stringWithFormat:@"%@", self.detectiveguardado._Apellidos];
        
        
        self.fecha.text =[NSString stringWithFormat:@"%@", self.detectiveguardado._Fecha];
       
        
        
        UIImage *buttonBackground = [UIImage imageNamed:@"prueba.jpg"];
        //UIImage *buttonBackground = [UIImage imageNamed:(@"@.jgp", self.casoGuardado._tipoCristal)];
        [self.foto setBackgroundImage:buttonBackground forState:UIControlStateNormal];
        
        
    }
    
    
    else {NSLog(@"ERROR");}
    
}
        @end
        
        
      
