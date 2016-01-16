//
//  NewCaseViewController.m
//  Glass
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 grupo 04. All rights reserved.
//

#import "NewCaseViewController.h"
#import "CaseDetailViewController.h"
#import "GestorBD.h"
#import "Case.h"

@interface NewCaseViewController ()

{
 NSArray * _glassArray;
    //NSString * _tipoCristal;
    NSMutableArray * _detectiveArr;
    /*NSString *_detective;
    NSString *_nombre;
    float _rI;
    float _na;
    float _mg;
    float _al;
    float _si;
    float _k;
    float _ca;
    float _ba;
    float _fe;
    */
    Case *caso;
    
}

@property (nonatomic, strong) GestorBD* gestorBD;

@end

@implementation NewCaseViewController

- (void)viewDidLoad
{
    caso = [[Case alloc] init];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    self.NameText.text = @"Nombre";
    caso._tipoCristal = @"Select Type Glass";
    _glassArray = @[@"Edificio FLotado",@"Edificio no Flotado",@"Vehiculo Flotado",@"Vehiculo no Flotado",@"Contenedor", @"Vajilla",@"Lamparas"];
    
    [self cargarDetectives];
    if (_detectiveArr == NULL)
    [_detectiveArr addObject:@"Jorge"];
    
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    self.glassType.tag = 1;
    self.detectivePicker.tag = 2;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}



-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (pickerView.tag == 1){
    NSLog(@"Soy el picker 1");
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 22)];
    //label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter ;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:8];
    label.text = [NSString stringWithFormat:@"  %@", _glassArray[row]];
    return label;
    }
    else
        NSLog(@"Soy el picker 2");
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 22)];
    //label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter ;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:8];
    label.text = [NSString stringWithFormat:@"  %@", _detectiveArr[row]];
    return label;
   
    
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView.tag == 1){
        return _glassArray.count;
    }
    else {
        return _detectiveArr.count;
    }

    }

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView.tag == 1){
        return _glassArray[row];
    }
    else {
        return _detectiveArr[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView.tag == 1){
    caso._tipoCristal = _glassArray[row];
        
        [_selectType setTitle:caso._tipoCristal forState:UIControlStateNormal];
        //_selectType = _glassArray[row];
        _glassType.hidden = !_glassType.hidden;
        _selectType.hidden = !_selectType.hidden;
        NSLog(@"%@",caso._tipoCristal);
    }
    else{
        caso._detective = _detectiveArr[row];
        
        [_selectDetective setTitle:caso._detective forState:UIControlStateNormal];
        //_selectType = _glassArray[row];
        _detectivePicker.hidden = !_detectivePicker.hidden;
        _selectDetective.hidden = !_selectDetective.hidden;
        NSLog(@"%@",caso._detective);

    }
    
    
    
}

- (IBAction)selectType:(id)sender {
    //[sender setTitle:_tipoCristal forState:UIControlStateNormal];
    _selectType.hidden = !_selectType.hidden;
    _glassType.hidden = !_glassType.hidden;
    

    
}
- (IBAction)selectDetective:(id)sender {
    _selectDetective.hidden = !_selectDetective.hidden;
    _detectivePicker.hidden = !_detectivePicker.hidden;
    
}
- (IBAction)slideValueChanged:(id)sender {
    // Set the label text to the value of the slider as it changes
    self.RILabel.text = [NSString stringWithFormat:@"%.2f", self.RISlider.value];
    self.NaLabel.text = [NSString stringWithFormat:@"%.2f", self.NaSlider.value];
    self.MgLabel.text = [NSString stringWithFormat:@"%.2f", self.MgSlider.value];
    self.AlLabel.text = [NSString stringWithFormat:@"%.2f", self.AlSlider.value];
    self.SiLabel.text = [NSString stringWithFormat:@"%.2f", self.SiSlider.value];
    self.KLabel.text =  [NSString stringWithFormat:@"%.2f", self.KSlider.value];
    self.CaLabel.text = [NSString stringWithFormat:@"%.2f", self.CaSlider.value];
    self.BaLabel.text = [NSString stringWithFormat:@"%.2f", self.BaSlider.value];
    self.FeLabel.text = [NSString stringWithFormat:@"%.2f", self.FeSlider.value];
    
    //value asignation section
    caso._rI = self.RISlider.value;
    caso._na = self.NaSlider.value;
    caso._mg = self.MgSlider.value;
    caso._al = self.AlSlider.value;
    caso._si = self.SiSlider.value;
    caso._k = self.KSlider.value;
    caso._ca = self.CaSlider.value;
    caso._ba = self.BaSlider.value;
    caso._fe = self.FeSlider.value;
    
    //test section
    NSLog(@"%f", caso._rI);
    NSLog(@"%f", caso._na);
    

}
- (IBAction)GuardaDatos:(id)sender {
    NSString * consulta = [NSString stringWithFormat:@"INSERT INTO 'caso' ('nombre','detective','ri','na','mg','al','si','k','ca','ba','fe','tipo') VALUES ('%@','%@','%f','%f','%f','%f','%f','%f','%f','%f','%f','%@')", caso._nombre , caso._detective , caso._rI , caso._na , caso._mg , caso._al , caso._si , caso._k , caso._ca , caso._ba , caso._fe , caso._tipoCristal];
    [self.gestorBD executeQuery:consulta];
    
    //Consulta Base de datos.
    NSLog(@"Guardadatos");
}


- (IBAction)asignaNombre:(id)sender {
    caso._nombre = self.NameText.text;
    NSLog(@"%@", caso._nombre);
}

//Cerrar Teclado al pinchar fuera de pantalla.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

//Cerrar Teclado al pulsar Enter.
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO; //Retorna YES si se permiten saltos de linea
}

-(void)cargarDetectives{
    NSString* consulta = [NSString stringWithFormat:@"select nombre from detective"];
    NSArray* resultado = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    if(resultado != NULL)
    _detectiveArr = [[NSMutableArray alloc] init];
    for (int i = 0; i<resultado.count; i++) {
     //[_detectiveArr addObject:@[[[resultado objectAtIndex:i] objectAtIndex:0]]];
        //NSString *aux = [NSString stringWithFormat:@"%@", [[resultado objectAtIndex:i] objectAtIndex:0]];
        //NSLog(@"%@", aux);
        //[_detectiveArr addObject:aux];
        [_detectiveArr addObject:[[resultado objectAtIndex:i] objectAtIndex:0]];
        NSLog(@"paso por el array la vez %d", i);
    }
    //[_detectiveArr addObject:@[[[resultado objectAtIndex:2] objectAtIndex:0]]];
    NSLog(@"Conenido Array %@", _detectiveArr);
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"idSegueGuardado"]) {
        CaseDetailViewController *destino = [segue destinationViewController];
        destino.casoGuardado = caso;
    }
}

@end
