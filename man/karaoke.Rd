\name{karaoke}
\alias{karaoke}
\title{
Remove vocals from a song    
}
\description{
Attempt to remove vocals from a stereo '.wav' recording of a song.
}
\usage{
karaoke(infile = NULL, outfile = NULL, sampf = NULL)
}
\arguments{
  \item{infile}{
filename of a stereo '.wav' recording of a song
}
  \item{outfile}{
filename for the output '.wav' file
}
  \item{sampf}{
sometimes optional sampling frequency
}
}
\examples{
#We use some '.wav' samples included in the seewave package to construct an example.
data(orni)
data(peewit)
data(tico)
#Extend all the samples to be at least 20 seconds long.
for(loop in 1:5) orni<-pastew(orni,orni,f=22050, output="Wave")
for(loop in 1:5) peewit<-pastew(peewit,peewit,f=22050, output="Wave")
for(loop in 1:5) tico<-pastew(tico,tico,f=22050, output="Wave")
#Cut all samples down to exactly 20 seconds long.
orni<-cutw(orni,f=22050,from=0,to=20, output="Wave")
tico<-cutw(tico,f=22050,from=0,to=20, output="Wave")
peewit<-cutw(peewit,f=22050,from=0,to=20, output="Wave")
#Construct and write the example song to a '.wav' file.  The tweeting bird, "tico", will be the 
#"vocalist", mixed to center.  The "rhythm section" will be "orni" and "peewit", not mixed to 
#center.  (Usually in stereo song recordings, the vocals are most mixed to center, allowing the 
#trick employed by the "karaoke" function to work.)
left<-normalize(tico+orni)
right<-normalize(tico+peewit)
wobj<-stereo(left,right)
slot(wobj,"pcm")<-FALSE
writeWave(wobj, filename="song.wav")
#Make the karaoke version: the vocal from "tico" is removed.
karaoke(infile="song.wav", outfile="song4karaoke.wav")
file.remove("song.wav")
file.remove("song4karaoke.wav")
}
\references{
Well known trick.
}
\author{
John R. Dixon <gbm2sas@gmail.com>
}

\keyword{ karaoke }
