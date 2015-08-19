//
//  LogAsl.m
//  UsingASL
//
//  Created by Bruno da Luz on 8/19/15.
//  Copyright (c) 2015 bruno v0id. All rights reserved.
//

#import "LogAsl.h"

// We need this to set asl up to also write the information to the debugger
// ========================================================================
static void AddStderrOnce() {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        asl_add_log_file(NULL, STDERR_FILENO);
    });
}

// Implement the log functions where necessary
// ===========================================
#if LogAsl_LOG_LEVEL >= ASL_LEVEL_EMERG
void aslEmergency(NSString *string) {
    AddStderrOnce();
    asl_log(NULL, NULL, ASL_LEVEL_EMERG, "%s", [string UTF8String]);
}
#else
void aslEmergency(NSString *string) {}
#endif

#if LogAsl_LOG_LEVEL >= ASL_LEVEL_ALERT
void aslAlert(NSString *string) {
    AddStderrOnce();
    asl_log(NULL, NULL, ASL_LEVEL_ALERT, "%s", [string UTF8String]);
}
#else
void aslAlert(NSString *string) {}
#endif

#if LogAsl_LOG_LEVEL >= ASL_LEVEL_CRIT
void aslCritical(NSString *string) {
    AddStderrOnce();
    asl_log(NULL, NULL, ASL_LEVEL_CRIT, "%s", [string UTF8String]);
}
#else
void aslCritical(NSString *string) {}
#endif

#if LogAsl_LOG_LEVEL >= ASL_LEVEL_ERR
void aslError(NSString *string) {
    AddStderrOnce();
    asl_log(NULL, NULL, ASL_LEVEL_ERR, "%s", [string UTF8String]);
}
#else
void aslError(NSString *string) {}
#endif

#if LogAsl_LOG_LEVEL >= ASL_LEVEL_WARNING
void aslWarning(NSString *string) {
    AddStderrOnce();
    asl_log(NULL, NULL, ASL_LEVEL_WARNING, "%s", [string UTF8String]);
}
#else
void aslWarning(NSString *string) {}
#endif

#if LogAsl_LOG_LEVEL >= ASL_LEVEL_NOTICE
void aslNotice(NSString *string) {
    AddStderrOnce();
    asl_log(NULL, NULL, ASL_LEVEL_NOTICE, "%s", [string UTF8String]);
}
#else
void aslNotice(NSString *string) {}
#endif

#if LogAsl_LOG_LEVEL >= ASL_LEVEL_INFO
void aslInfo(NSString *string) {
    AddStderrOnce();
    asl_log(NULL, NULL, ASL_LEVEL_INFO, "%s", [string UTF8String]);
}
#else
void aslInfo(NSString *string) {}
#endif

#if LogAsl_LOG_LEVEL >= ASL_LEVEL_DEBUG
void aslDebug(NSString *string) {
    AddStderrOnce();
    asl_log(NULL, NULL, ASL_LEVEL_DEBUG, "%s", [string UTF8String]);
}
#else
void aslDebug(NSString *string) {}
#endif
