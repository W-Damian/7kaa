my @defines;

## compiler flags ##
@defines = qw( AMPLUS USE_OPENAL );
if (defined($debug) && $debug) {
  push (@defines, "DEBUG");
}
## end compiler flags ##

## include paths ##
my @includes = qw( ../../../include );

if (defined($wine_prefix)) {
  push (@includes, "$wine_prefix/include/wine/windows",
                   "$wine_prefix/include/wine/msvcrt");
}
## end include paths ##

my @targets = qw(
wav_stream.cpp
);

if (defined($audio_backend) && $audio_backend eq "OpenAL") {
  push (@targets, "openal_audio.cpp");
}

build_targets(\@targets, \@includes, \@defines);
