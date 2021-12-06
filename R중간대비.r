a <- scan()       #숫자입력받기
b = scan(파일명,what="") #문자입력받기
data <- read.table("grade.csv", sep = ',')

var <- read.csv("grade.csv") #csv파일 읽기

write.table(data1, file="table1.txt", quote = FALSE) # 텍스트 파일 저장 
write.csv(data1, file="csv1.csv", row.names = FALSE) # 행 넘버 안생기게

install.packages("readxl")
library(readxl)

var <- read_excel("grade.xlsx", col_names = F) #col_names = F 하면 행이름도 데이터로 포함!
var
#구분자
str <- c("I love R") 
strsplit(str, split=" ") 

#sub(), gsub()
str <- "R is very good!! I love R"
sub("R", "PYthon", str) #하나만 바꾼다.
gsub("R", "Python", str) # 모든 R을 바꾼다.

#문자열의 패턴을 찾아 주는 함수
grep("R", str) #0 과 1 bol형식
grepl("R",str) #T or F bol형식
regexpr("R", str) #처음 나오는 문자위치 찾기
gregexpr("R", str) #찾으려는 문자 모든 위치 찾기

#데이터의 기본 확인하기 Data : mtcars
class(mtcars) #구조확인
str(mtcars) #데이터의 속성 확인
dim(mtcars) #행과 열 확인
head(mtcars) #데이터의 앞 6줄 확인
summary(mtcars) #데이터의 요약 통계량
stem(mtcars$mpg, scale = 4) #줄기로표현

sort(mtcars$mpg) #데이터 정렬

# 막대 그래프 break(10~32구간을 by로 나눠표현하라. col = rainbow(몇가지색?))
hist(mtcars$mpg, breaks=seq(10,32, by=2), col = rainbow(7)) 

#gear의 수에 따른 자동차종 빈도 구하기 horiz=TRUE 시 수평막대
gear <- table(mtcars$gear)
barplot(gear, main = "제목", xlab="x축제목", ylab="y축제목", col=rainbow(3), xlim=c(0,16), horiz=TRUE)

#산점도 pch는 마커, col은 마커커테두리, bg는마커색, cex는 마커크기

plot(mtcars$wt, mtcars$mpg, main="중량에 따른 연비", xlab="중량", ylab="연비", pch=22, col ='green', bg='red', cex=2.5)

#산점도 행렬을 이용한 자동차 특성 분석 pairs()는 산점도 행렬을 만드는데 쓰인다
data <- data.frame(mtcars$mpg, mtcars$cyl, mtcars$hp, mtcars$wt)
pairs(data, main="제목", col = 'red')

#붓꽃 품종별 산점도
species <- as.numeric(iris$Species) #품종을 숫자로 변경:색과 pch 표현현
color <- c("red", "green", "blue")
plot(iris$Sepal.Width,iris$Sepal.Length, main="제목", pch=(species), col = color[species])

#무게와 연비에 따른 배기량 fg=아이콘테두리색색, bg=아이콘색색
bubble <- sqrt(mtcars$disp/pi)
symbols(mtcars$wt, mtcars$mpg, bubble, fg="red", bg="green", inches=0.3, xlab="중량",ylab="연비")

#boxplot
#출력결과는 위부터 하위경계값, 1사분위수, 2사분위수(중앙값), 3사분위수, 상위경계값 의미
boxplot(mtcars$mpg)

#코드로 한화면에 여러개 그래프 그릴때 par() 사용!!
par(mfrow=c(3,4)) #그래프의 배치 설정 c(행,열)
x=1:10
y=c(10,20,30,40,50,60,70,80,90,100)

plot(x,y, type='p', main="type = 'p' (점)")
plot(x,y, type='l', main="type = 'l' (선)")
plot(x,y, type='b', main="type = 'b' (점과선)")
plot(x,y, type='c', main="type = 'c' (b의선)")
plot(x,y, type='o', main="type = 'o' (점 위의 선)")
plot(x,y, type='h', main="type = 'h' (수직선)")
plot(x,y, type='s', main="type = 's' (계단형)")
plot(x,y, type='S', main="type = 'S' (계단형)")
plot(x,y, type='n', main="type = 'n' (나타나지않음)")

#선그래프 이용한 나이의 변화에 따른 다섯종의 오렌지 나무의 성장
tree <- as.numeric(Orange$Tree) #숫자형으로로
xrange <- range(Orange$age)
yrange <- range(Orange$circumference)

