install.packages("ggmap")
library(ggmap)

register_google(key="AIzaSyAYXeegAQsehWpb34wXi3_BqdU5Ozkw3eU")

#get_map() 함수 이용
map <- get_map(location="서울")
ggmap(map)

#get_googlemap() 함수 이용
map1 <- get_googlemap(center = "서울울")
ggmap(map1)

#qmap() 함수 이용
qmap("서울")

#서울의 위도와 경도를 이용하여 지도 출력하기
gc <- geocode(enc2utf8("서울"))
gc

cen <- as.numeric(gc)
cen

map <- get_googlemap(center=cen)
ggmap(map)
map <- get_googlemap(center=cen)
ggmap(map)

#geocode() 함수의 파라메터에 따른 출력결과
## 지역명으로 위도와 경도 좌표 얻기
geocode(location = '서울시청',
        output = 'latlon',
        source = 'google')
## 지역명으로 위도와 경도 좌표 및 주소 얻기
geocode(location = '서울시청',
        output = 'latlona',
        source = 'google')
## 한글 주소를 얻는 방법 &language=ko
geocode(location = enc2utf8(x = '서울시청&language=ko'),
        output = 'latlona',
        source = 'google')

##get_googlemap() 함수의 네가지 지도 유형
gc <- geocode(enc2utf8("강남구"))
gc
cen <- as.numeric(gc)
cen
map <- get_googlemap(center=cen, maptype = "terrain")
ggmap(map)
map <- get_googlemap(center=cen, maptype = "satellite")
ggmap(map)
map <- get_googlemap(center=cen, maptype = "roadmap")
ggmap(map)
map <- get_googlemap(center=cen, maptype = "hybrid")
ggmap(map)

#지도 크기설정 및 확대와 축소
gc <- geocode(enc2utf8("위례동"))
cen <- as.numeric(gc)
##size 320,320 설정, zoom=8
map <- get_googlemap(center = cen, maptype = "roadmap", size=c(320,320), zoom = 8)
ggmap(map)
##size 320,320 설정, zoom=16
map <- get_googlemap(center = cen, maptype = "hybrid", size=c(320,320), zoom = 13)
ggmap(map)

#지도의 컬러 변경
map <- get_googlemap(center = cen, maptype = "roadmap", color = 'bw')
ggmap(map)

#extent 파라메터 설정에 의한 지도출력
ggmap(map, extent = 'panel') #기본출력형식
ggmap(map, extent = 'nomal') #지도 둘라싼 외곽 영역 설정
ggmap(map, extent = 'device') #지도가 창의 모든 영역 채움

#지도에 마커 출력
map <- get_googlemap(center = cen, maptype = "roadmap", markers = gc, zoom = 17)
ggmap(map)

#여러개의 마커 출력
names <- c("북한산국립공원", "설악산국립공원", "오대산국립공원", "치악산국립공원","태백산국립공원")
gc <- geocode(enc2utf8(names))
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, maptype = 'roadmap', zoom = 8, markers = gc)
ggmap(map)

#마커에 명칭 출력
gmap <- ggmap(map)
gmap + geom_text(data=df, aes(x = lon, y = lat), size=3, label= df$name)


