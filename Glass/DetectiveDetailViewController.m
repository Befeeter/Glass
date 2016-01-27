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
    //*******Colorines :)*******
    //Fondo barra navegación
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.01 green:0.25 blue:0.76 alpha:1.0];
    
    //Texto barra navegacion
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.23 green:0.88 blue:0.65 alpha:1.0], NSForegroundColorAttributeName,nil]];
    //Fondo de la vista
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"fondo.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
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
        
        
      
