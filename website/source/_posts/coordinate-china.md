﻿---
title: 空间坐标与投影系统系列(二)：国内常用投影坐标系
date: 2018-07-31 21:31:58
categories:
  - 基础知识
  - 空间坐标与投影系统系列
tags:
  - 空间坐标系
  - 地图投影  
---

**上一篇我们介绍了空间坐标和地图投影。本篇我们以国内常用的54，80，2000坐标系统为例，介绍各坐标系统的区别与联系。**

<!-- toc -->

# 我国常用坐标系
我国大中比例尺地图均采用``高斯-克吕格投影``，其通常是按6度和3度分带投影，1:2.5万－1:50万比例尺地形图采用经差6度分带，1:1万比例尺的地形图采用经差3度分带。具体分带法是：6度分带从本初子午线开始，按经差6度为一个投影带自西向东划分，全球共分60个投影带，带号分别为1－60；3度投影带是从东经1度30秒经线开始，按经差3度为一个投影带自西向东划分，全球共分120个投影带。

<!-- more -->

为了便于地形图的测量作业，在高斯-克吕格投影带内布置了平面直角坐标系统，具体方法是，规定中央经线为X轴，赤道为Y轴，中央经线与赤道交点为坐标原点，x值在北半球为正，南半球为负，y值在中央经线以东为正，中央经线以西为负。由于我国疆域均在北半球，x值均为正值，为了避免y值出现负值，规定各投影带的坐标纵轴均西移500km，中央经线上原横坐标值由0变为500km。为了方便带间点位的区分，可以在每个点位横坐标y值的百千米位数前加上所在带号，如20带内A点的坐标可以表示为YA=20745921.8m。

