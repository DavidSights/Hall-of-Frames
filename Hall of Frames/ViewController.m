//
//  ViewController.m
//  Hall of Frames
//
//  Created by David Seitz Jr on 5/20/15.
//  Copyright (c) 2015 DavidSights. All rights reserved.
//

#import "ViewController.h"
#import "PictureCollectionViewCell.h"
#import "PictureWithProperties.h"
#import "ColorPickerView.h"


@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, CustomViewDelegate>

@property NSMutableArray *pictures;
@property PictureWithProperties *picture1, *picture2, *picture3, *picture4, *picture5, *pictureToUpdate;
@property ColorPickerView *colorPickerView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Importaint! PictureWithProperty instances will not exist until allocated and initialized - caused lots of wasted time by not doing this right away...
    self.picture1 = [PictureWithProperties new];
    self.picture2 = [PictureWithProperties new];
    self.picture3 = [PictureWithProperties new];
    self.picture4 = [PictureWithProperties new];
    self.picture5 = [PictureWithProperties new];

    //Add images to PictureWithProperties instances
    self.picture1.image = [UIImage imageNamed:@"beach"];
    self.picture2.image = [UIImage imageNamed:@"mountains"];
    self.picture3.image = [UIImage imageNamed:@"lodge"];
    self.picture4.image = [UIImage imageNamed:@"moon"];
    self.picture5.image = [UIImage imageNamed:@"vista"];

    //Add PictureWithProperty instances to self.pictures array
    self.pictures = [NSMutableArray arrayWithObjects:self.picture1, self.picture2, self.picture3, self.picture4, self.picture5, nil];

    //Make sure default background color of cells are white.
    for (PictureWithProperties *picture in self.pictures) {
        picture.frameColor = [UIColor whiteColor];
    }

    //Create colorPickerView, attach it to CustomizationView.xib, and set its delegate to self/view controller
    self.colorPickerView = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];
    self.colorPickerView.delegate = self;

    //Trying to set colorPickerView size to current view, but not working!
    [self.colorPickerView sizeThatFits:[[UIScreen mainScreen] bounds].size];
}


//This tells the collectionView how many cells to create
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    //Number of cells in our pictures array
    return self.pictures.count;
}


//This tells the collectionView how to customize each cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    //Specify cell to populate
    PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];

    //Customize elements within that cell
    PictureWithProperties *picture = [self.pictures objectAtIndex:indexPath.row];
    cell.imageView.image = picture.image;
    cell.backgroundColor = picture.frameColor;

    return cell;
}


//This happens when a cell is tapped/selected
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    //Use the instance of colorPickerView and set its pictureWithProperties instance equal to the picture object we want affected, then show the view
    self.colorPickerView.picture = [self.pictures objectAtIndex:indexPath.row];
    [self.view addSubview:self.colorPickerView];
}


//colorPickerView is telling us a button was tapped and gives us a chance to respond
-(void)buttonTapped  {
    [self.collectionView reloadData];
}


@end
