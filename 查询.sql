#建立索引
use demo;
create index index_tag on tag(tag);
create index index_tagId on tag(tagId);
create index index_movieId on movie(movieId);
create index index_rating on rating(rating);
#1.一共有多少不同的用户
select count(distinct userId) as different_user from rating;
#2.一共有多少不同电影
select count(distinct movieId) as different_movie from movie;
#3.一共有多少不同种类的电影
select count(distinct genres) as diff_type from movie;
#4.一共有多少电影没有外部链接
select (count(*)-l2.has_link) as no_link 
from link as l1 left join  
(select count(distinct tmdbId) as has_link,movieId 
from link
) as l2 
on l2.movieId=l1.movieId;
#5.2018年一共有多少人进行过电影评分
select count(distinct userId) from rating 
where date_format(timestamp,'%Y')=2018;
#6.2018年评分5分以上的电影及其对应标签
select r.movieId,avg(r.rating) as avg_rating,m.genres 
from rating as r left join
(select genres,movieId 
from movie
)as m 
on m.movieId=r.movieId and date_format(r.timestamp,'%Y')=2018 
group by r.movieId,m.genres 
having avg(r.rating) >= 5 
order by avg_rating desc;
