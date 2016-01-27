//
//  DetectiveListViewController.m
//  Glass
//
//  Created by Jorge Martinez Carvajal on 17/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import "DetectiveListViewController.h"
#import "GestorBD.h"
#import "DetectiveDetailViewController.h"
#import "Detective.h"

@interface DetectiveListViewController (){
    
    Detective *detective;
}

@property (nonatomic, strong) GestorBD* gestorBD;
@property (nonatomic, strong) NSArray* arrayDatos;

- (void) cargarDatos;

@end

@implementation DetectiveListViewController


-(void) editionDidFinished{
    [self cargarDatos];
}



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
    detective=[[Detective alloc]init];
    self.tabla.delegate = self;
    self.tabla.dataSource = self;
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
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
    
#ifdef VERSION2
    _addDetective.enabled = NO;
#endif
    
#ifdef VERSION3
    _addDetective.enabled = NO;
#endif
    // Do any additional setup after loading the view.
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) cargarDatos{
    NSString *consulta = @"select * from detective";
    if (self.arrayDatos != nil) self.arrayDatos = nil; self.arrayDatos = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    //actualizamos la tabla
    [self.tabla reloadData];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayDatos.count;
}

-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int idRegistro;
    NSString *consulta;
    
    
    
    if (editingStyle != UITableViewCellEditingStyleDelete) return;
    
      NSInteger indexOfId = [self.gestorBD.arrNombresCols indexOfObject:@"id_placa"];
    
    idRegistro = [[[self.arrayDatos objectAtIndex:indexPath.row]
                   objectAtIndex:indexOfId]intValue];
    
    
    consulta = [NSString stringWithFormat:@"delete from detective where id_placa=%d",idRegistro];
    
    [self.gestorBD executeQuery:consulta];
    [self cargarDatos];
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger indexOfNombre = [self.gestorBD.arrNombresCols indexOfObject:@"nombre"];
    NSInteger indexOfRol = [self.gestorBD.arrNombresCols indexOfObject:@"apellidos"];
    
    
    
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfNombre]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfRol]];
    return cell;
    
    
    
}

-(void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *)indexPath{
    
     detective._IdPlaca = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:0]intValue];
     detective._Nombre= [NSString stringWithFormat:@"%@",[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:1]];
    detective._Apellidos= [NSString stringWithFormat:@"%@",[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:2]];
   //TERMINAR LO DE LA FECHA
    detective._Fecha= [NSString stringWithFormat:@"%@",[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:3]];
    
    
    
[self performSegueWithIdentifier:@"seguedetective" sender:self];
    
    
    
}






- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"seguedetective"]) {
        DetectiveDetailViewController *destination = [segue destinationViewController];
        destination.detectiveguardado= detective;
        
    }
    
    if ([[segue identifier] isEqualToString:@"seguelista"]) {
        NewDetectiveViewController *destination2 = [segue destinationViewController];
        destination2.delegate=self;
        
    }


}











@end
