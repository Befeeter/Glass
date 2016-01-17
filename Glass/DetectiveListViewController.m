//
//  DetectiveListViewController.m
//  Glass
//
//  Created by Jorge Martinez Carvajal on 17/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import "DetectiveListViewController.h"
#import "GestorBD.h"

@interface DetectiveListViewController ()

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
    
    self.tabla.delegate = self;
    self.tabla.dataSource = self;
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    [self cargarDatos];
    
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
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger indexOfNombre = [self.gestorBD.arrNombresCols indexOfObject:@"nombre"];
    NSInteger indexOfRol = [self.gestorBD.arrNombresCols indexOfObject:@"apellidos"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfNombre]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfRol]];
    return cell;
}

@end
