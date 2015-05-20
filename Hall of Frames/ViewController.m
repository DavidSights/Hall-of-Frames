//
//  ViewController.m
//  Hall of Frames
//
//  Created by David Seitz Jr on 5/20/15.
//  Copyright (c) 2015 DavidSights. All rights reserved.
//

#import "ViewController.h"
#import "PictureCollectionViewCell.h"



@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property NSMutableArray *pictures;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image1, *image2, *image3, *image4, *image5;
    image1 = [UIImage imageNamed:@"beach"];
    image2 = [UIImage imageNamed:@"mountains"];
    image3 = [UIImage imageNamed:@"lodge"];
    image4 = [UIImage imageNamed:@"moon"];
    image5 = [UIImage imageNamed:@"vista"];

    self.pictures = [[NSMutableArray alloc]initWithObjects:image1, image2, image3, image4, image5, nil];
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
    cell.imageView.image = [self.pictures objectAtIndex:indexPath.row];

    return cell;
}


@end
