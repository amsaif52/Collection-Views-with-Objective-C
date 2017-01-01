//
//  ASMCollectionViewController.m
//  PhotoPhun
//
//  Created by Ali Asgar Merchant on 1/1/17.
//  Copyright © 2017 Ali Asgar Merchant. All rights reserved.
//

#import "ASMCollectionViewController.h"
#import "ASMCollectionViewCell.h"

@interface ASMCollectionViewController ()

@end

@implementation ASMCollectionViewController

-(void)viewDidLoad{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"PhotoPun";
    [self refreshPhotos];
}

-(void)refreshPhotos{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://swapi.co/api/people/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *responseText=[[NSString alloc] initWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"ResponseText: %@",responseText);
    }];
    [task resume];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 49;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ASMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoPhunCell" forIndexPath:indexPath];
    
    cell.photoView.image = [UIImage imageNamed:@"my_pic"];
    
    return cell;
}


@end
