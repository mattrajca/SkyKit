//
//  ViewController.m
//  SkyKit
//
//  Copyright (c) 2013 Matt Rajca. All rights reserved.
//

#import "ViewController.h"

#import <MapKit/MapKit.h>

@interface ViewController () < MKMapViewDelegate >

@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}

- (void)awakeFromNib {
	MKMapView *mv = [[MKMapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	mv.delegate = self;
	
	MKTileOverlay *overlay = [[MKTileOverlay alloc] initWithURLTemplate:
							  @"http://mw1.google.com/mw-planetary/sky/skytiles_v1/{x}_{y}_{z}.jpg"];
	overlay.canReplaceMapContent = YES;
	[mv addOverlay:overlay level:MKOverlayLevelAboveLabels];
	
	[self.view addSubview:mv];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
	return [[MKTileOverlayRenderer alloc] initWithTileOverlay:overlay];
}

@end
