a <- scan()       #�����Է¹ޱ�
b = scan(���ϸ�,what="") #�����Է¹ޱ�
data <- read.table("grade.csv", sep = ',')

var <- read.csv("grade.csv") #csv���� �б�

write.table(data1, file="table1.txt", quote = FALSE) # �ؽ�Ʈ ���� ���� 
write.csv(data1, file="csv1.csv", row.names = FALSE) # �� �ѹ� �Ȼ����

install.packages("readxl")
library(readxl)

var <- read_excel("grade.xlsx", col_names = F) #col_names = F �ϸ� ���̸��� �����ͷ� ����!
var
#������
str <- c("I love R") 
strsplit(str, split=" ") 

#sub(), gsub()
str <- "R is very good!! I love R"
sub("R", "PYthon", str) #�ϳ��� �ٲ۴�.
gsub("R", "Python", str) # ��� R�� �ٲ۴�.

#���ڿ��� ������ ã�� �ִ� �Լ�
grep("R", str) #0 �� 1 bol����
grepl("R",str) #T or F bol����
regexpr("R", str) #ó�� ������ ������ġ ã��
gregexpr("R", str) #ã������ ���� ��� ��ġ ã��

#�������� �⺻ Ȯ���ϱ� Data : mtcars
class(mtcars) #����Ȯ��
str(mtcars) #�������� �Ӽ� Ȯ��
dim(mtcars) #��� �� Ȯ��
head(mtcars) #�������� �� 6�� Ȯ��
summary(mtcars) #�������� ��� ��跮
stem(mtcars$mpg, scale = 4) #�ٱ��ǥ��

sort(mtcars$mpg) #������ ����

# ���� �׷��� break(10~32������ by�� ����ǥ���϶�. col = rainbow(�����?))
hist(mtcars$mpg, breaks=seq(10,32, by=2), col = rainbow(7)) 

#gear�� ���� ���� �ڵ����� �� ���ϱ� horiz=TRUE �� ���򸷴�
gear <- table(mtcars$gear)
barplot(gear, main = "����", xlab="x������", ylab="y������", col=rainbow(3), xlim=c(0,16), horiz=TRUE)

#������ pch�� ��Ŀ, col�� ��ĿĿ�׵θ�, bg�¸�Ŀ��, cex�� ��Ŀũ��

plot(mtcars$wt, mtcars$mpg, main="�߷��� ���� ����", xlab="�߷�", ylab="����", pch=22, col ='green', bg='red', cex=2.5)

#������ ����� �̿��� �ڵ��� Ư�� �м� pairs()�� ������ ����� ����µ� ���δ�
data <- data.frame(mtcars$mpg, mtcars$cyl, mtcars$hp, mtcars$wt)
pairs(data, main="����", col = 'red')

#�ײ� ǰ���� ������
species <- as.numeric(iris$Species) #ǰ���� ���ڷ� ����:���� pch ǥ����
color <- c("red", "green", "blue")
plot(iris$Sepal.Width,iris$Sepal.Length, main="����", pch=(species), col = color[species])

#���Կ� ���� ���� ��ⷮ fg=�������׵θ�����, bg=�����ܻ���
bubble <- sqrt(mtcars$disp/pi)
symbols(mtcars$wt, mtcars$mpg, bubble, fg="red", bg="green", inches=0.3, xlab="�߷�",ylab="����")

#boxplot
#��°���� ������ ������谪, 1�������, 2�������(�߾Ӱ�), 3�������, ������谪 �ǹ�
boxplot(mtcars$mpg)

#�ڵ�� ��ȭ�鿡 ������ �׷��� �׸��� par() ���!!
par(mfrow=c(3,4)) #�׷����� ��ġ ���� c(��,��)
x=1:10
y=c(10,20,30,40,50,60,70,80,90,100)

plot(x,y, type='p', main="type = 'p' (��)")
plot(x,y, type='l', main="type = 'l' (��)")
plot(x,y, type='b', main="type = 'b' (������)")
plot(x,y, type='c', main="type = 'c' (b�Ǽ�)")
plot(x,y, type='o', main="type = 'o' (�� ���� ��)")
plot(x,y, type='h', main="type = 'h' (������)")
plot(x,y, type='s', main="type = 's' (�����)")
plot(x,y, type='S', main="type = 'S' (�����)")
plot(x,y, type='n', main="type = 'n' (��Ÿ��������)")

#���׷��� �̿��� ������ ��ȭ�� ���� �ټ����� ������ ������ ����
tree <- as.numeric(Orange$Tree) #���������η�
xrange <- range(Orange$age)
yrange <- range(Orange$circumference)

