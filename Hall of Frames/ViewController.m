//
//  ViewController.m
//  Hall of Frames
//
//  Created by David Seitz Jr on 5/20/15.
//  Copyright (c) 2015 DavidSights. All rights reserved.
//

#import "ViewController.h"
#import "PictureCollectionViewCell.h"
#import "Picture.h"
#import "CustomView.h"



@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, CustomViewDelegate>

@property NSMutableArray *pictures;
@property Picture *picture;
@property CustomView *colorPicker;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //create images to put into array
    UIImage *image1, *image2, *image3, *image4, *image5;
    image1 = [UIImage imageNamed:@"beach"];
    image2 = [UIImage imageNamed:@"mountains"];
    image3 = [UIImage imageNamed:@"lodge"];
    image4 = [UIImage imageNamed:@"moon"];
    image5 = [UIImage imageNamed:@"vista"];

    self.pictures = [[NSMutableArray alloc]initWithObjects:image1, image2, image3, image4, image5, nil];
    self.picture = [[Picture alloc]  initWithPictures:self.pictures];

    //create color picker view, attached it to CustomizationView.xib, and set delegate to self/view controller
    self.colorPicker = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];
    self.colorPicker.delegate = self;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.view addSubview:self.colorPicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.pictures.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];

    cell.testLabel.text = @"This is working.";
    self.picture.image = [self.picture.pictures objectAtIndex:indexPath.row];
    cell.imageView.image = self.picture.image;

    return cell;
}

-(void)buttonTapped:(UIButton *)button {
    NSLog(@"Button pressed!!!");
}


@end
