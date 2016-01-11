//
//  GestorBD.h
//  Glass
//
//  Created by Jorge Martinez Carvajal on 3/1/16.
//  Copyright (c) 2016 grupo 04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GestorBD : NSObject

@property (nonatomic, strong) NSMutableArray *arrNombresCols;
@property (nonatomic) int filasAfectadas;
@property (nonatomic) long long ultimoID;

- (NSArray*) selectFromDB:(NSString*) consulta;
- (void) executeQuery: (NSString*) consulta;

- (instancetype) initWithDatabaseFilename: (NSString *) dbFileName;

@end