plot(xrange,yrange, type='n',xlab='age',ylab='Circumference')
n=max(tree) #tree ���� ���� ��
colors <- rainbow(n)
linetype <- c(1:n)
pchs <- c(1:n)

for (i in 1:n) {
  temp <- subset(Orange, Tree==i) #���� ������ �����ϱ� ���� ���� subset()
  lines(temp$age, temp$circumference, type='b', lwd=2,lty=linetype[i],col=colors[i],pch=pchs[i])
}

legend(xrange[1],yrange[2],legend = 1:n, col=colors,cex=0.8, pch=pchs,lty=linetype)

#����ġġ
mycin <- as.data.frame(Puromycin)

is.na(mycin) #������������ ��ü�� ����ġ Ȯ�� TorF
is.na(mycin$conc) #Ư������ ����ġ Ȯ�� TorF
is.na(mycin[1:3,]) #Ư���࿡ ����ġ Ȯ�� (1~3�� �˻�) TorF
sum(is.na(mycin)) #����ġ ���� Ȯ���ϱ� 
table(is.na(mycin)) #TorF
sum(mycin$conc) #����ġ ���Ե� ������ �Լ� ���� ���.��� NA ����
sum(mycin$conc, na.rm=T) #����ġ ���� ����
mycin_omit <- na.omit(mycin) #����ġ ����(NA���� �ƿ� ����(�����ͼջ�))
mycin_rm <- mycin[complete.cases(mycin),]  #����ġ ����(NA���� �ƿ� ����(�����ͼջ�))
mycin$conc[is.na(mycin$conc)]=0 #na�� 0���� ����
mycin$rate[is.na(mycin$rate)] = mean(mycin$rate, na.rm=T) #NA���� ������� ��ü

#�̻�ġ
#ifelse �̿��� �̻�ġ ����ġ�� ��ü
orange$age <- ifelse(orange$age == 1100 | orange$age == 2000, NA, orange$age) 

#circumference ������  �ش�ġ�� Na������ ��ü
orange$circumference <- ifelse(Orange$circumference == 400, NA, orange$circumference)

#select() �Լ��� �̿��� ���� ����
library(dplyr) # %>% ��ȣ�� ����Ͽ� �Լ��� ���� �Ϸ������� �۾��� ���ᰡ��!
mtcar1 <- mtcars
select(mtcar1,mpg,cyl,vs) #mpg, cyl, vs ���� ����
select(mtcar1, -am, -gear, -carb) #am, gear, carb ���� ����

mtcar1 %>% filter(cyl ==6) #filter() �Լ��� cyl ������ ���� 6�� ��츦 ����
mtcars %>% filter(mpg > 21 & gear == 4)
mtcar1 %>% arrange(mtcars$mpg) #�������� ������ ����
mtcar1 %>% arrange(desc(mtcars$mpg)) #�������� ����
mtcar1 %>% arrange(cyl, mpg) #���������� ����

duplicated(mtcars$cyl) #�ߺ����� Ȯ��
mtcars %>% mutate(sec=qsec*4) %>% head #���ο� ���� ����
mtcars %>% summarise(mean(mpg)) #mpg�� ��ձ��ϱ�

#�Ǹ��� �� �ڵ������ �� mpg ��ձ��ϱ�
mtcars %>%
  group_by(cyl) %>%
  summarise(n=n(),
            mean = mean(mpg))

#��������(vs) �� �Ǹ��� ������ ���� ���� ���
mtcars %>%
  group_by(vs,cyl) %>%
  summarise(vs_cyl_mpg_mean=mean(mpg))

#���ӱ� automatic �� ��� ����,����, ���Ը� ����� ���ĵ� ���� 6�� ��� ���
mtcars %>%
  filter(am==0) %>%
  select(mpg, hp, wt) %>%
  arrange(desc(mpg)) %>%
  head

#data : �ð�ȭ�Ϸ��� ������ �Ǵ� ���� ������ �ǹ�. ������ �����Ӹ� ���
#geometries(geoms) : �����͸� ǥ���ϴ� ������ �ǹ�.�������� ��, �׷����� ���볪 �� ��
#aesthetic : ���� ������, ����, ä��� �� ������/�ð��� �Ӽ��� �ǹ�

#ggplot() �Լ��� �̿��� �׷��� ���ø� �����
library(ggplot2)
ggplot(data = mtcars) #�׷��� ���ø� ����
#aes()�Լ��� �̿��� x��,y�� ������ ����
ggplot(data= mtcars, map= aes(x=disp, y=mpg))
ggplot(data =mtcars, mapping =aes(x=disp,y=mpg))
ggplot(data=mtcars,aes(x=disp,y=mpg))

