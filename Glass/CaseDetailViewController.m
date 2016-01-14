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
    
    
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    
    
    if( self.idRegistro != -1) {
        [self cargarDatos];
    }
    
    
    
    
    
    
    

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
- (void) cargarDatos{
    //seleccionamos la tabla CASO
    NSString* consulta = [NSString stringWithFormat:@"select * from caso where id=%d", self.idRegistro]; //Llamamos solo al caso que nos interesa
    
    NSArray *resultado= [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    
    self.CaLabel.text=[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"CA"]];
    
    self.NaLabel.text=[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"NA"]];
    
    self.MgLabel.text=[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"MG"]];
    
    self.AlLabel.text=[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"AL"]];
    
    self.SiLabel.text=[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"SI"]];
    
    self.KLabel.text=[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"K"]];
    
    self.BaLabel.text=[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"BA"]];
    
    self.FeLabel.text=[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"FE"]];
    
    //Obtenemos el nombre del caso
    
    NSString *nombre= [NSString stringWithFormat:@"select nombre from caso where id=%d", self.idRegistro];
    // Le concatenamos un .jpg
    NSString *nombreimagen= [nombre stringByAppendingString:@".jpg"];
    
    // Obtenemos la imagen con ese nombre
    UIImage *imagen = [UIImage imageNamed: nombreimagen];
    //Asignamos esa imagen al BackGround del boton
    [self.botonImagen setBackgroundImage:imagen forState:UIControlStateNormal];
}

@end
