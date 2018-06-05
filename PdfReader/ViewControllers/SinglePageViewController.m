//
//  ViewController.m
//  PdfReader
//
//  Created by User on 04.06.2018.
//  Copyright © 2018 Garon. All rights reserved.
//

#import "SinglePageViewController.h"


@implementation SinglePageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_pdfView != nil)
    {
        _pdfView.displayMode = kPDFDisplaySinglePage;
        [_pdfView usePageViewController:YES withViewOptions:nil];
    }
}


- (IBAction)goBackAction:(UIBarButtonItem *)sender
{
    [_pdfView goToPreviousPage:nil];
}


- (IBAction)goForwardAction:(UIBarButtonItem *)sender
{
    [_pdfView goToNextPage:nil];
}


@end
