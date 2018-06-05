//
//  BaseViewController.m
//  PdfReader
//
//  Created by User on 04.06.2018.
//  Copyright © 2018 Garon. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _parentView = self.view;
    
    _pdfView = [[PDFView alloc] initWithFrame:_parentView.bounds];
    
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test_pdf"
//                                         withExtension:@"pdf"];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"latex"
                                         withExtension:@"pdf"];
    PDFDocument *pdfDocument = [[PDFDocument alloc] initWithURL:url];
    [_pdfView setDocument:pdfDocument];
    
    _pdfView.autoScales = YES;
    _pdfView.displayMode = kPDFDisplaySinglePageContinuous;

    [_parentView addSubview:_pdfView];
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    
    [[tabBar.items objectAtIndex:0] setTitle:@"All Pages"];
    [[tabBar.items objectAtIndex:1] setTitle:@"Single Pages"];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_searchButton addTarget:self
                      action:@selector(createSearchAlert)
            forControlEvents:UIControlEventTouchDown];
    [_searchButton setTitle:@"Search"
                   forState:UIControlStateNormal];
    [_searchButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_searchButton.layer setBorderColor:[[UIColor clearColor] CGColor]];
    [_searchButton.layer setBorderWidth:5.0];
    _searchButton.backgroundColor = [UIColor colorWithWhite:0.25 alpha:0.1];
    _searchButton.frame = CGRectMake(0.0,
                                     [[UIScreen mainScreen] bounds].size.height - 2.0 * tabBar.frame.size.height,
                                     tabBar.frame.size.width,
                                     tabBar.frame.size.height);
    [self.tabBarController.view addSubview:_searchButton];
}


- (void)createSearchAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Search page"
                                                                   message:@"Enter page number"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *submit = [UIAlertAction actionWithTitle:@"Search"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action)
                             {
                                 if (alert.textFields.count > 0)
                                 {
                                     UITextField *textField = [alert.textFields firstObject];
                                     
                                     NSString *text = textField.text;
                                     NSUInteger index = [text intValue];
                                     
                                     if (index != 0)
                                     {
                                         index--;
                                     }
                                     
                                     [self searchPageWithIndex:index];
                                 }
                             }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    
    [alert addAction:submit];
    [alert addAction:cancel];
    
    [alert addTextFieldWithConfigurationHandler:nil];
    [[alert.textFields firstObject] setKeyboardType:UIKeyboardTypeNumberPad];
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)searchPageWithIndex:(NSUInteger)index
{
    PDFPage *numberedPage = [_pdfView.document pageAtIndex:index];
    [_pdfView goToPage:numberedPage];
}


@end
