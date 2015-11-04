# ZBY-AirPrint
AirPrint Demo for ipad and iphone  苹果无线打印技术的几种实现方案

之前因为项目需要在Github上发现关于AirPrint的资料不多，于是就有了现在这个方案分析

无线打印现在有三种解决方案：两种是基于AirPrint技术，一种是基于打印机厂家sdk：

方案一：使用支持AirPrint技术的打印机。测试打印demo需要模拟打印机，通过 Xcode > Open Developer Tool > More Developer Tools 打开连接，
然后下载 Hardware IO Tools

方案二：使用不支持AirPrint技术的打印机，此方案需要硬件设备有打印机，无线路由器，电脑主机。软件需要O'Print软件，此软件的作用是把与电脑连接的打印机转换为支持AirPrint技术的打印机。O'Print 下载地址 http://oprintware.com/
这个技术方案的优点是可以使任何打印机都能支持苹果AirPrint技术，当项目需要的打印机不能支持AirPrint技术的时候或者需要节省成本的时候（支持AirPrint技术的打印机价格较高），这种方案是最优的。但是缺点也很明显，需要一台主机作为打印伺服器。

方案三：使用打印机厂家提供的sdk。sdk实现无线打印一般是通过Wi-Fi或者蓝牙使移动设备和打印机进行无线连接。此方案的优点是对于支持Wi-Fi和蓝牙连接，不支持AirPrint技术的打印机，作为伺服器的电脑主机可以省掉。但是这个方案有很大的缺陷，首先AirPrint技术的出现就是为了解决不同打印机厂家sdk的不同给程序员带来的巨大不便。其次，这种方案需要打印机有蓝牙或者Wi-Fi模块，这缩小了我们的选择范围，同时Wi-Fi和蓝牙模块一样会带来成本问题。

此打印demo的应用场景是：项目需要打印一个物流单或者需要打印一些自定义的图表。这时，最简单的方案是，首先生成一个物流单或者图表的视图，然后获取显示内容的图片，最后打印图片。如果想对AirPrint有更多的了解，你也可以看苹果官方文档，链接如下：https://developer.apple.com/airprint/
