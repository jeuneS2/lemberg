// RUN: %clang_cc1 %s -fobjc-fragile-abi -fsyntax-only -verify 

@interface X 
{
  int a : -1; // expected-error{{bit-field 'a' has negative width}}

  // rdar://6081627
  int b : 33; // expected-error{{size of bit-field 'b' (33 bits) exceeds size of its type (32 bits)}}

  int c : (1 + 0.25); // expected-error{{expression is not an integer constant expression}}
  int d : (int)(1 + 0.25); 

  // rdar://6138816
  int e : 0;  // expected-error {{bit-field 'e' has zero width}}
}
@end

@interface Base {
  int i;
}
@end

@interface WithBitFields: Base {
  void *isa; // expected-note {{previous definition is here}}
  unsigned a: 5;
  signed b: 4;
  int c: 5; // expected-note {{previous definition is here}}
}
@end

@implementation WithBitFields {
  char *isa;  // expected-error {{instance variable 'isa' has conflicting type: 'char *' vs 'void *'}}
  unsigned a: 5;  
  signed b: 4; 
  int c: 3;  // expected-error {{instance variable 'c' has conflicting bit-field width}}
}
@end
