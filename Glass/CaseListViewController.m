//
//  CaseListViewController.m
//  Glass
//
//  Created by Salvador Briones Rosales on 11/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import "CaseListViewController.h"
#import "GestorBD.h"
@interface CaseListViewController ()

@property (nonatomic, strong) GestorBD* gestorBD;
@property (nonatomic, strong) NSArray* arrayDatos;
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
    //self.tabla.delegate = self;
    //self.tabla.dataSource = self;
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    //[self cargarDatos];
}
-(IBAction)addRegistro:(id)sender{
    //self.idRegistroEditar = -1;
    [self performSegueWithIdentifier:@"idSegueDetalle" sender:self];
}
-(void) cargarDatos{
    //seleccionamos la tabla CASO
    NSString *consulta = @"select * from caso";
    if (self.arrayDatos != nil) self.arrayDatos = nil; self.arrayDatos = [[NSArray alloc] initWithArray:[self.gestorBD
                                                                                                         selectFromDB:consulta]];
    //actualizamos la tabla
    [self.tabla reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{ return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayDatos.count; }
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger indexOfNombre = [self.gestorBD.arrNombresCols indexOfObject:@"nombre"];
    NSInteger indexOfRol = [self.gestorBD.arrNombresCols indexOfObject:@"detective"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row]
                                                             objectAtIndex:indexOfNombre]];cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",
                                                                                                                         [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfRol]];
    return cell;
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

@end
