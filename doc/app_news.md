APP研发新员工入职指引


转至元数据结尾

​    由 Guolin创建, 最终由 Sven修改于 九月 02, 2020
转至元数据起始

研发相关系统
  •  Zeplin：GUI设计稿发布工具，公共账号: vesync.ui05@etekcity.com.cn， 密码：Vesync05；网关项目自行注册账号，Alvin邀请
  •  
  •  内部文档小幺鸡（自行注册，地址，Barry邀请）：http://34.194.32.46:8080/dashboard
  •  
  •  Confluence（自行注册，Barry分配）：http://wiki.vesync.com:8090/signup.action?token=54bbaf46165f13bc，云服务，APP，固件，蓝牙等接口文档 
  •  Git（自行用公司邮箱注册，地址，注册完成Guolin / Sven邀请）： http://fangcun.vesync.com:8081/ 使用方法：
  1  在PC上生成SSH公钥，并添加到Gitlab个人账户设置下
  2  通过ssh协议Clone代码  
  •  禅道系统（Guolin / Sven分配账号）：http://zentao.vesync.com:8081/zentao/my/，目前主要用于测试Bug反馈跟踪，英文名登录（英文名区分大小写），默认密码英文名+123456  
  •  个人项目管理系统（Guolin / Sven分配账号）：http://app-pm.vesync.com/auth/login?next=/，邮箱登录，默认密码：123456  
  •  公司项目管理系统PowerProject（Sophie分配）：https://pm.itekcity.com/Users/UserHome/Index，用户名：大小写英文名+姓全拼，默认密码：123456  
  •  Jenkins（不分配账号）: http://192.168.14.45:8080 APP提供外部使用（试用，提测，上传商店）的安装包均使用Jenkins打包，打包后系统自动上传蒲公英，通过蒲公英连接即可下载  
  •  腾讯文档（企业QQ扫描登录）：https://docs.qq.com 由于公司统一试用企业QQ作为沟通工具，所以经常配合腾讯文档进行协同编辑和文档分享  

试用期工作流程
每周重要节点
  •  周四：更新内部项目管理系统中的个人人日
  •  周五：个人工作周报（工作总结，下周计划，疑问和感想）发送Guolin和Sven，抄送Victor, Tina以及智能研发
每月重要节点
  •  月末：个人月度总结个人工作周报（工作总结，下周计划，疑问和感想）发送Guolin和Sven，抄送Victor, Tina以及智能研发
项目工作流程
  •  需求定义：产品经理主导，目的是明确产品功能定义，输出原型设计
  •  需求确认：研发主导，目的是确保多方之间对产品需求的理解达成一致，输出需求确认单
  •  项目排期：研发主导，确定三方开发，测试，上线的周期，最终项目经理将排期更新到PM系统，项目经理会在时间节点进行追踪，如有风险需要及时反馈，由项目经理进行协调 APP研发内部排期：项目负责人进行模块划分，与各个模块负责人协调开发周期，并更新到项目追踪表https://docs.qq.com/sheet/DZHRSVkFkVFVVanZu?opendocxfrom=admin&tab=BB08J2&coord=F93A0AG0
  •  功能开发
  •  联调测试：APP开发完成后，对照必要测试用例进行自测，测试OK后在Jenkins进行打包，编写提测邮件，APP测试人员在云联调环境进行功能测试
  •  预发布测试：联调测试Bug回归完成之后，进入云预发布环境进行APP功能测试，这个阶段不再接受功能的合并，只接受Bug修复
  •  线上测试：将代码合并到线上分支，与将要同步上线的其他功能合并测试，测试完成后即可发布到应用商店