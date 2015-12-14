//
//  NewCaseViewController.m
//  Glass
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 grupo 04. All rights reserved.
//

#import "NewCaseViewController.h"

@interface NewCaseViewController ()
{
 NSArray * _glassArray;
    NSString * _tipoCristal;
}
@end

@implementation NewCaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tipoCristal = @"Select Type Glass";
    _glassArray = @[@"Edificio FLotado",@"Edificio no Flotado",@"Vehiculo Flotado",@"Vehiculo no Flotado",@"Contenedor", @"Vajilla",@"Lamparas"];
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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 22)];
    //label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter ;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:8];
    label.text = [NSString stringWithFormat:@"  %@", _glassArray[row]];
    return label;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _glassArray.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _glassArray[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _tipoCristal = _glassArray[row];
    
    [_selectType setTitle:_tipoCristal forState:UIControlStateNormal];
    //_selectType = _glassArray[row];
    _glassType.hidden = !_glassType.hidden;
    _selectType.hidden = !_selectType.hidden;
    NSLog(@"%@",_tipoCristal);
    
}

- (IBAction)selectType:(id)sender {
    //[sender setTitle:_tipoCristal forState:UIControlStateNormal];
    _selectType.hidden = !_selectType.hidden;
    _glassType.hidden = !_glassType.hidden;
    
}
- (IBAction)slideValueChanged:(id)sender {
    // Set the label text to the value of the slider as it changes
    self.RILabel.text = [NSString stringWithFormat:@"%f", self.RISlider.value];}
@end