## 北京54坐标系(BJZ54)  
北京54坐标系为``参心坐标系``<sup>[1](#footnote1)</sup>，大地上的一点可用经度L54、纬度M54和大地高H54定位，它是以克拉索夫斯基椭球为基础，经局部平差后产生的坐标系。北京54坐标系采用了前苏联的克拉索夫斯基椭球参数，并与前苏联1942年坐标系进行联测，通过计算建立了我国大地坐标系， 1954年北京坐标系可以认为是前苏联1942年坐标系的延伸。它的原点不在北京而是在**前苏联的普尔科沃**。
北京54坐标系，属参心坐标系，长轴6378245m，短轴6356863，扁率1/298.3。

## 西安80坐标系 
1978年4月在西安召开全国天文大地网平差会议，确定重新定位，建立我国新的坐标系。为此有了1980年国家大地坐标系。1980年国家大地坐标系采用地球椭球基本参数为1975年国际大地测量与地球物理联合会第十六届大会推荐的数据，即IAG75地球椭球体。该坐标系的大地原点设在**我国**中部的陕西省泾阳县永乐镇，位于西安市西北方向约60公里，故称1980年西安坐标系，又简称西安大地原点。基准面采用青岛大港验潮站1952－1979年确定的黄海平均海水面（即1985国家高程基准）。  
西安80坐标系，属``参心坐标系``<sup>[1](#footnote1)</sup>，长轴6378140m，短轴6356755，扁率1/298.25722101。

## 2000国家大地坐标系  
英文缩写为CGCS2000。2000国家大地坐标系是全球``地心坐标系`<sup>[1](#footnote1)</sup>在我国的具体体现，其原点为包括海洋和大气的整个地球的质量中心。
2000国家大地坐标系采用的地球椭球参数如下：长半轴a=6378137m，扁率f=1/298.257222101。

## WGS－84坐标系  
WGS－84坐标系（World Geodetic System）是一种国际上采用的``地心坐标系``<sup>[1](#footnote1)</sup>。坐标原点为地球质心，其地心空间直角坐标系的Z轴指向国际时间局（BIH）1984.0定义的协议地极（CTP）方向，X轴指向BIH1984.0的协议子午面和CTP赤道的交点，Y轴与Z轴、X轴垂直构成右手坐标系，称为1984年世界大地坐标系。这是一个国际协议地球参考系统（ITRS），是目前国际上统一采用的大地坐标系。GPS广播星历是以WGS-84坐标系为根据的。  
WGS84坐标系，长轴6378137.000m，短轴6356752.314，扁率1/298.257223563。  由于采用的椭球基准不一样，并且由于投影的局限性，使的全国各地并不存在一至的转换参数。对于这种转换由于量较大，有条件的话，一般都采用GPS联测已知点，应用GPS软件自动完成坐标的转换。

# 通用GIS软件中的常用坐标系投影方式
我们看一下在ArcGIS中，关于坐标系的区别：
在ArcGIS的Coordinate Systems目录下，分为``Geographic Coordinate Systems``和``Projected Coordinate Systems``，如下
<div align=center>
{% asset_img prj.png ArcGIS中的坐标系 %}
</div>

分别表示地理坐标系统和投影坐标系统，以西安80为例，坐标系统文件命名方式有以下几种：

名称 | EPSG代码<sup>[2](#footnote1)</sup> | 解释 | 
:--|:--|:--|
GCS_Xian_1980 | 4610 | 西安80地理坐标系
Xian 1980 3 Degree GK CM 75E | 2370 | ``三度分带法``的西安80坐标系，投影方式为高斯-克吕格投影，中央经线在东经75度，横坐标前加带号。
Xian 1980 3 Degree GK CM 75E | 2349 | ``三度分带法``的西安80坐标系，投影方式为高斯-克吕格投影，横坐标前加带号。
Xian 1980 GK CM 75E | 2338 | ``六度分带法``的西安80坐标系，投影方式为高斯-克吕格投影，中央经线为东经75度，横坐标前不加带号。
Xian 1980 GK Zone 13 | 2327 | ``六度分带法``的西安80坐标系，投影方式为高斯-克吕格投影，横坐标前加带号。

同样的，我们可以以这种方法来区分北京54坐标系和CGCS2000在软件中的表示。
接下来我们以实际的地理位置（以武汉大学珞珈山为例），查看不同投影坐标系的显示方式：

<div align=center>
{% asset_img ljs.png 珞珈山 %}
</div>

坐标系 | 东坐标 | 西坐标 
:-: | :-: | :-: 
Xian 1980 3 Degree GK CM 114E | 3379772.618| 534945.1555
Xian 1980 3 Degree GK Zone 38 |3379772.618 | 38534945.16
Xian 1980 GK CM 117E  | 3382664.038 | 247012.8279
Xian 1980 GK Zone 20  |3382664.038	|20247012.83

上表可以看出同一个地理位置，表示方法是不一样的，大家平时需要注意这个问题。

# 通过坐标推断投影带类型
在工作中，我们可能会遇到将一些地图文件(如CAD文件)导入到ArcGIS中，现在我们可以根据上面的规则来推断它的类型。以上文中的位置为例，地图上某个点的坐标为：

$$3382664.038，20247012.83$$

这时我们可以检查它的横坐标，为20247012.83，显而易见横坐标前面有带号且带号为20。西安80的三度带范围为25至45，六度带范围为13至23。因此我们可以判断此地图文件的投影带为六度带，且带号为20，并可进一步推出它的中央经线为东经117度。

我们再来看一个坐标点：

$$3379772.618，534945.1555$$

它的横坐标前是不加带号的，此时我们可以通过比例尺来判断，我国规定，一般对于1:2.5万～1:10万的地图采用**六度带**，对于1:1万或更大比例尺的地形图采用**三度带**。因此这类地图文件可以检查比例尺大小来判断地图是六度带还是三度带。

# 结束语

**坐标系的选用在测绘工作中十分重要，当然熟悉坐标系统知识也是我们测绘工作者的基本要求。近几年，随着测绘科学的发展，3S技术相继引入，作业难度降低，测绘精度逐步提高。国内测绘部门先后采用了几种坐标系统，为了充分利用现有测绘数据，节约成本，我们需要掌握坐标转换方法，在下一期的文章中，我们将带来我国常用坐标系的转换方法。**

-------------

<a name="footnote1">1</a>: 参心坐标系、地心坐标系:物体均有其质心，处处密度相等的物体的质心在其几何中心。所以，地球只有一个质心，只是测不测的精确的问题而已。由地球的唯一性和客观存在，以地球质心为旋转椭球面的中心的坐标系，叫地心坐标系，且唯一。当然，由于a、b两个值的不同，就有多种表达方式，例如，CGCS2000系，WGS84系等。（注：地心坐标系又名协议地球坐标系，与GPS中的瞬时地球坐标系要对应起来。）但是又有一个问题——政治问题，地图是给一个国家服务的，那么这地图就要尽可能描述准确这个国家的地形地貌，尽量减小误差，至于别国就无所谓。所以，就可以人为的把地球的质心“移走”，将局部的表面“贴到”该国的国土，使之高程误差尽量减小到最小。这个时候，就出现了所谓的“参心坐标系”。即椭球中心不在地球质心的坐标系。

我国常用的参心系及对应椭球：
•	北京54坐标系：克拉索夫斯基椭球体
•	西安80坐标系：IAG75椭球体
我国常用的地心系及对应椭球：
•	WGS84坐标系：WGS84椭球体
•	CGCS2000坐标系：CGCS2000椭球体（事实上，CGCS2000椭球和WGS84椭球极为相似，偏差仅有0.11mm，完全可以兼容使用）

<a name="footnote2">2</a>: European Petroleum Survey Group (EPSG)，负责维护并发布坐标参照系统的数据集参数，以及坐标转换描述，该数据集被广泛接受并使用。目前已有的椭球体，投影坐标系等不同组合都对应着不同的ID号，这个号在EPSG中被称为EPSG code，它代表特定的椭球体、单位、地理坐标系或投影坐标系等信息。

(作者：孙玉峰)

<div align=center>
{% asset_img qrcode.png 扫一扫 %}
</div>