//
//  AllPagesViewController.m
//  PdfReader
//
//  Created by User on 04.06.2018.
//  Copyright © 2018 Garon. All rights reserved.
//

#import "AllPagesViewController.h"


@implementation AllPagesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_pdfView != nil)
    {
        _pdfView.displayMode = kPDFDisplaySinglePageContinuous;
        [_pdfView usePageViewController:NO withViewOptions:nil];
        [_pdfView goToPage:_currentPage];
    }
}


@end
