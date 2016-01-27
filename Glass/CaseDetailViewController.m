//
//  CaseDetailViewController.m
//  Glass
//
//  Created by Salvador Briones Rosales on 14/12/15.
//  Copyright (c) 2015 grupo 04. All rights reserved.
//

#import "CaseDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GestorBD.h"
@interface CaseDetailViewController ()

@property (nonatomic, strong) GestorBD* gestorBD;
@property (nonatomic, strong) NSArray* arrayDatos;
@property (nonatomic) int idRegistro;
- (void) cargarDatos;


@end

@implementation CaseDetailViewController

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

- (IBAction)botonImagen:(id)sender {
}

-(void) cargarDatos {
    
    self.TitleBar.title = self.casoGuardado._nombre;
    
    if (self.casoGuardado != NULL){
    float total = self.casoGuardado._rI + self.casoGuardado._na + self.casoGuardado._mg + self.casoGuardado._al + self.casoGuardado._si + self.casoGuardado._k + self.casoGuardado._ca + self.casoGuardado._ba + self.casoGuardado._fe;
    
    // establezco los valores:
    self.RILabel.text = [NSString stringWithFormat:@"%.2f%%", (self.casoGuardado._rI/total)*100];
    self.NaLabel.text = [NSString stringWithFormat:@"%.2f%%" , (self.casoGuardado._na/total)*100];
    self.MgLabel.text = [NSString stringWithFormat:@"%.2f%%" , (self.casoGuardado._mg/total)*100];
    self.AlLabel.text = [NSString stringWithFormat:@"%.2f%%" , (self.casoGuardado._al/total)*100];
    self.SiLabel.text = [NSString stringWithFormat:@"%.2f%%" , (self.casoGuardado._si/total)*100];
    self.KLabel.text = [NSString stringWithFormat:@"%.2f%%" , (self.casoGuardado._k/total)*100];
    self.CaLabel.text = [NSString stringWithFormat:@"%.2f%%" , (self.casoGuardado._ca/total)*100];
    self.BaLabel.text = [NSString stringWithFormat:@"%.2f%%" , (self.casoGuardado._ba/total)*100];
    self.FeLabel.text = [NSString stringWithFormat:@"%.2f%%" , (self.casoGuardado._fe/total)*100];
    self.TypeLabel.text =[NSString stringWithFormat:@"%@", self.casoGuardado._tipoCristal];
    
    //UIImage *buttonBackground = [UIImage imageNamed:@"prueba.jpg"];
    UIImage *buttonBackground = [UIImage imageNamed:(@"imagenesCasos/%@.png", self.casoGuardado._tipoCristal)];
    //NSLog(@"imagenesCasos/%@.jgp", self.casoGuardado._tipoCristal);
    [self.botonImagen setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    }
    
    else{
        NSLog(@"Errrrorrr");
    }
}

@end
