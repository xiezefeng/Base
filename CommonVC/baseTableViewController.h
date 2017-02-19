//
//  baseTableViewController.h
//  communityProgram
//
//

#import "BaseViewController.h"
#import <Foundation/Foundation.h>
#import "MJRefresh.h"
#import "UIScrollView+MJRefresh.h"
#import "UIScrollView+EmptyDataSet.h"

@interface baseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

- (nullable instancetype)init;

- (nullable instancetype)initWithStyle:(UITableViewStyle)style;

@property (nonatomic, strong, nullable) UITableView *tableView;

@property (nonatomic, strong, nullable) NSMutableArray *dataSource;

-(void)endLoad;

- (void)pullDown:(_Nonnull id)sender;
- (void)pullUp:(_Nonnull id)sender;

@end
