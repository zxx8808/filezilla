filezilla是一款高性能ftp工具，这是我维护的filezilla版本，分为客户端和服务器端，服务器端包括filezillaserver程序和filezillainterface程序，前者是windows服务程序，后者是管理filezilla服务的用户界面程序。
编译方法：
1. 编译filezilla客户端
用VS2013打开filezillaclient\clien\src\FileZilla.sln编译即可。

2. 编译filezillaserver
用VS2015打开filezillaserver\filezillaserver\filezillaserver.sln编译即可。

3. 编译filezillaserverinterface
用VS2015打开filezillaserverinterface\filezillaserver\filezillaserverinterface.sln编译即可。

注意： 客户端使用 C++11 开发，而之所以服务器端的 filezillaserver 和 filezillaserver 选择使用较新的 VS2015，是因为服务器端的代码使用了 C++14 的一些特性，而 VS2013 是不支持 C++14 的所有的特性的。

客户端代码，使用了很多第三方库，比如界面库wxWidgets、zlib、sqlite等。

而项目中的CAsyncSocketEx模仿了mfc的CAsyncSocket，但是效率比mfc的CAsyncSocket要高。这个类可以直接拿到其它项目中使用的，比如电驴的源码就是直接使用了这个类。整个项目很有特色的地方是在支线程中使用windows的消息队列来代替传统的自定义消息队列。同时也是对ftp协议的实现。整个项目的代码质量也比较高。

具体参见：http://blog.csdn.net/analogous_love/article/details/73826187

=========================================================================
=========================================================================
Tips：
如果您在使用这份代码的过程中遇到任何问题，可以通过我的微信公众号『easyserverdev』与我取得联系，获得帮助，或者加入QQ技术群进行交流：49114021。

