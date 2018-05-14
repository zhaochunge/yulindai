//
//  PlaceVC.m
//  Yulindai
//
//  Created by zcg on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "PlaceVC.h"

@interface PlaceVC ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)LTView *numView;
@property(nonatomic,strong)LTView *phoneView;
@property(nonatomic,strong)LTView *addressView;
@property(nonatomic,strong)LTView *cityView;
//@property(nonatomic,strong)LTView *loanView;
@property(nonatomic,strong)UIButton *btnImg1;
@property(nonatomic,strong)UIButton *btnImg2;
@property(nonatomic,assign)int selectPic;

@end

@implementation PlaceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItem];
    _selectPic = 0;
    self.navigationItem.title = @"居住地认证";
    self.scrollView = [UIScrollView new];
    self.scrollView.frame = CGRectMake(0, 0, WIDTH, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight);
    self.scrollView.userInteractionEnabled = YES;
    [self.view addSubview:_scrollView];
    //认证
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:13.0]};
    NSString *discribStr = @"您上传的身份证扫描件需和您绑定的身份证一致,否则将无法通过认证.";
    CGSize size=[discribStr boundingRectWithSize:CGSizeMake(WIDTH-40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    CGFloat top = 10;
    CGFloat height =size.height+36;
    [cerTools title:@"居住地认证" font:17 discrib:discribStr withFrame:CGRectMake(20, top, WIDTH-40, height) view:self.scrollView showLine:YES];
    //所在城市
    top = height+top+10;
    self.cityView = [[LTView alloc] initWithFrame:CGRectMake(20 ,top,WIDTH-40,50)];
    self.cityView.titleLab.text = @"所在城市";
    self.cityView.textField.delegate = self;
    [self.scrollView addSubview:self.cityView];
    //居住地址
    top = top+60;
    self.addressView = [[LTView alloc] initWithFrame:CGRectMake(20, top, WIDTH-40, 50)];
    _addressView.titleLab.text = @"居住地址";
    [self.scrollView addSubview:self.addressView];
    //电话
    top = top +60;
    self.phoneView = [[LTView alloc] initWithFrame:CGRectMake(20 ,top,WIDTH-40,50)];
    self.phoneView.titleLab.text = @"电话号码";
    [self.scrollView addSubview:self.phoneView];
    //地址邮编
    top = top+60;
    self.numView = [[LTView alloc] initWithFrame:CGRectMake(20, top, WIDTH-40, 50)];
    _numView.titleLab.text = @"地址邮编";
    [_scrollView addSubview:_numView];
    //线
    top = top+49;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, top, WIDTH, 10)];
    line.backgroundColor = LINECOLOR;
    [_scrollView addSubview:line];
    //图片
    top = top+20;
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(20, top, WIDTH-40, 30)];
    lab.text = @"上传居住地址证";
    [self.scrollView addSubview:lab];
    top = top+50;
    self.btnImg1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnImg1.frame = CGRectMake(20, top, WIDTH-40, 170);
    [self.scrollView addSubview:self.btnImg1];
    self.btnImg1.layer.borderWidth = 0.5;
    self.btnImg1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.btnImg1.backgroundColor = [UIColor colorWithRed:247/255.0 green:246/255.0 blue:241/255.0 alpha:1];
    [self.btnImg1 addTarget:self action:@selector(pic:) forControlEvents:(UIControlEventTouchUpInside)];
    top = top+190;
    self.btnImg2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnImg2.frame = CGRectMake(20, top, WIDTH-40, 170);
    [self.scrollView addSubview:self.btnImg2];
    self.btnImg2.layer.borderWidth = 0.5;
    self.btnImg2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.btnImg2.backgroundColor = [UIColor colorWithRed:247/255.0 green:246/255.0 blue:241/255.0 alpha:1];
    [self.btnImg2 addTarget:self action:@selector(pic2:) forControlEvents:(UIControlEventTouchUpInside)];

    //说明
    top = top+180;
    NSDictionary *dict2 = @{NSFontAttributeName : [UIFont systemFontOfSize:13.0]};
    NSString *discribStr2 = @"您上传的身份证扫描件需和您绑定的身份证一致,否则将无法通过认证.";
    CGSize size2=[discribStr2 boundingRectWithSize:CGSizeMake(WIDTH-40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict2 context:nil].size;
    height =size2.height+36;
    [cerTools title:@"认证说明:" font:15 discrib:discribStr withFrame:CGRectMake(20, top, WIDTH-40, height) view:self.scrollView showLine:NO];
    //提交
    top = top+height+50;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"提交审核" forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(20, top, WIDTH-40, 40);
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = YES;
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    btn.backgroundColor = NAVCOLOR;
    [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.scrollView addSubview:btn];
    
    _scrollView.contentSize = CGSizeMake(WIDTH,top+50+SafeAreaTopHeight);
}
#pragma mark 图片一选择
-(void)pic:(UIButton *)btn{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"照片选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
    actionSheet.tag =111;
    // 显示
    [actionSheet showInView:self.view];
}
#pragma mark 图片二选择
-(void)pic2:(UIButton *)btn{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"照片选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
    actionSheet.tag = 222;
    // 显示
    [actionSheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex ==0){
        [self openCamera];
        if (actionSheet.tag ==111) {
            _selectPic = 0;
        }else{
            _selectPic = 1;
        }
    }else if(buttonIndex == 1){
        if (actionSheet.tag ==111) {
            _selectPic = 0;
        }else{
            _selectPic = 1;
        }
        [self openPhotoLibrary];
    }else{
        NSLog(@"取消");
    }
    
}
#pragma mark 提交审核
-(void)action:(UIButton *)btn{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/**
 
 *  调用照相机
 
 */

- (void)openCamera

{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    
    picker.allowsEditing = YES; //可编辑
    
    //判断是否可以打开照相机
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        
    {
        
        //摄像头
        
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:nil];
        
    }
    
    else
        
    {
        
        NSLog(@"没有摄像头");
        
    }
    
}



/**
 
 *  打开相册
 
 */

-(void)openPhotoLibrary

{
    
    // Supported orientations has no common orientation with the application, and [PUUIAlbumListViewController shouldAutorotate] is returning YES
    
    
    
    // 进入相册
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        
    {
        
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        
        imagePicker.allowsEditing = YES;
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        imagePicker.delegate = self;
        
        [self presentViewController:imagePicker animated:YES completion:^{
            
            NSLog(@"打开相册");
            
        }];
        
    }
    
    else
        
    {
        
        NSLog(@"不能打开相册");
        
    }
    
}



#pragma mark - UIImagePickerControllerDelegate

// 拍照完成回调

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0)

{
    
    NSLog(@"%@",image);
    if(_selectPic == 0){
        [self.btnImg1 setImage:image forState:(UIControlStateNormal)];
    }else{
        [self.btnImg2 setImage:image forState:(UIControlStateNormal)];
    }
    
    
    
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera)
        
    {
        
        //图片存入相册
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        
    }
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//进入拍摄页面点击取消按钮

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker

{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
