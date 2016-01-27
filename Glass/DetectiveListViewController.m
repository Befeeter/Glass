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
    
    
#ifdef VERSION2
    _addDetective.enabled = NO;
#endif
    
#ifdef VERSION3
    _addDetective.enabled = NO;
#endif
    // Do any additional setup after loading the view.
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


}









@end
