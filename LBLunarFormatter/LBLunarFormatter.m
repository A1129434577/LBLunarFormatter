//
//  LunarFormatter.m
//  FSCalendar
//
//  Created by 刘彬 Ding on 25/07/2017.
//  Copyright © 2017 刘彬. All rights reserved.
//

#import "LBLunarFormatter.h"

@interface LBLunarFormatter ()
@property (strong, nonatomic) NSDateFormatter *chineseMothFormatter;
@end

@implementation LBLunarFormatter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _chineseCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
        self.chineseMothFormatter = [[NSDateFormatter alloc] init];
        self.chineseMothFormatter.calendar = self.chineseCalendar;
        self.chineseMothFormatter.dateFormat = @"M";
        
        _chineseMonths = @[@"正月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"冬月",@"腊月"];
        _chineseWeekDays = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
        _chineseMonthDays = @[@"初一",@"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",@"二一",@"二二",@"二三",@"二四",@"二五",@"二六",@"二七",@"二八",@"二九",@"三十"];
        
        
        _chineseGanZiYears = @[@"甲子",@"乙丑",@"丙寅",@"丁卯",@"戊辰",@"己巳",@"庚午",@"辛未",@"壬申",@"癸酉",@"甲戌",@"乙亥",@"丙子",@"丁丑",@"戊寅",@"己卯",@"庚辰",@"辛己",@"壬午",@"癸未",@"甲申",@"乙酉",@"丙戌",@"丁亥",@"戊子",@"己丑",@"庚寅",@"辛卯",@"壬辰",@"癸巳",@"甲午",@"乙未",@"丙申",@"丁酉",@"戊戌",@"己亥",@"庚子",@"辛丑",@"壬寅",@"癸丑",@"甲辰",@"乙巳",@"丙午",@"丁未",@"戊申",@"己酉",@"庚戌",@"辛亥",@"壬子",@"癸丑",@"甲寅",@"乙卯",@"丙辰",@"丁巳",@"戊午",@"己未",@"庚申",@"辛酉",@"壬戌",@"癸亥"];
        
       _chineseZodiac =  @{@"子":@"鼠",@"丑":@"牛",@"寅":@"虎",@"卯":@"兔",@"辰":@"龙",@"巳":@"蛇",@"午":@"马",@"未":@"羊",@"申":@"猴",@"酉":@"鸡",@"戌":@"狗",@"亥":@"猪"};
        
        
       _chineseGanZiDays = self.chineseGanZiYears.mutableCopy;
        
        _chineseGanZiMonths
        = @{@"甲":
                @[@"丙寅",@"丁卯",@"戊辰",@"己巳",@"庚午",@"辛未",@"壬申",@"癸酉",@"甲戌",@"乙亥",@"丙子",@"丁丑"],
            @"己":
                @[@"丙寅",@"丁卯",@"戊辰",@"己巳",@"庚午",@"辛未",@"壬申",@"癸酉",@"甲戌",@"乙亥",@"丙子",@"丁丑"],
            @"乙":
                @[@"戊寅",@"己卯",@"庚辰",@"辛巳",@"壬午",@"癸未",@"甲申",@"乙酉",@"丙戌",@"丁亥",@"戊子",@"己丑"],
            @"庚":
                @[@"戊寅",@"己卯",@"庚辰",@"辛巳",@"壬午",@"癸未",@"甲申",@"乙酉",@"丙戌",@"丁亥",@"戊子",@"己丑"],
            @"丙":
                @[@"庚寅",@"辛卯",@"壬辰",@"癸巳",@"甲午",@"乙未",@"丙申",@"丁酉",@"戊戌",@"己亥",@"庚子",@"辛丑"],
            @"辛":
                @[@"庚寅",@"辛卯",@"壬辰",@"癸巳",@"甲午",@"乙未",@"丙申",@"丁酉",@"戊戌",@"己亥",@"庚子",@"辛丑"],
            @"丁":
                  @[@"壬寅",@"癸卯",@"甲辰",@"乙巳",@"丙午",@"丁未",@"戊申",@"己酉",@"庚戌",@"辛亥",@"壬子",@"癸丑"],
            @"壬":
                @[@"壬寅",@"癸卯",@"甲辰",@"乙巳",@"丙午",@"丁未",@"戊申",@"己酉",@"庚戌",@"辛亥",@"壬子",@"癸丑"],
            @"戊":
                  @[@"甲寅",@"乙卯",@"丙辰",@"丁巳",@"戊午",@"己未",@"庚申",@"辛酉",@"壬戌",@"癸亥",@"甲子",@"乙丑"],
            @"癸":
                @[@"甲寅",@"乙卯",@"丙辰",@"丁巳",@"戊午",@"己未",@"庚申",@"辛酉",@"壬戌",@"癸亥",@"甲子",@"乙丑"],
  
            };
    

    }
    return self;
}