plot(xrange,yrange, type='n',xlab='age',ylab='Circumference')
n=max(tree) #tree 나무 종류 수
colors <- rainbow(n)
linetype <- c(1:n)
pchs <- c(1:n)

for (i in 1:n) {
  temp <- subset(Orange, Tree==i) #종별 데이터 추출하기 위해 쓰는 subset()
  lines(temp$age, temp$circumference, type='b', lwd=2,lty=linetype[i],col=colors[i],pch=pchs[i])
}

legend(xrange[1],yrange[2],legend = 1:n, col=colors,cex=0.8, pch=pchs,lty=linetype)

#결측치치
mycin <- as.data.frame(Puromycin)

is.na(mycin) #데이터프레임 전체의 결측치 확인 TorF
is.na(mycin$conc) #특정열에 결측치 확인 TorF
is.na(mycin[1:3,]) #특정행에 결측치 확인 (1~3행 검사) TorF
sum(is.na(mycin)) #결측치 갯수 확인하기 
table(is.na(mycin)) #TorF
sum(mycin$conc) #결측치 포함된 데이터 함수 실행 결과.결과 NA 나옴
sum(mycin$conc, na.rm=T) #결측치 제외 실행
mycin_omit <- na.omit(mycin) #결측치 제거(NA값을 아예 제거(데이터손상))
mycin_rm <- mycin[complete.cases(mycin),]  #결측치 제거(NA값을 아예 제거(데이터손상))
mycin$conc[is.na(mycin$conc)]=0 #na값 0으로 변경
mycin$rate[is.na(mycin$rate)] = mean(mycin$rate, na.rm=T) #NA값을 평균으로 대체

#이상치
#ifelse 이용해 이상치 결측치로 대체
orange$age <- ifelse(orange$age == 1100 | orange$age == 2000, NA, orange$age) 

#circumference 변수에  극단치를 Na값으로 대체
orange$circumference <- ifelse(Orange$circumference == 400, NA, orange$circumference)

#select() 함수를 이용한 변수 추출
library(dplyr) # %>% 기호를 사용하여 함수를 연결 일련의정제 작업을 연결가능!
mtcar1 <- mtcars
select(mtcar1,mpg,cyl,vs) #mpg, cyl, vs 변수 추출
select(mtcar1, -am, -gear, -carb) #am, gear, carb 변수 제외

mtcar1 %>% filter(cyl ==6) #filter() 함수로 cyl 변수의 값이 6인 경우를 추출
mtcars %>% filter(mpg > 21 & gear == 4)
mtcar1 %>% arrange(mtcars$mpg) #오름차순 데이터 정렬
mtcar1 %>% arrange(desc(mtcars$mpg)) #내림차순 정렬
mtcar1 %>% arrange(cyl, mpg) #여러값으로 정렬

duplicated(mtcars$cyl) #중복값의 확인
mtcars %>% mutate(sec=qsec*4) %>% head #새로운 변수 생성
mtcars %>% summarise(mean(mpg)) #mpg의 평균구하기

#실린터 별 자동차대수 및 mpg 평균구하기
mtcars %>%
  group_by(cyl) %>%
  summarise(n=n(),
            mean = mean(mpg))

#엔진형태(vs) 별 실린더 갯수에 의한 연비 평균
mtcars %>%
  group_by(vs,cyl) %>%
  summarise(vs_cyl_mpg_mean=mean(mpg))

#변속기어가 automatic 인 경우 연비,마력, 무게를 연비로 정렬된 상위 6개 결과 출력
mtcars %>%
  filter(am==0) %>%
  select(mpg, hp, wt) %>%
  arrange(desc(mpg)) %>%
  head

#data : 시각화하려는 데이터 또는 실제 정보를 의미. 데이터 프레임만 대상
#geometries(geoms) : 데이터를 표현하는 도형을 의미.산점도의 점, 그래프의 막대나 선 등
#aesthetic : 축의 스케일, 색상, 채우기 등 미학적/시각적 속성을 의미

#ggplot() 함수를 이용한 그래프 템플릿 만들기
library(ggplot2)
ggplot(data = mtcars) #그래프 템플릿 생성
#aes()함수를 이용한 x축,y축 데이터 지정
ggplot(data= mtcars, map= aes(x=disp, y=mpg))
ggplot(data =mtcars, mapping =aes(x=disp,y=mpg))
ggplot(data=mtcars,aes(x=disp,y=mpg))

