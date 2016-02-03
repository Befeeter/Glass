//
//  NewDetectiveViewController.m
//  Glass
//
//  Created by Jorge Martinez Carvajal on 16/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//


#import "DetectiveListViewController.h"
#import "NewDetectiveViewController.h"
#import "DetectiveDetailViewController.h"
#import "GestorBD.h"
#import "Detective.h"

@interface NewDetectiveViewController (){
    Detective *detective;
}


@property (nonatomic, strong) NSArray* arrayDatos;
@property (nonatomic, strong) GestorBD* gestorBD;
@property (weak, nonatomic) IBOutlet UIButton *botonGuardar;




@end





@implementation NewDetectiveViewController


UIToolbar *toolBar;

- (IBAction)activarbotonGuardar:(id)sender {
    
    if ((self.NombreTextBox.text.length != 0) && (self.ApellidosTextBox.text.length != 0) && (self.fecha.text.length != 0)) {
        [self.botonGuardar setEnabled:YES];
        [self.botonGuardar setBackgroundColor:[UIColor greenColor]];
    }
    else {
        [self.botonGuardar setBackgroundColor:[UIColor redColor]];
        [self.botonGuardar setEnabled:NO];
        
    }
    
    
    
    
    
    
    
    
    
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
    
    
    [self.botonGuardar setBackgroundColor:[UIColor redColor]];    [self.botonGuardar setEnabled:NO];
    
    
    
    
    detective= [[Detective alloc] init];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    
    
    fechaPicker=[[UIDatePicker alloc]init];
    fechaPicker.datePickerMode=UIDatePickerModeDate;
    
    [self.fecha setInputView:fechaPicker];
    
    
    
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    
    
    NSLog(@"La fecha actual es%@",currentDate);
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
   
    NSDate *maxDate = [gregorian dateByAddingComponents:comps toDate:currentDate  options:0];
    
        fechaPicker.maximumDate = maxDate;
    
    
    
    toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn= [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action: @selector(VerFechaSeleccionada)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space, doneBtn, nil]];
    [self.fecha setInputAccessoryView:toolBar];
    
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


//Selecion imagen galeria
- (IBAction)chooseImage:(id)sender
{
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    [self.imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
}


//Obtencion imagen galeria
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.chosenImage = info[UIImagePickerControllerOriginalImage];
    [self.imageView setImage:self.chosenImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}


//Cancelacion PickerController
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil]; 
}


//////////////////////////////////////////////////////////////////////////////////////////////////
//
//    //OBTENER IMAGEN CAPTURADA
//    UIImage *Image = (UIImage *)info[UIImagePickerControllerOriginalImage];
//
//    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *imageSubdirectory = [documentsDirectory stringByAppendingPathComponent:@"SubCarpetaNombre"];
//    NSString *filePath = [imageSubdirectory stringByAppendingPathComponent:@"ImageNombre.png"];
//
//
//    //CONVERTIR UIImage A NSData GENERADA EN PNG
//    NSData *imageData = UIImagePNGRepresentation(self.chosenImage);
//    [imageData writeToFile:filePath atomically:YES];
//
//////////////////////////////////////////////////////////////////////////////////////////////////



- (void) VerFechaSeleccionada{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    self.fecha.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:fechaPicker.date]];
    [self.fecha resignFirstResponder];
                     
                     
                     }




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AsignaNombre:(id)sender {
    detective._Nombre= self.NombreTextBox.text;
    
    }

- (IBAction)AsignaApellidos:(id)sender {
    
    detective._Apellidos= self.ApellidosTextBox.text;
}
- (IBAction)AsignaFecha:(id)sender {
    detective._Fecha=self.fecha.text;
    }


- (IBAction)GuardarDatos:(id)sender {
    
    NSString * consulta2 = [NSString stringWithFormat:@"select * from 'detective' where nombre='%@' and apellidos='%@' and fecha='%@'", detective._Nombre, detective._Apellidos, detective._Fecha];
  if (self.arrayDatos != nil) self.arrayDatos = nil; self.arrayDatos = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta2]];
    
    if([self.arrayDatos count]==0){
    
    
    NSString * consulta= [NSString stringWithFormat:@"INSERT INTO 'detective' ('nombre','apellidos','fecha') VALUES ('%@','%@','%@')", detective._Nombre, detective._Apellidos, detective._Fecha];
    [self.gestorBD executeQuery:consulta];
    
   [self.delegate editionDidFinished];
    
    
    
    
    UIAlertView *alerta= [[UIAlertView alloc] initWithTitle:@"CONGRATULATIONS!" message:@"New Detective has been Created " delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
    [alerta show];
    }
    else{
    UIAlertView *alerta2= [[UIAlertView alloc] initWithTitle:@"REPLICATED" message:@"There is an identical record in the database , please change data" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
    [alerta2 show];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"seguedetective2"]) {
        DetectiveDetailViewController *destination = [segue destinationViewController];
        destination.detectiveguardado= detective;
    }
    
    
    


}













@end
