//
//  PhoneVC.m
//  Yulindai
//
//  Created by zcg on 2018/4/16.
//  Copyright © 2018年 zcg. All rights reserved.
//

#import "PhoneVC.h"

@interface PhoneVC ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property(nonatomic,strong)LTView *nameView;
@property(nonatomic,strong)LTView *numView;
@property(nonatomic,strong)UIButton *btnImg1;
@property(nonatomic,strong)UIButton *btnImg2;
@property(nonatomic,assign)int selectPic;
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation PhoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItem];
    _selectPic = 0;
    self.navigationItem.title = @"手机认证";
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
    [cerTools title:@"手机认证" font:17 discrib:discribStr withFrame:CGRectMake(20, top, WIDTH-40, height) view:self.scrollView showLine:YES];
    top = height+top+20;
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(20, top, WIDTH-40, 30)];
    lab.text = @"上传手机实名证明";
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
