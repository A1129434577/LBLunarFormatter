//
//  LunarFormatter.h
//  FSCalendar
//
//  Created by 刘彬 Ding on 25/07/2017.
//  Copyright © 2017 刘彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBLunarFormatter : NSObject
@property (strong, nonatomic,readonly) NSCalendar *chineseCalendar;
@property (strong, nonatomic,readonly) NSArray<NSString *> *chineseMonths;
@property (strong, nonatomic,readonly) NSArray<NSString *> *chineseWeekDays;
@property (strong, nonatomic,readonly) NSArray<NSString *> *chineseMonthDays;

@property (strong, nonatomic,readonly) NSArray<NSString *> *chineseGanZiYears;
@property (strong, nonatomic,readonly) NSDictionary<NSString *,NSArray *> *chineseGanZiMonths;//key为干支年
@property (strong, nonatomic,readonly) NSArray<NSString *> *chineseGanZiDays;
@property (strong, nonatomic,readonly) NSDictionary<NSString *,NSString *> *chineseZodiac;

/*
 农历几号，和chineseDayOfDate不同的是初一用农历月份替代
 */
-(NSString *)chineseTheMonthDayOfDate:(NSDate *)date;

/*
 农历几号
 */
-(NSString *)chineseDayOfDate:(NSDate *)date;

/*
 农历几月
 */
-(NSString *)chineseMonthOfDate:(NSDate *)date;

/*
 中文星期几
 */
-(NSString *)chineseWeekDayOfDate:(NSDate *)date;

/*
 干支记年
 */
-(NSString *)chineseGanZiYearOfDate:(NSDate *)date;

/*
 干支记月
 */
-(NSString*)chineseGanZiMonthOfDate:(NSDate *)date;

/*
 干支记日
 */
-(NSString *)chineseGanZiDayOfDate:(NSDate *)date;

/*
 获取属相
 */
-(NSString *)chineseZodiacOfDate:(NSDate *)date;
/*
 获取星座
 */
+(NSString *)astroOfDate:(NSDate *)date;
@end

NS_ASSUME_NONNULL_END
