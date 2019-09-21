//
//  ViewController.m
//  NoNotch
//
//  Created by Андрей Зябкин on 06.03.2019.
//  Copyright © 2019 Андрей Зябкин. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Установка текста-инструкции
    
    textLabel.numberOfLines=0;
    textLabel.text = [NSString stringWithFormat:@"%@ \r %@ \r %@ \r %@",@"1. Select image",@"2. Select form", @"3. Save to photos", @"4. Set background"];
    
    //Определение модели телефона
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        switch ((int)[[UIScreen mainScreen] nativeBounds].size.height) {
            case 2436:
                printf("iPhone X, XS");
                numberOfDevice=1;
                break;
                
            case 2688:
                printf("iPhone XS Max");
                numberOfDevice=3;
                break;
                
            case 1792:
                printf("iPhone XR");
                numberOfDevice=2;
                break;
                
            default:
                printf("Other");
                numberOfDevice=0;
                break;
        }
    }
}


-(IBAction)buttonPressed:(id)sender{
    
    /*
    profile_picture.layer.cornerRadius = 10
    profile_picture.clipsToBounds = true
    profile_picture.layer.borderWidth = 3
    profile_picture.layer.borderColor = UIColor.white.cgColor
     */
    
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 20;
    
    //UIImage *testImage = imageView.image;
    //UIImageWriteToSavedPhotosAlbum(testImage, nil, nil, nil);
}

//Сохранение обоев 
-(IBAction)save{
    
    UIGraphicsBeginImageContext(containerView.bounds.size);
    [containerView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *savedImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(savedImg, nil, nil, nil);
    
}


//Выбираем изображение из галереи
-(IBAction)selectPhoto{
    

    UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];
    pickerView.allowsEditing = NO;
    pickerView.delegate = self;
    [pickerView setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:pickerView animated:YES completion:nil];
    
    
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissViewControllerAnimated:YES completion:nil];
    //UIImage * img = [info valueForKey:UIImagePickerControllerEditedImage];
    UIImage * img = [info valueForKey:UIImagePickerControllerOriginalImage];
    [imageView setImage:img];
    
    //Убираем подсказку
    textLabel.alpha=0;
}

-(IBAction)clearPressed{
    upperImageView.alpha=0.0;
}

-(IBAction)straightPressed:(id)sender{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    [upperImageView setImage:[UIImage imageNamed:@"square.png"]];
    
    CGRect upperFrame;
    if (numberOfDevice==2)
        upperFrame=CGRectMake(0, 0, self.view.bounds.size.width, 34);
    else
        upperFrame=CGRectMake(0, 0, self.view.bounds.size.width, 30);
    [upperImageView setFrame:upperFrame];
    
    if (upperImageView.alpha==0.0)
        upperImageView.alpha=1.0;
    
    [UIView commitAnimations];
    
}

-(IBAction)gradientPressed:(id)sender{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    [upperImageView setImage:[UIImage imageNamed:@"gradient2.png"]];
    
    CGRect upperFrame=CGRectMake(0, 0, self.view.bounds.size.width, 80);
    
    [upperImageView setFrame:upperFrame];
    
    if (upperImageView.alpha==0.0)
        upperImageView.alpha=1.0;
    
    [UIView commitAnimations];
    
}

-(IBAction)roundedPressed:(id)sender{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    [upperImageView setImage:[UIImage imageNamed:@"rounded.png"]];
    //CGRect upperFrame=CGRectMake(0, 0, self.view.bounds.size.width, 70);
    CGRect upperFrame;
    if (numberOfDevice==2)
        upperFrame=CGRectMake(0, 0, self.view.bounds.size.width, 78);
    else
        upperFrame=CGRectMake(0, 0, self.view.bounds.size.width, 70);
    
    [upperImageView setFrame:upperFrame];
    
    if (upperImageView.alpha==0.0)
        upperImageView.alpha=1.0;
    
    [UIView commitAnimations];
    
}

@end
