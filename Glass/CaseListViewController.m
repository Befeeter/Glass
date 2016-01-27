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



-(void) editionDidFinished{
    [self cargarDatos];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    caso = [[Case alloc]init];
    self.tabla.delegate = self;
    self.tabla.dataSource = self;
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    [self cargarDatos];
    
    //*******Colorines :)*******
    //Fondo barra navegación
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.01 green:0.25 blue:0.76 alpha:1.0];
    
    //Texto barra navegacion
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.23 green:0.88 blue:0.65 alpha:1.0], NSForegroundColorAttributeName,nil]];
    //[self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.23 green:0.88 blue:0.65 alpha:1.0], NSForegroundColorAttributeName,nil]];
    //Fondo de la vista
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"fondo.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //Fondo para la tabla o lista
    _tabla.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fondo.png"]];
    
    
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
//-metodo para cambiar de color las filas
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath
                                                                                                      *)indexPath
{
    if((indexPath.row)%2==0)
        cell.backgroundColor = [UIColor colorWithRed:0.23 green:0.55 blue:0.88 alpha:1.0]; //set image for cell 0
    
    if (indexPath.row%2==1)
        cell.backgroundColor = [UIColor colorWithRed:0.23 green:0.78 blue:0.88 alpha:1.0]; //set color for cell 1
    
    tableView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"cloud.jpg"]]; //set image for UITableView
    
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

-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int idRegistro;
    NSString *consulta;
    
    
    
    if (editingStyle != UITableViewCellEditingStyleDelete) return;
    
    NSInteger indexOfId = [self.gestorBD.arrNombresCols indexOfObject:@"id_caso"];
    
    idRegistro = [[[self.arrayDatos objectAtIndex:indexPath.row]
                   objectAtIndex:indexOfId]intValue];
    
    
    consulta = [NSString stringWithFormat:@"delete from caso where id_caso=%d",idRegistro];
    
    [self.gestorBD executeQuery:consulta];
    [self cargarDatos];
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
    
    if ([[segue identifier] isEqualToString:@"seguelistacaso"]) {
        NewCaseViewController *destino2 = [segue destinationViewController];
        destino2.delegate=self;
    }
    
    
    
}

@end
