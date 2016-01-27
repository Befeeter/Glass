//
//  CaseListViewController.m
//  Glass
//
//  Created by Salvador Briones Rosales on 11/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import "CaseListViewController.h"
#import "GestorBD.h"
#import "CaseDetailViewController.h"
#import "Case.h"

@interface CaseListViewController ()
{
    Case *caso;
}



@property (nonatomic, strong) GestorBD* gestorBD;
@property (nonatomic, strong) NSArray* arrayDatos;
@property (nonatomic) int idRegistroEditar;
- (void) cargarDatos;


@end

@implementation CaseListViewController



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
    caso = [[Case alloc]init];
    self.tabla.delegate = self;
    self.tabla.dataSource = self;
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    [self cargarDatos];
    
    
#ifdef VERSION2
    _addCase.enabled = NO;
#endif
    
#ifdef VERSION3
    _addCase.enabled = NO;
#endif
}
-(IBAction)addRegistro:(id)sender{
    //self.idRegistroEditar = -1;
    [self performSegueWithIdentifier:@"idSegueDetalle" sender:self];
}
-(void) cargarDatos{
    //seleccionamos la tabla CASO
    NSString *consulta = @"select * from caso";
    if (self.arrayDatos != nil) self.arrayDatos = nil; self.arrayDatos = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    //actualizamos la tabla
    [self.tabla reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayDatos.count;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger indexOfNombre = [self.gestorBD.arrNombresCols indexOfObject:@"nombre"];
    NSInteger indexOfRol = [self.gestorBD.arrNombresCols indexOfObject:@"detective"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfNombre]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfRol]];
    return cell;
}

-(void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *)indexPath{
    
    
    //NSLog(@"Nombre del caso 1: %@",[[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:0]stringValue]);
    
    //self.idRegistroEditar = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:0]intValue];
    //NSString *consulta = (@"select * from caso where id=%@", [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:0]stringValue]);
    caso._id = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:0]intValue];
    caso._nombre = [NSString stringWithFormat:@"%@",[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:1]];
    caso._detective = [NSString stringWithFormat:@"%@",[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:2]];
    caso._rI = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:3]floatValue];
    caso._na = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:4]floatValue];
    caso._mg = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:5]floatValue];
    caso._al = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:6]floatValue];
    caso._si = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:7]floatValue];
    caso._k = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:8]floatValue];
    caso._ca = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:9]floatValue];
    caso._ba = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:10]floatValue];
    caso._fe = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:11]floatValue];
    caso._tipoCristal = [NSString stringWithFormat:@"%@",[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:12]];
    
    //if (self.arrayDatos != nil) self.arrayDatos = nil; self.arrayDatos = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    //NSLog(@"Nombre del caso: %@", caso._nombre);
    [self performSegueWithIdentifier:@"idSegueCasoDetalle" sender:self];
}



- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"idSegueCasoDetalle"]) {
        CaseDetailViewController *destino = [segue destinationViewController];
        destino.casoGuardado = caso;
    }
}

@end
