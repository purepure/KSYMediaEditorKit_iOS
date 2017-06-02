//
//  AERootView.m
//  demo
//
//  Created by 张俊 on 20/05/2017.
//  Copyright © 2017 ksyun. All rights reserved.
//

#import "AERootView.h"
#import "BgmSelectorView.h"
#import "AESelectorView.h"

@interface AERootView ()

@property(nonatomic, strong)UIButton *bgmBtn;

//变声
@property(nonatomic, strong)UIButton *aeBtn;

//混响
@property(nonatomic, strong)UIButton *reverbBtn;

//贴纸
@property(nonatomic, strong)UIButton *decalBtn;

@property(nonatomic, strong)AESelectorView  *aeView;

@property(nonatomic, strong)AESelectorView  *reverbView;

@property(nonatomic, strong)AESelectorView  *decalView;

@end

@implementation AERootView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        [self addSubview:self.bgmBtn];
        [self addSubview:self.aeBtn];
        [self addSubview:self.reverbBtn];
        [self addSubview:self.decalBtn];
        
        [self addSubview:self.bgmView];
        [self addSubview:self.aeView];
        [self addSubview:self.reverbView];
        [self addSubview:self.decalView];
        self.bgmBtn.selected   = YES;
        self.bgmView.hidden    = NO;
        self.aeView.hidden     = YES;
        self.reverbView.hidden = YES;
        self.decalView.hidden = YES;
        
        [self.bgmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //
            make.left.equalTo(@28);
            make.top.equalTo(@10);
        }];
        [self.aeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //
            make.centerY.mas_equalTo(self.bgmBtn);
            make.left.mas_equalTo(self.bgmBtn.mas_right).offset(20);
        }];
        
        [self.reverbBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //
            make.centerY.mas_equalTo(self.aeBtn);
            make.left.mas_equalTo(self.aeBtn.mas_right).offset(20);
        }];
        
        [self.decalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //
            make.centerY.mas_equalTo(self.reverbBtn);
            make.left.mas_equalTo(self.reverbBtn.mas_right).offset(20);
        }];
        
        [self.bgmView mas_makeConstraints:^(MASConstraintMaker *make) {
            //
            make.left.right.bottom.mas_equalTo(self);
            make.top.mas_equalTo(self.bgmBtn.mas_bottom).offset(6);
        }];
        
        [self.aeView mas_makeConstraints:^(MASConstraintMaker *make) {
            //
            make.left.right.bottom.mas_equalTo(self);
            make.top.mas_equalTo(self.bgmBtn.mas_bottom).offset(6);
        }];
        
        [self.reverbView mas_makeConstraints:^(MASConstraintMaker *make) {
            //
            make.left.right.bottom.mas_equalTo(self);
            make.top.mas_equalTo(self.bgmBtn.mas_bottom).offset(6);
        }];
        
        [self.decalView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self);
            make.top.mas_equalTo(self.bgmBtn.mas_bottom).offset(6);
        }];
    }
    return self;
}

- (UIButton *)bgmBtn
{
    if (!_bgmBtn){
        _bgmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bgmBtn setTitle:@"背景音乐" forState:UIControlStateNormal];
        [_bgmBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_bgmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _bgmBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        [_bgmBtn addTarget:self action:@selector(onSelectBgm:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _bgmBtn;
}

- (UIButton *)aeBtn
{
    if (!_aeBtn){
        _aeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_aeBtn setTitle:@"变声" forState:UIControlStateNormal];
        [_aeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_aeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _aeBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        _aeBtn.titleLabel.textColor = [UIColor whiteColor];
        [_aeBtn addTarget:self action:@selector(onSelectAe:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _aeBtn;
}


- (UIButton *)reverbBtn
{
    if (!_reverbBtn){
        _reverbBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reverbBtn setTitle:@"混响" forState:UIControlStateNormal];
        [_reverbBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_reverbBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _reverbBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        _reverbBtn.titleLabel.textColor = [UIColor whiteColor];
        [_reverbBtn addTarget:self action:@selector(onSelectReverb:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reverbBtn;
}

- (UIButton *)decalBtn{
    if (!_decalBtn){
        _decalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_decalBtn setTitle:@"贴纸" forState:UIControlStateNormal];
        [_decalBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_decalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _decalBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        _decalBtn.titleLabel.textColor = [UIColor whiteColor];
        [_decalBtn addTarget:self action:@selector(onSelectDecel:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _decalBtn;
}

- (BgmSelectorView *)bgmView
{
    if (!_bgmView){
        _bgmView = [[BgmSelectorView alloc] init];
    }
    return _bgmView;
}


- (AESelectorView *)aeView
{
    if (!_aeView){
        _aeView = [[AESelectorView alloc] initWithType:1];
    }
    return _aeView;
}

- (AESelectorView *)reverbView
{
    if (!_reverbView){
        _reverbView = [[AESelectorView alloc] initWithType:0];
    }
    return _reverbView;
}

- (AESelectorView *)decalView
{
    if (!_decalView){
        _decalView = [[AESelectorView alloc] initWithType:2];
    }
    return _decalView;
}

- (void)onSelectBgm:(id)sender
{
    self.aeBtn.selected  = NO;
    self.bgmBtn.selected = YES;
    self.reverbBtn.selected = NO;
    self.decalBtn.selected = NO;
    //switch to bgm view
    self.bgmView.hidden = NO;
    self.aeView.hidden = YES;
    self.reverbView.hidden = YES;
    self.decalView.hidden = YES;
}

- (void)onSelectAe:(id)sender
{
    self.aeBtn.selected  = YES;
    self.bgmBtn.selected = NO;
    self.reverbBtn.selected = NO;
    self.decalBtn.selected = NO;
    //switch to ae view
    
    self.bgmView.hidden = YES;
    self.aeView.hidden  = NO;
    self.reverbView.hidden = YES;
    self.decalView.hidden = YES;
}

- (void)onSelectReverb:(id)sender
{
    self.reverbBtn.selected = YES;
    self.aeBtn.selected  = NO;
    self.bgmBtn.selected = NO;
    self.decalBtn.selected = NO;
    //switch to ae view
    
    self.bgmView.hidden = YES;
    self.aeView.hidden  = YES;
    self.reverbView.hidden = NO;
    self.decalView.hidden = YES;
}

- (void)onSelectDecel:(id)sender{
    self.reverbBtn.selected = NO;
    self.aeBtn.selected  = NO;
    self.bgmBtn.selected = NO;
    self.decalBtn.selected = YES;
    //switch to ae view
    
    self.bgmView.hidden = YES;
    self.aeView.hidden  = YES;
    self.reverbView.hidden = YES;
    self.decalView.hidden = NO;
}

- (void)setBgmBlock:(void (^)(AEModelTemplate *))BgmBlock
{
    self.bgmView.bgmView.BgmBlock = BgmBlock;
}

- (void)setBgmVolumeBlock:(void (^)(float, float))BgmVolumeBlock
{
    self.bgmView.BgmVolumeBlock = BgmVolumeBlock;
}

- (void)setAEBlock:(void (^)(AEModelTemplate *))AEBlock
{
    self.aeView.aeView.BgmBlock     = AEBlock;
    self.reverbView.aeView.BgmBlock = AEBlock;
}

- (void)setDEBlock:(void (^)(AEModelTemplate *))DEBlock{
    self.decalView.aeView.BgmBlock  = DEBlock;
}
@end
