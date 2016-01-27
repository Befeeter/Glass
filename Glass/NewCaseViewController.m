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
    _glassArray = @[@"build wind float",@"build wind non-float",@"vehic wind float",@"vehic wind non-float",@"containers", @"tableware",@"headlamps"];
    
    [self cargarDetectives];
    if (_detectiveArr == NULL)
    [_detectiveArr addObject:@"Jorge"];
    
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    self.glassType.tag = 1;
    self.detectivePicker.tag = 2;
    
    
    
    
#ifdef VERSION2
    [_botonGuardar setTitle:@"Ok" forState:UIControlStateNormal];
    self.title = @"Consult Case";
    _NameText.hidden = YES;
    _selectDetective.hidden = YES;
    _selectType.hidden = YES;
#endif
    
#ifdef VERSION3
    [_botonGuardar setTitle:@"Ok" forState:UIControlStateNormal];
    self.title = @"Consult Case";
    _NameText.hidden = YES;
    _selectDetective.hidden = YES;
    _selectType.hidden = YES;
#endif
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
        //NSLog(@"Soy el picker 1");
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 22)];
        //label.backgroundColor = [UIColor lightGrayColor];
        label.textColor = [UIColor blueColor];
        label.textAlignment = NSTextAlignmentCenter ;
        label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:8];
        label.text = [NSString stringWithFormat:@"  %@", _glassArray[row]];
        return label;
    }
    //else
        //NSLog(@"Soy el picker 2");
    
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
    #ifdef VERSION1
        NSString * consulta = [NSString stringWithFormat:@"INSERT INTO 'caso' ('nombre','detective','ri','na','mg','al','si','k','ca','ba','fe','tipo') VALUES ('%@','%@','%f','%f','%f','%f','%f','%f','%f','%f','%f','%@')", caso._nombre , caso._detective , caso._rI , caso._na , caso._mg , caso._al , caso._si , caso._k , caso._ca , caso._ba , caso._fe , caso._tipoCristal];
        [self.gestorBD executeQuery:consulta];
         [self.delegate editionDidFinished];         //Consulta Base de datos.
        NSLog(@"Guarda datos");
    
        //Consulta Base de datos.
        //NSLog(@"Guarda datos");
        NSString * mensaje = [NSString stringWithFormat:@"The Case '%@' has been created", caso._nombre];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Case Created"
                                                    message:mensaje
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
        [alert show];
    #endif
    
    #ifdef VERSION2
    
    if (caso._mg < 2.55){
        if (caso._na < 13.82){
            if (caso._rI < 1.52){
                caso._tipoCristal = @"containers";
            }
            else{
                caso._tipoCristal = @"build wind non-float";
            }
                
        }
        else {
            if (caso._ba < 0.2){
                caso._tipoCristal = @"tableware";
            }
            else{
                caso._tipoCristal = @"headlamp";
            }
        }
    }
    else{
        if (caso._rI < 1.52) {
            caso._tipoCristal = @"build wind non-float";
        }
        else{
            if (caso._mg < 3.35) {
                caso._tipoCristal = @"build wind non-float";
            }
            else{
                if (caso._fe < 0.22) {
                    if (caso._na <13.37){
                        if (caso._rI < 1.52){
                            caso._tipoCristal = @"build wind float";
                        }
                        else{
                            if (caso._mg < 3.66) {
                                caso._tipoCristal = @"build wind float";
                            }
                            else{
                                caso._tipoCristal = @"build wind non-float";
                            }
                        }
                    }
                    else{
                        if (caso._rI < 1.52) {
                            if (caso._rI <1.52) {
                                caso._tipoCristal = @"build wind float";
                            }
                            else{
                                caso._tipoCristal = @"build wind non-float";
                            }
                        }
                        else{
                            caso._tipoCristal = @"build wind float";
                        }
                    }
                }
                else{
                    caso._tipoCristal = @"build wind non-float";
                }
            }
        }
    }
    NSString * mensaje = [NSString stringWithFormat:@"Result of query is: '%@'", caso._tipoCristal];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Type of Glass"
                                                    message:mensaje
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    //NSLog(@"%@",caso._tipoCristal);
#endif

#ifdef VERSION3
    NSString * url_str = [NSString stringWithFormat:@"http://www.manelme.com/WekaWrapper/glass;attr1=%f;attr2=%f;attr3=%f;attr4=%f;attr5=%f;attr6=%f;attr7=%f;attr8=%f", caso._rI, caso._na , caso._mg , caso._al , caso._k , caso._ca , caso._ba , caso._fe];
    NSLog(@"%@", url_str);
    
    NSURL *url = [NSURL URLWithString:url_str];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    //Realizamos la consulta
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //Conversión de NSData a NSString
    NSString *strResponse = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //Mostramos el valor de la consulta a la etiqueta/label.
    caso._tipoCristal = strResponse;
    
    //NSLog(@"%@",strResponse);
    NSString * mensaje = [NSString stringWithFormat:@"Result of query is: '%@'", caso._tipoCristal];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Type of Glass"
                                                    message:mensaje
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
                        
#endif

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