#geom_point() 함수를 추가하기
ggplot(data = mtcars,aes(x=disp, y=mpg)) + geom_point()
#aes() 함수의 파라메터 설정을 이용한 그래프 꾸미기
ggplot(data=mtcars, aes(x=disp,y=mpg)) + geom_point(aes(color='red', size=3))
#그래프에 다양한 설정 적용하기
ggplot(data =mtcars,aes(x=disp, y=mpg)) +
  geom_point() +
  xlim(30,500) +
  ylim(10,40) +
  theme_bw() +
  ggtitle('mpg$disp scatter point') +
  labs(x='배기량',y='연비') +
  theme(plot.title = element_text(size=17, face = 'bold', color = 'violetred', hjust = 0.5),
        axis.title = element_text(size=13), #x축 제목의 크기변경
        axis.title.y = element_text(angle=0, vjust = 0.5)) #y축 제목의 위치 변경

#x축 값만 지정한 막대그래프
ggplot(data=Orange, aes(x=age, y=circumference)) + geom_bar(stat = 'identity', width=80, fill='red')
#theme함수 사용한 상세그래프
ggplot(data=Orange, aes(x=age, y=circumference)) + geom_bar(stat='identity',width=80, fill='green') +
  ggtitle('나무의 나이에 따른 나무둘레') +
  labs(x='나무의 나이', y='나무둘레') +
  theme(plot.title = element_text(size=20, face = 'bold', color = 'violetred',hjust = 0.5),
        axis.title=element_text(size=15),
        axis.title.y = element_text(angle=0, vjust = 0.5))

#데이터의 종류를 한 그래프 안에 나눠서 표시
ggplot(data=Orange, aes(x=age, y=circumference, fill=Tree)) + geom_bar(stat = 'identity')

#데이터의 종류를 나눠 다른 위치에 표시
ggplot(data=Orange, aes(x=age, y=circumference, fill=Tree)) + geom_bar(stat='identity', position = 'dodge')

#막대그래프를 !수평!
ggplot(data=Orange, aes(x=age, y=circumference, fill=Tree)) + 
  geom_bar(stat='identity') + coord_flip()

#mpg를 히스토그램으로 그리기
ggplot(data=mtcars, aes(mpg)) + geom_histogram(binwidth = 2)

#히스토그램 상세설정
ggplot(data=mtcars, aes(mpg)) + geom_histogram(fill='yellow', color='green', binwidth = 2) +
  ggtitle('연비의 히스토그램') + 
  labs(x='연비',y='빈도') +
  theme(plot.title = element_text(size=20, face='bold', color = 'violetred', hjust = 0.5),
        axis.title=element_text(size=20),
        axis.title.y = element_text(angle = 0, vjust = 0.5))

#변속기어별 히스토그램
transm = factor(mtcars$am)
ggplot(mtcars, aes(mpg, fill=transm)) +
  geom_histogram(binwidth = 6, position = 'dodge') +
  theme(axis.title = element_text(size=10), axis.title.y = element_text(angle = 0, vjust = 0.5))

#변속기어별 히스토그램-스택구조
transm = factor(mtcars$am)
ggplot(data = mtcars, aes(mpg, fill=transm)) + geom_histogram(binwidth=6)

#선그래프(lwd:선두께, hline:평균선, )
eco <- economics
ggplot(eco, aes(x=date, y=unemploy)) + geom_line(color='red', lwd=1) +
  geom_hline(yintercept= mean(eco$unemploy), color='red', linetype='dashed')

#나무의 종류에 따른 선그래프 그리기
ggplot(Orange, aes(age, circumference, color=Tree)) + 
  geom_line(linetype=4,size=2)

#연비의 상자그림
ggplot(data= mtcars, aes(y=mpg)) + geom_boxplot()
ggplot(data= mtcars, aes(x= factor(cyl),y=mpg)) + geom_boxplot(fill='red')
#이상치 모양변경과 제거하기
ggplot(data=mtcars, aes(x=factor(cyl), y= mpg, fill=factor(cyl))) +
  geom_boxplot(width=0.5, outlier.color = 'red', outlier.shape = 2) +
  labs(x='실린더', y='연비', fill='cyl')
#이상치 제거! geom_boxplot(outlier.shape = NA)
  
#상자자그림에 평균 추가하기
ggplot(mtcars, aes(factor(cyl),mpg, fill=factor(cyl))) +
  geom_boxplot() +
  stat_summary(fun="mean", geom="point", shape=25, size=3, fill="yellow")

x <- cbind(x1=3, x2=c(4:1,2:5))
col.sums <- apply(x, 2, sum)
col.sums

str(mtcars)