#geom_point() �Լ��� �߰��ϱ�
ggplot(data = mtcars,aes(x=disp, y=mpg)) + geom_point()
#aes() �Լ��� �Ķ���� ������ �̿��� �׷��� �ٹ̱�
ggplot(data=mtcars, aes(x=disp,y=mpg)) + geom_point(aes(color='red', size=3))
#�׷����� �پ��� ���� �����ϱ�
ggplot(data =mtcars,aes(x=disp, y=mpg)) +
  geom_point() +
  xlim(30,500) +
  ylim(10,40) +
  theme_bw() +
  ggtitle('mpg$disp scatter point') +
  labs(x='��ⷮ',y='����') +
  theme(plot.title = element_text(size=17, face = 'bold', color = 'violetred', hjust = 0.5),
        axis.title = element_text(size=13), #x�� ������ ũ�⺯��
        axis.title.y = element_text(angle=0, vjust = 0.5)) #y�� ������ ��ġ ����

#x�� ���� ������ ����׷���
ggplot(data=Orange, aes(x=age, y=circumference)) + geom_bar(stat = 'identity', width=80, fill='red')
#theme�Լ� ����� �󼼱׷���
ggplot(data=Orange, aes(x=age, y=circumference)) + geom_bar(stat='identity',width=80, fill='green') +
  ggtitle('������ ���̿� ���� �����ѷ�') +
  labs(x='������ ����', y='�����ѷ�') +
  theme(plot.title = element_text(size=20, face = 'bold', color = 'violetred',hjust = 0.5),
        axis.title=element_text(size=15),
        axis.title.y = element_text(angle=0, vjust = 0.5))

#�������� ������ �� �׷��� �ȿ� ������ ǥ��
ggplot(data=Orange, aes(x=age, y=circumference, fill=Tree)) + geom_bar(stat = 'identity')

#�������� ������ ���� �ٸ� ��ġ�� ǥ��
ggplot(data=Orange, aes(x=age, y=circumference, fill=Tree)) + geom_bar(stat='identity', position = 'dodge')

#����׷����� !����!
ggplot(data=Orange, aes(x=age, y=circumference, fill=Tree)) + 
  geom_bar(stat='identity') + coord_flip()

#mpg�� ������׷����� �׸���
ggplot(data=mtcars, aes(mpg)) + geom_histogram(binwidth = 2)

#������׷� �󼼼���
ggplot(data=mtcars, aes(mpg)) + geom_histogram(fill='yellow', color='green', binwidth = 2) +
  ggtitle('������ ������׷�') + 
  labs(x='����',y='��') +
  theme(plot.title = element_text(size=20, face='bold', color = 'violetred', hjust = 0.5),
        axis.title=element_text(size=20),
        axis.title.y = element_text(angle = 0, vjust = 0.5))

#���ӱ� ������׷�
transm = factor(mtcars$am)
ggplot(mtcars, aes(mpg, fill=transm)) +
  geom_histogram(binwidth = 6, position = 'dodge') +
  theme(axis.title = element_text(size=10), axis.title.y = element_text(angle = 0, vjust = 0.5))

#���ӱ� ������׷�-���ñ���
transm = factor(mtcars$am)
ggplot(data = mtcars, aes(mpg, fill=transm)) + geom_histogram(binwidth=6)

#���׷���(lwd:���β�, hline:��ռ�, )
eco <- economics
ggplot(eco, aes(x=date, y=unemploy)) + geom_line(color='red', lwd=1) +
  geom_hline(yintercept= mean(eco$unemploy), color='red', linetype='dashed')

#������ ������ ���� ���׷��� �׸���
ggplot(Orange, aes(age, circumference, color=Tree)) + 
  geom_line(linetype=4,size=2)

#������ ���ڱ׸�
ggplot(data= mtcars, aes(y=mpg)) + geom_boxplot()
ggplot(data= mtcars, aes(x= factor(cyl),y=mpg)) + geom_boxplot(fill='red')
#�̻�ġ ��纯��� �����ϱ�
ggplot(data=mtcars, aes(x=factor(cyl), y= mpg, fill=factor(cyl))) +
  geom_boxplot(width=0.5, outlier.color = 'red', outlier.shape = 2) +
  labs(x='�Ǹ���', y='����', fill='cyl')
#�̻�ġ ����! geom_boxplot(outlier.shape = NA)
  
#�����ڱ׸��� ��� �߰��ϱ�
ggplot(mtcars, aes(factor(cyl),mpg, fill=factor(cyl))) +
  geom_boxplot() +
  stat_summary(fun="mean", geom="point", shape=25, size=3, fill="yellow")

x <- cbind(x1=3, x2=c(4:1,2:5))
col.sums <- apply(x, 2, sum)
col.sums

str(mtcars)
