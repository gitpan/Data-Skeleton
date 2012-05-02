
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Show just the keys of deep data structure",
  "AUTHOR" => "Mateu X. Hunter",
  "BUILD_REQUIRES" => {
    "CGI" => 0,
    "English" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "IO::Handle" => 0,
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Data-Skeleton",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Data::Skeleton",
  "PREREQ_PM" => {
    "Data::Dumper::Concise" => 0,
    "Moo" => 0,
    "MooX::Types::MooseLike::Base" => 0,
    "Scalar::Util" => 0,
    "strictures" => 1
  },
  "VERSION" => "0.02",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



