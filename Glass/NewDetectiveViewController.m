//
//  NewDetectiveViewController.m
//  Glass
//
//  Created by Jorge Martinez Carvajal on 16/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import "NewDetectiveViewController.h"
#import "DetectiveDetailViewController.h"
#import "GestorBD.h"
#import "Detective.h"

@interface NewDetectiveViewController (){
    Detective *detective;
}

@property (nonatomic, strong) GestorBD* gestorBD;
@end

@implementation NewDetectiveViewController


UIToolbar *toolBar;


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
    detective= [[Detective alloc] init];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.gestorBD = [[GestorBD alloc] initWithDatabaseFilename:@"Glass.sqlite"];
    
    
    fechaPicker=[[UIDatePicker alloc]init];
    fechaPicker.datePickerMode=UIDatePickerModeDate;
    

    
    
    [self.fecha setInputView:fechaPicker];
    
    
        
    
    toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn= [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action: @selector(VerFechaSeleccionada)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space, doneBtn, nil]];
    [self.fecha setInputAccessoryView:toolBar];
}

- (IBAction)chooseImage:(id)sender
{
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    [self.imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.chosenImage = info[UIImagePickerControllerOriginalImage];
    [self.imageView setImage:self.chosenImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil]; 
}


- (void) VerFechaSeleccionada{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/mm/yyyy"];
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
       NSString * consulta= [NSString stringWithFormat:@"INSERT INTO 'detective' ('nombre','apellidos','fecha') VALUES ('%@','%@','%@')", detective._Nombre, detective._Apellidos, detective._Fecha];
    [self.gestorBD executeQuery:consulta];
    
    NSLog(@"%@", detective._Fecha);
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
