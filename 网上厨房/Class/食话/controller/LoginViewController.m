//
//  LogViewController.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/25.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *LoginButton;

@property(nonatomic,strong) NSString *useNameStr;
@property(nonatomic,strong) NSString *passWordStr;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
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
- (IBAction)backButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)textFieldShouldReturn:(id)sender
{
    [sender resignFirstResponder];
}
//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.textName resignFirstResponder];
    //[self.textSummary resignFirstResponder];
    [self.view endEditing:YES];
}

- (IBAction)textFieldDidEndEditing:(id)sender {

    if (sender == self.userName) {
        UITextField *textField = (UITextField *)sender;
        self.useNameStr = textField.text;
    } else{
        UITextField *textField = (UITextField *)sender;
        self.passWordStr = textField.text;
    }
    
    NSLog(@"%@,%@",self.useNameStr,self.passWordStr);
    if (self.useNameStr && self.passWordStr) {
        self.LoginButton.backgroundColor = [UIColor orangeColor];
    }
   
}

@end
