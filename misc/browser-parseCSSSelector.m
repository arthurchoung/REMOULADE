/*

 REMOULADE

 Copyright (c) 2023 Arthur Choung. All rights reserved.

 Email: arthur -at- hotdoglinux.com

 This file is part of REMOULADE.

 REMOULADE is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.

 */

#import "HOTDOG.h"

@implementation Definitions(fmekwlfmklsdmfklsdmf)
+ (void)printCSSSelectors
{
    id data = [Definitions dataFromStandardInput];
    id str = [data asString];
    id arr = [str parseCSS];
    for (int i=0; i<[arr count]; i++) {
        id elt = [arr nth:i];
        id type = [elt valueForKey:@"type"];
        if ([type isEqual:@"property"]) {
            id selectorTextArray = [elt valueForKey:@"selectorTextArray"];
            NSOut(@"%@\n", [selectorTextArray join:@"---"]);
        }
    }
}
@end
@implementation NSString(fmkelwmfklsdmfklsdmklfmskldmfksd)
- (id)parseCSSSelector
{
    id str = self;

    char *cstr = [str UTF8String];

    char *p = cstr;
    char *q = p;
    for(;;) {
        if (!*q) {
            break;
        }
        if (*q == '\n') {
            *q = ' ';
        }
        if (*q == ' ') {
            if (q == p) {
                p = q+1;
            } else {
                NSOut(@"cssselector whitespace '%.*s'\n", q-p, p);
                p = q+1;
            }
        } else if (*q == ',') {
            NSOut(@"cssselector comma '%.*s'\n", q-p, p);
            p = q+1;
        }
        q++;
    }
    return nil;
}
@end

