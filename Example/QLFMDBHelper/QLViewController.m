//
//  QLViewController.m
//  QLFMDBHelper
//
//  Created by Paramita on 06/26/2019.
//  Copyright (c) 2019 Paramita. All rights reserved.
//

#import "QLViewController.h"
#import <QLFMDBHelper/QLFMDBHelper.h>
@interface QLViewController ()

@end

@implementation QLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 0, NO).firstObject;
    [path stringByAppendingPathComponent:@"testDB.sqlite"];
    [[QLFMDBHelper dbHelper] createWithDBPath:path encryptKey:@"this--is&()00"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
