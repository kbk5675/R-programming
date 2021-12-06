library(ggplot2)

#script 7-3 aes() 함수의 파라메터 설정을 이용한 그래프 꾸미기
ggplot(data = mtcars, aes(x = disp, y = mpg)) + geom_point( aes(color='red', size=3))

#script 7-4 그래프에 다양한 설정 적용하기
ggplot(data = mtcars, aes(x =disp, y=mpg)) + geom_point() + xlim(30,500) + ylim(10,40) + theme_bw() + ggtitle('mpg& disp scatter point')

#script 7-5 그래프 제목 및 축 제목 등의 상세 설정
ggplot(data = mtcars, aes(x = disp, y = mpg)) + geom_point() + xlim(30, 500) + ylim(10, 40) +
  theme_bw() + 
  ggtitle('mpg & disp scatter point') + 
  labs(x = '배기량', y = '연 비') +
  theme(plot.title = element_text(size = 17, face = 'bold', color = 'violetred', hjust = 0.5),
        axis.title = element_text(size = 13),
        axis.title.y = element_text(angle = 0, vjust = 0.5))


############
#막대그래프#
############

#script 7-7
ggplot(data = Orange, aes(x=age, y=circumference)) + 
  geom_bar(stat = 'identity', width = 80, fill = 'red')

#script 7-8
ggplot(data = Orange, aes(x=age, y=circumference)) +
  geom_bar(stat= 'identity', width = 80, fill = 'green') +
  ggtitle('나무의 나이에 따른 나무둘레')

#scirpt 7-10 데이터의 종류를 나눠 다른 위치에 표시 
ggplot(data = Orange, aes(x=age, y=circumference, fill=Tree)) +
  geom_bar(stat = 'identity', position = 'dodge')

#scirpt 7-11 막대그래프를 수평으로 그리기
ggplot(data = Orange, aes(x=age, y=circumference, fill=Tree)) +
  geom_bar(stat = 'identity') +
  coord_flip()

#script 7-12 mpg를 히스토그램으로 그리기
ggplot(data = mtcars, aes(mpg)) + 
  geom_histogram(binwidth = 3)


#script 7-14 변속기어별 히스토그램
transm = factor(mtcars$am)
ggplot(data = mtcars, aes(mpg, fill=transm)) +
  geom_histogram(binwidth = 6, position = 'dodge')


#script 7-15 변속기어별 히스토그램-스택구조
transm = factor(mtcars$am) 
ggplot(data = mtcars, aes(mpg, fill=transm)) + geom_histogram(binwidth = 6)


#script 7-17 날짜별 실업자 선그래프
eco <- economics
ggplot(data = eco, aes(x=date, y=unemploy)) + geom_line()

#script 7-23 이상치 모양변경과 제거하기
ggplot(data=mtcars, aes(x=factor(cyl), y=mpg, fill=factor(cyl))) +
  geom_boxplot(width=0.5, outlier.color = 'red', outlier.shape = 2)






