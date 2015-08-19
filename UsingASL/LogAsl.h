//
//  LogAsl.h
//  UsingASL
//
//  Created by Bruno da Luz on 8/19/15.
//  Copyright (c) 2015 bruno v0id. All rights reserved.
//

#ifndef LogAsl_h
#define LogAsl_h

#import <asl.h>
#import <Foundation/Foundation.h>


// Define which loglevel is necessary for deployment and development
// =================================================================
// Used to conditionally implement the log functions. All log
// functions are defined so the compiler does not complain. But only
// those logfunctions that are used will contain code.
// =================================================================
#ifndef LogAsl_LOG_LEVEL
// DEBUG is set in the project build-settings
#if DEBUG == 1
// Set logging level for development
#define LogAsl_LOG_LEVEL ASL_LEVEL_DEBUG
#else
// Set logging level for deployment
#define LogAsl_LOG_LEVEL ASL_LEVEL_NOTICE
#endif
#endif


// Define the log functions
// ========================
void aslEmergency(NSString *string);
void aslAlert(NSString *string);
void aslCritical(NSString *string);
void aslError(NSString *string);
void aslWarning(NSString *string);
void aslNotice(NSString *string);
void aslInfo(NSString *string);
void aslDebug(NSString *string);


#endif