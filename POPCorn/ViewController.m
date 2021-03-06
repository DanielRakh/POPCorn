//
//  ViewController.m
//  POPCorn
//
//  Created by Daniel Rakhamimov on 5/25/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *properties;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.properties = @[@"Position",@"Scale",@"Third",@"Fourth"].mutableCopy;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.properties.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"PropertyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.properties[indexPath.row];
    
    return cell;
    
}

#pragma mark - Table View Delegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *propertyName = self.properties[indexPath.row];
    
    if ([propertyName isEqualToString:@"Position"]) {
        [self performSegueWithIdentifier:@"pushToPosition" sender:self];
    } else if ([propertyName isEqualToString:@"Scale"]) {
        [self performSegueWithIdentifier:@"pushToScale" sender:self];
    }
    
}


@end