- (NSString *)chineseTheMonthDayOfDate:(NSDate *)date
{
    NSMutableArray *daysHaveNotFirstDay = self.chineseMonthDays.mutableCopy;
    [daysHaveNotFirstDay removeObjectAtIndex:0];
    
    NSInteger day = [self.chineseCalendar component:NSCalendarUnitDay fromDate:date];
    if (day != 1) {
        return daysHaveNotFirstDay[day-2];
    }
    // First day of month
    NSString *monthString = [self.chineseMothFormatter stringFromDate:date];
    if ([self.chineseCalendar.veryShortMonthSymbols containsObject:monthString]) {
        return self.chineseMonths[monthString.integerValue-1];
    }
    // Leap month
    NSInteger month = [self.chineseCalendar component:NSCalendarUnitMonth fromDate:date];
    monthString = [NSString stringWithFormat:@"闰%@", self.chineseMonths[month-1]];
    return monthString;
}
-(NSString *)chineseDayOfDate:(NSDate *)date{
    NSDateComponents *dayComponents = [self.chineseCalendar components:NSCalendarUnitDay fromDate:date];
    NSInteger day = [dayComponents day];
    return self.chineseMonthDays[day-1];
}

-(NSString *)chineseMonthOfDate:(NSDate *)date{
    NSDateComponents *monthComponents = [self.chineseCalendar components:NSCalendarUnitMonth fromDate:date];
    NSInteger month = [monthComponents month];
    return self.chineseMonths[month-1];
}

-(NSString *)chineseWeekDayOfDate:(NSDate *)date{
    NSDateComponents *weekdayComponents = [self.chineseCalendar components:NSCalendarUnitWeekday fromDate:date];
    NSInteger week = [weekdayComponents weekday];
    return self.chineseWeekDays[week-1];
}

-(NSString*)chineseGanZiYearOfDate:(NSDate *)date{
    NSDateComponents *yearComponents = [self.chineseCalendar components:NSCalendarUnitYear fromDate:date];
    NSInteger year = [yearComponents year];
    return self.chineseGanZiYears[year-1];
}

-(NSString*)chineseGanZiMonthOfDate:(NSDate *)date{
    NSString *ganZiYear = [self chineseGanZiYearOfDate:date];
    NSInteger month = [self.chineseCalendar component:NSCalendarUnitMonth fromDate:date];
    return self.chineseGanZiMonths[[ganZiYear substringToIndex:1]][month-1];
}

-(NSString *)chineseGanZiDayOfDate:(NSDate *)date{
    //公立20190726为甲子日，所以这里借助它为参照点轮回计算
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = self.chineseCalendar.timeZone;
    dateFormatter.dateFormat = @"yyyyMMdd";
    date = [dateFormatter dateFromString:[dateFormatter stringFromDate:date]];//去掉时分
    NSDateComponents *dayComponents = [self.chineseCalendar components:NSCalendarUnitDay fromDate:date toDate:[dateFormatter dateFromString:@"20190726"] options:0];
    return self.chineseGanZiDays[(60-([dayComponents day]%60))%60];
}

-(NSString *)chineseZodiacOfDate:(NSDate *)date{
    NSString *ganZiYear = [self chineseGanZiYearOfDate:date];
    return self.chineseZodiac[[ganZiYear substringFromIndex:1]];
}

+(NSString *)astroOfDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"M";
    NSUInteger m = [dateFormatter stringFromDate:date].integerValue;
    dateFormatter.dateFormat = @"d";
    NSUInteger d = [dateFormatter stringFromDate:date].integerValue;
    
    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    if (m<1||m>12||d<1||d>31){
        
        return @"日期格式有误";
    }
    if(m==2 && d>29){
        return @"错误日期格式!!";
    }
    else if(m==4 || m==6 || m==9 || m==11) {
        
        if (d>30) {
            return @"错误日期格式!!!";
        }
    }
    
    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(m*2-(d < [[astroFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19))*2,2)]];
    
    return result;
    
}
@end
