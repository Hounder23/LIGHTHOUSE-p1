--myQuestion 1: Which city country combo has the highest avg time on a website?
select city,
		country,
		avg(a.timeonsite) as avg_time_on_site
from analytics a
join all_sessions als on a.fullvisitorid = als.fullvisitorid
group by city,country
order by avg_time_on_site