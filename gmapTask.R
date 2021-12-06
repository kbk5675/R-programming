library(ggmap)
library(stringr)
register_google(key="AIzaSyAYXeegAQsehWpb34wXi3_BqdU5Ozkw3eU")
#우리나라 전국의 지도에 서울특별시와 서울공역시 표시. roadmap,zoom=8 marker(text)
names <- c("서울특별시", "부산광역시","대전광역시","인천광역시","광주광역시","울산광역시","대구광역시")
gc <- geocode(enc2utf8(names))
gc
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
df
cen <- c(mean(df$lon), mean(df$lat))
cen
map <- get_googlemap(center=cen, maptype = "roadmap", zoom = 8, markers = gc)
gmap <- ggmap(map)
gmap + geom_text(data = df,     
                 size=6.5,               #글씨 크기   
                 aes(x = lon, y = lat),#글씨 위치  
                 label=df$name         #글씨 내용
                 )
#제쥬우도 관공명소 6개의 지점을 지도에 표시(지명 표시)
names <- c("성산일출봉", "한라산", "금오름", "천지연폭포", "용두암", "중문관광단지지")
names
gc <- geocode(enc2utf8(names))
gc
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
df
cen <- c(mean(df$lon), mean(df$lat))
cen
map <- get_googlemap(center = cen, maptype = 'roadmap', zoom=10, markers = gc)
ggmap(map)

#seoul_birth_202007.csv 파일 데이터프레임 생성
data <- read.csv("seoul_birth_202007.csv")
data
birth <- data.frame(section= data$행정구역, polu=data$출생인구수)
#10행까지 출력, 요약 통계량
birth[c(1:10),]
summary(birth)
#서울시의 구의 위치 표시 마커 표시(구이름 생략)
names <- birth[,1]
gc <- geocode(enc2utf8(names))
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, maptype = "terrain", zoom=11, markers = gc)
ggmap(map)
#마커를 파란점으로 표시(구이름생략)
map <- get_googlemap(center = cen, maptype = "terrain", zoom=11)
gmap <- ggmap(map)
gmap + geom_point(data = df,
                  aes(x=lon, y=lat),
                  size = birth$polu/13,
                  color='blue',
                  alpha= 0.3
                  )
#출생인구 상위TOP10 추출해 출생인구수 비례해서 크기와 색상 다르게 지도 출력.
data <- sort(birth[,2], decreasing = T)
data <- data[1:10]
topnames <- c("송파구", "강서구", "구로구", "서초구", "강동구", "강남구", "동작구", "노원구", "영등포구", "은평구")
gc <- geocode(enc2utf8(topnames))
topdf <- data.frame(name= topnames, lon = gc$lon, lat = gc$lat, topPopul=data)
cen <- c(mean(topdf$lon), mean(topdf$lat))
map <- get_googlemap(center = cen, maptype = "terrain", zoom=11)
gmap <- ggmap(map)
gmap + geom_point(data = topdf,
                  size = topdf$topPopul/10,
                  aes(x=lon, y=lat),
                  color= rainbow(10),
                  alpha=0.5
                  ) +
  geom_text(data=topdf,
            aes(x=lon,y=lat),
            label=topdf$name)

#4번 2019년9월부터 2020년3월까지의 도시별월별미세먼지변화량.csv 활용해서 데이터분석맵 만들기
data4 <- read.csv("finedust_PM10__1910_2003.csv", header = TRUE)
data4
fine_dust <- data.frame(data4) #csv이용해 데이터프레임 생성.
tail(fine_dust)
head(fine_dust) # 처음 5행 출력
summary(fine_dust) #요약 통계량
#dust_2020의 열이름 변경 및 months 정수형으로 변경
dust_2020 <- data.frame(province=data4[,1], city=data4[,2], month1=as.numeric(data4[,6]),
                        month2=as.numeric(data4[,7]), month3=as.numeric(data4[,8]))
dust_2020
#months 결측치 확인하고 NA값 0으로 변환
is.na(dust_2020$month1)
is.na(dust_2020$month2)
is.na(dust_2020$month3)
dust_2020$month1[is.na(dust_2020$month1)] <- 0
dust_2020$month2[is.na(dust_2020$month2)] <- 0
dust_2020$month3[is.na(dust_2020$month3)] <- 0

# "sum" 합변수와 "avg" 평균변수 추가하기
for (i in 1:171) {
  sum[i] <- c(sum(dust_2020[i,3:5]))
}
dust_2020[,"sum"] <- c(sum)

for (i in 1:171) {
  avg[i] <- c(sum(dust_2020[i,3:5])/3)
}
dust_2020[,"avg"] <- c(avg)

#province로 그룹화하여 미세먼지의 평균을 구하여 mean에 저장한 데이터 프레임 dust_province를 만드시오.

names <- c("서울", "부산", "대구", "인천", "대전", "울산", "세종", "경기", "강원", "충북", "충남", "전북", "경북", "경남", "제주")

for (i in 1:15) {
  dust_province[i,] <- data.frame(province = names[i],
                              month1mean =  mean(dust_2020[grep(names[i],dust_2020$province),3]),
                              month2mean =(dust_2020[grep(names[i],dust_2020$province),4]),
                              month3mean =mean(dust_2020[grep(names[i],dust_2020$province),5]))
}

#dust_province 맵출력
gc <- geocode(enc2utf8(names))
df <- data.frame(name= names, lon = gc$lon, lat = gc$lat, data=dust_province$month1mean)
df[7,2] <- 127.1600
df[7,3] <- 36.3000
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, maptype = "terrain", zoom=7)
gmap <- ggmap(map)
gmap + geom_point(data = df,
                  size = df$data/5,
                  aes(x=lon, y=lat),
                  color= rainbow(15),
                  alpha=0.5
) +
  geom_text(data=df,
            aes(x=lon,y=lat),
            label=df$name)





