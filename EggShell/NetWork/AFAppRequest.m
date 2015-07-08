//
//  AFAppRequest.m
//  EggShell
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "AFAppRequest.h"
#import "MJRefresh.h"
#import "Gson.h"

@interface AFRequestState()
@property NSMutableArray * NotfifyArray;

-(void)changeState:(id)notify;
-(void)setEnd;
-(void)start;
@end

@implementation AFRequestState

-(id)init
{
    self = [super init];
    _NotfifyArray = [NSMutableArray new];
    return self;
}

-(AFRequestState *)addNotifaction:(id)notify
{
    //    NSValue * v = [NSValue valueWithNonretainedObject:notify];
    [_NotfifyArray addObject:notify];
    
    [self changeState:notify ];
    
    return self;
}

-(void)changeState:(id)notify
{
    if( [notify isKindOfClass:[MJRefreshBaseView class]]){
        if( _running ){
            
        }
        else{
            [(MJRefreshBaseView *)notify endRefreshing];
        }
    }
    if( [notify isKindOfClass:[MBProgressHUD class]]){
        if( _running ){
            [(MBProgressHUD *)notify show:YES];
        }
        else{
            [(MBProgressHUD *)notify removeFromSuperview];
        }
        
    }}


-(void)setEnd;
{
    _running = NO;
    
    for( id notify in _NotfifyArray ){
        [self changeState:notify];
    }
    
    [_NotfifyArray removeAllObjects];
}

-(void)start
{
    _running = YES;
    
    for( id notify in _NotfifyArray ){
        [self changeState:[(NSValue *)notify nonretainedObjectValue]];
    }
}



@end


@implementation AFAppRequest

+(AFHTTPRequestOperationManager *)sharedManager
{
    static AFHTTPRequestOperationManager* _om = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _om =[[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:@""]];
    });
    
    return _om;
}

+(AFRequestState *)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param succ:(void (^)(id))succ
{
    return [self postRequestWithUrl:url param:param succ:succ resp:nil];
}

+(AFRequestState *)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param succ:(void (^)(id))succ fail:(void (^)(int errCode, NSError * err))fail
{
    return [self postRequestWithUrl:url param:param succ:succ fail:fail resp:nil];
}
//上传数据统一错误处理
+(AFRequestState *)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param succ:(void (^)(id))succ resp:(Class)resp
{
    return [self postRequestWithUrl:url param:param succ:succ fail:^(int errCode, NSError *err) {
        
        [self error_hanlde:errCode Witherr:err];
        
    } resp:resp];
}

+(AFRequestState *)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param succ:(void (^)(id))succ fail:(void (^)(int errCode, NSError * err))fail resp:(Class)resp;
{
    
//    NSMutableDictionary*sign=[AFAppRequest getURLSign:url];
//    
//    [sign addEntriesFromDictionary:param];
//    
//    AFRequestState * State = [AFRequestState new];
//    
//    [[self sharedClient] POST:url parameters:sign success:^(AFHTTPRequestOperation * operation, id responseObject)
//     {
//         [self handleResponse:responseObject Succ:succ Fail:fail Resp:resp State:State];
//         
//         
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
//     {
//         fail(0,error);
//         [State setEnd];
//     }];
//    
//    [State start];
//    return State;
    AFRequestState * State = [AFRequestState new];
    return State;
    
}

//统一错误处理
+(void)error_hanlde:(int)errCode Witherr:(NSError *)err {
    
    
    if(errCode == 0)
    {
        [MBProgressHUD creatembHub:@"网络超时，请检查网络连接是否正常"];
    }
    
    
}

//对象转换＋异常捕获（防崩溃）
+(void)handleResponse:(id)responseObject Succ:(void (^)(id data))succ Fail:(void (^)(int errCode, NSError * err))fail Resp:(Class)resp State:(AFRequestState *)State;
{
    
    @try
    {
        if([responseObject isKindOfClass:[NSData class]])
        {
            responseObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        }
        
        if( responseObject == nil )
        {
            fail(10002, nil);
            return;
        }
        
        int error_code = [[responseObject objectForKey:@"error_code"] intValue];
        
        if( error_code != 0)
        {
            fail(error_code, nil);
            return;
        }
        
        id data = [Gson fromObj:[responseObject objectForKey:@"data"] Cls:resp];
        
        if(data == nil && resp == [NSNull class])
        {
            succ(nil);
            return;
        }
        
        if( data == nil && resp != [NSNull class] )
        {
            fail(10001, nil);
            return;
        }
        if(succ == nil)
        {
            return;
        }
        succ(data);
    }
    @catch(GsonException * excep){
        fail(10000, nil);
    }
    @catch(NSException * excep){
        fail(50000, nil);
    }
    @finally{
        [State setEnd];
    }
}



@end
