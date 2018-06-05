//
//  BaseViewController.h
//  PdfReader
//
//  Created by User on 04.06.2018.
//  Copyright © 2018 Garon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PDFKit/PDFKit.h>

@interface BaseViewController : UIViewController
{
    PDFView *_pdfView;
    UIView *_parentView;
    PDFPage *_currentPage;
    UIButton *_searchButton;
}

@end
