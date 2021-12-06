mycin <- as.data.frame(Puromycin)
head(mycin)

str(mycin) #데이터셋 속성 확인

summary(mycin) #state의 factor값을 주목.


#결측치 생성
mycin[2,1] <- NA
mycin[5,2] <- NA
mycin[7,3] <- NA
print(mycin)

#결측치 확인하기
is.na(mycin) # 데이터프레임 전체의 결측치 확인하기 'NA'값이 TRUE로 보인다.

is.na(mycin$conc) #특정 열의 결측치 확인 ㅣ
is.na(mycin[1:5,]) #1행부터 5행까지
is.na(mycin[1:5,"rate"]) #1행부터 5행까지 rate값만.

#결측치 개수 확인하기
sum(is.na(mycin))
table(is.na(mycin))

#결측치 포함한 데이터 함수 실행.
sum(mycin$conc) #NA값이 나옴. NA값 제거하고 계산해야함.

#결측치 제외 계산
sum(mycin$conc, na.rm = TRUE)
mycin$conc[is.na(mycin$conc)] = 0 #NA값을 0으로 대체.
head(mycin$conc)
mycin$rate[is.na(mycin$rate)] = mean(mycin$rate, na.rm = T)
head(mycin$rate)

#Orange 데이터셋의 age 변수 집계 및 이상치 생성
orange <- as.data.frame(Orange)
table(orange$age)
print(Orange$age)
head(Orange$age)

library(dplyr)

print(mtcars)
mtcar1 <- mtcars
select(mtcar1, mpg, cyl, vs)

mtcar1 %>% select(mpg, cyl, vs)

mtcar1 %>% group_by(cyl) %>% summarise(n=n(),mean=mean(mpg)) 

#변속기어가 auto 인 경우(am:0) 연비,마력,무게를 정렬된 상위 6개 결과 출력
mtcar1 %>% filter(am == 0) %>% select(mpg, hp, wt) %>% arrange(desc(mpg)) %>% head
