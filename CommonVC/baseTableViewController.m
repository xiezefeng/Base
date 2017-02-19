#import "baseTableViewController.h"
//#import "BBLoginViewController.h"
//#import "User.h"
//设置字体大小
#define _TITLE_FONT_SIZE_    16.0f
#define _SUBTITLE_FONT_SIZE_ 14.0f
#define _DETAIL_FONT_SIZE_   12.0f
//获取设备的物理宽度
#define DeviceWidth [UIScreen mainScreen].bounds.size.width
//获取设备的物理高度
#define DeviceHeight [UIScreen mainScreen].bounds.size.height
@implementation baseTableViewController
-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource=[NSMutableArray array];
    }
    return _dataSource;
}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    [self presentViewController:[BBLoginViewController new] animated:YES completion:nil];
//}
- (nullable instancetype)init
{
    return [self initWithStyle:UITableViewStylePlain];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if(self)
    {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight) style:style];
//        self.tableView.delegate   = self;
//        self.tableView.dataSource = self;
        self.dataSource = [[NSMutableArray alloc] init];
        
        self.tableView.emptyDataSetSource = self;
        self.tableView.emptyDataSetDelegate = self;
        
//        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDown:)];
//        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(pullUp:)];
    }
    
    return self;
}
-(void)endLoad{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    //[self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight) style:UITableViewStylePlain];
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    [self.view addSubview:self.tableView];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDown:)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(pullUp:)];

    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 20)];
    [footView setBackgroundColor:[UIColor clearColor]];
    self.tableView.tableFooterView = footView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.backgroundColor = self.tableView.mj_footer.backgroundColor =self.tableView.mj_header.backgroundColor = self.view.backgroundColor;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self.dataSource removeAllObjects];
}



#pragma mark reflush
- (void)pullDown:(id)sender
{
    [self.tableView.mj_header endRefreshing];
    
}

- (void)pullUp:(id)sender
{
    [self.tableView.mj_footer endRefreshing];
    
}



#pragma mark -- tableview delegate --
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.dataSource.count > 0)
    {
        return [[self.dataSource objectAtIndex:section] count];
    }
    else
    {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.dataSource.count;
//}

#pragma mark -- scrollview delegate --
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if([scrollView isDragging])
    {
        [self.view endEditing:YES];
    }
}

#pragma mark -- empty delete --
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return self.dataSource.count == 0;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:_TITLE_FONT_SIZE_],NSForegroundColorAttributeName:[UIColor blackColor]};
    return [[NSAttributedString alloc] initWithString:@"" attributes:attribute];
}


- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:_SUBTITLE_FONT_SIZE_],NSForegroundColorAttributeName:[UIColor darkGrayColor]};
    return [[NSAttributedString alloc] initWithString:@"" attributes:attribute];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"generl_nodata"];
}
@end

