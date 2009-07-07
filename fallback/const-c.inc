#define PERL_constant_NOTFOUND	1
#define PERL_constant_NOTDEF	2
#define PERL_constant_ISIV	3
#define PERL_constant_ISNO	4
#define PERL_constant_ISNV	5
#define PERL_constant_ISPV	6
#define PERL_constant_ISPVN	7
#define PERL_constant_ISSV	8
#define PERL_constant_ISUNDEF	9
#define PERL_constant_ISUV	10
#define PERL_constant_ISYES	11

#ifndef NVTYPE
typedef double NV; /* 5.6 and later define NVTYPE, and typedef NV to it.  */
#endif
#ifndef aTHX_
#define aTHX_ /* 5.6 or later define this for threading support.  */
#endif
#ifndef pTHX_
#define pTHX_ /* 5.6 or later define this for threading support.  */
#endif

static int
constant (pTHX_ const char *name, STRLEN len, IV *iv_return) {
  /* Initially switch on the length of the name.  */
  /* When generated this function returned values for the list of names given
     in this section of perl code.  Rather than manually editing these functions
     to add or remove constants, which would result in this comment and section
     of code becoming inaccurate, we recommend that you edit this section of
     code, and use it to regenerate a new set of constant functions which you
     then use to replace the originals.

     Regenerate these constant functions by feeding this entire source file to
     perl -x

#!/usr/bin/perl -w
use ExtUtils::Constant qw (constant_types C_constant XS_constant);

my $types = {map {($_, 1)} qw(IV)};
my @names = (qw(COMEDI_FROM_PHYSICAL COMEDI_MAX_NUM_POLYNOMIAL_COEFFICIENTS
	       COMEDI_OOR_NAN COMEDI_OOR_NUMBER COMEDI_TO_PHYSICAL
	       CS_MAX_AREFS_LENGTH));

print constant_types(); # macro defs
foreach (C_constant ("Comedi::Lib", 'constant', 'IV', $types, undef, 3, @names) ) {
    print $_, "\n"; # C constant subs
}
print "#### XS Section:\n";
print XS_constant ("Comedi::Lib", $types);
__END__
   */

  switch (len) {
  case 14:
    if (memEQ(name, "COMEDI_OOR_NAN", 14)) {
#ifdef COMEDI_OOR_NAN
      *iv_return = COMEDI_OOR_NAN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 17:
    if (memEQ(name, "COMEDI_OOR_NUMBER", 17)) {
#ifdef COMEDI_OOR_NUMBER
      *iv_return = COMEDI_OOR_NUMBER;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 18:
    if (memEQ(name, "COMEDI_TO_PHYSICAL", 18)) {
#ifdef COMEDI_TO_PHYSICAL
      *iv_return = COMEDI_TO_PHYSICAL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 19:
    if (memEQ(name, "CS_MAX_AREFS_LENGTH", 19)) {
#ifdef CS_MAX_AREFS_LENGTH
      *iv_return = CS_MAX_AREFS_LENGTH;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 20:
    if (memEQ(name, "COMEDI_FROM_PHYSICAL", 20)) {
#ifdef COMEDI_FROM_PHYSICAL
      *iv_return = COMEDI_FROM_PHYSICAL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 38:
    if (memEQ(name, "COMEDI_MAX_NUM_POLYNOMIAL_COEFFICIENTS", 38)) {
#ifdef COMEDI_MAX_NUM_POLYNOMIAL_COEFFICIENTS
      *iv_return = COMEDI_MAX_NUM_POLYNOMIAL_COEFFICIENTS;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

