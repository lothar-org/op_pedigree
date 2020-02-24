# pedigree
族谱网


###⊙族谱网
说明：把族谱从纸质转移到网络上，实现数字化保存，并且丰富其内容。
核心功能：族谱拓扑图
问题：
    族谱辈分怎么排？
    地方称呼如何分？

##参考资料：
族谱网（典型） https://www.zupu.cn/zp
家谱格式24项 http://4g.jiapu.best198.com/g/vip/
家谱族谱设计的8大要点 https://new.qq.com/omn/20190530/20190530A0VC9G.html?pc
webtrees-在线协作家谱 https://github.com/fisharebest/webtrees


##首页

##个人中心：宗豆(ZD)、经验值、相册、日志、故事、收藏、充值、资助、
    个人资料：
        基本：生日年龄(阳历农历)、属相(八卦命相)、星座()、英文名、昵称外号(多个)、
        联系方式：手机电话/QQ/微信/支付宝/邮箱/住址/工作地/老家地址/自定义text(0)、
        教育及工作：毕业院校/学历、公司单位/职业/薪资/待遇/公司性质/人员、
        家庭(最近一级：妻子或丈夫/父母/儿女)、
        我是谁：性格、兴趣爱好(唱歌/书法/……)、座右铭、故事、
        其它(聊友、自定义)

##⊙族谱图
#创建族谱
创建
预览族谱、数据统计、族人管理、编辑、重新生成打印、移动、扫码手机查看

##扩展：取名字、算命（看手相、八字精批）、丧葬流程、模拟祭奠、地域特色、方言、


###⊙数据库： InnoDB
1、二叉树递归
    http://m.blog.csdn.net/article/details?id=9832665
    继父继母
2、一张表
    id——每个人的id
    fid——如果有值 就是父亲的id
    hid——如果有值 就是丈夫的id
    wid——如果有值 就是妻子的id
    其他字段：姓名 性别 出生日期 等等

##数据字典
族谱表： s_genealogy_base
    名称、姓氏、起始代数、地区、简介 || 始祖姓名、始祖生辰、原籍地址、房系、卷号、修谱时间 || 族谱联系人（可多个）、电话、编修人、查看权限（私密、族谱卡可见、打赏可见、公开）
        打赏可见：打赏最低金额、时效、是否审核
    id,title,surname,first_generation,district,brief
    ,ancestor_name,ancestor_birthday,home_address,house_sys,reel_number,fix_time
    ,contact,tel,editor,gobal_buyer, 

成员基本表： s_member
成员副表： s_member_info

