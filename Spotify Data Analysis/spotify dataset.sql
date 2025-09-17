create database spotify;
use spotify;

select * from music;
create database spotify;
drop database spotify;
use spotify;
create table music(
Track text,
`Album Name` text,
Artist text,
`Release Date` text,
ISRC text,
`All Time Rank` text,
`Track Score`decimal,
`Spotify Streams` text,    
`Spotify Playlist Count`text,
`Spotify Playlist Reach`text,
`Spotify Popularity`text,
`YouTube Views`text,
`YouTube Likes`text,
`TikTok Posts`text,
`TikTok Likes`text,
`TikTok Views`text,
`YouTube Playlist Reach`text,
`Apple Music Playlist Count`text,
`AirPlay Spins`text,
`SiriusXM Spins`text,    
`Deezer Playlist Count`    text,
`Deezer Playlist Reach` text,
`Amazon Playlist Count`    text,
`Pandora Streams` text,
`Pandora Track Stations`text,
`Soundcloud Streams`text,
`Shazam Counts`text,    
`Explicit Track`smallint
);

select * from music;

-- 1 Songs with more than 500 million Spotify streams
SELECT Track,Artist,
CAST(REPLACE(`Spotify Streams`, ',', '') AS UNSIGNED) AS Streams
FROM music
WHERE CAST(REPLACE(`Spotify Streams`, ',', '') AS UNSIGNED) > 500000000
ORDER BY Streams DESC;


-- 2. Tracks that are not explicit

 select Track,`Explicit Track`
 from music 
 where `Explicit Track`=1;
 
 -- 3. Tracks with Track Score between 400 and 700
select track,`Track Score`
from music
where `Track Score` between 400 and 700;

-- 4. Tracks containing the word “Love” in their name
select Track
from music
where Track like '%Love%';


-- 5. Songs by 'Drake', 'Adele', or 'Beyoncé'

select *
from music
where Artist in ('Drake','Adele','Beyoncé');

-- 6. Find all tracks that have more than 10 million TikTok posts but less than 300 million Spotify streams.
select track,
CAST(REPLACE(`TikTok Posts`, ',', '') AS UNSIGNED) as tiktok_posts,
CAST(REPLACE(`Spotify Streams`, ',', '') AS UNSIGNED) as spotify_streams
from music 
where CAST(REPLACE(`TikTok Posts`, ',', '') AS UNSIGNED) > 10000000 and CAST(REPLACE(`Spotify Streams`, ',', '') AS UNSIGNED) < 300000000;


-- 7. Tracks with available YouTube Likes
select track,`YouTube Likes`
from music
where `YouTube Likes` is not null 
and  `YouTube Likes`<> "";

-- 8. Tracks released in the year 2023

select track,`Release Date`
from music
where `Release Date` like '%2023';

-- 9. Tracks with more than 300M Spotify streams AND explicit

select track,CAST(REPLACE(`Spotify Streams`, ',', '') AS UNSIGNED) as Spotify_streams,`Explicit Track`
from music
where CAST(REPLACE(`Spotify Streams`, ',', '') AS UNSIGNED) > 300000000
and `Explicit Track`=1;

-- 10. Tracks not by 'Taylor Swift' or 'Ed Sheeran', containing the word “night”

select Track , Artist
from music
where Artist not in ('Taylor Swift','Ed Sheeran')
and track like '%night%';
