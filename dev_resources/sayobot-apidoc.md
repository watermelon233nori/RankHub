**简要描述：** 

- 返回一个谱面列表数组
- GET方式 键1键2都可使用,只用一个即可，可混用
- POST方式 cmd=beatmaplist

**请求URL：** 
- GET ` https://api.sayobot.cn/beatmaplist `
- POST ` https://api.sayobot.cn/?post`
  
**请求方式：**
- GET 
- POST 

**参数：** 

|参数名|键1|键2|类型|默认值|描述|备注
|:----    |:---|:-----: |:-----:|:---|:---|----- |
|limit |0 |L |int |25 |本次请求返回的谱面数量 | / |
|offset |1 |O |int |0 |起始点，从该点继续获取数据  | / |
|type |2 |T |int(GET/POST)<br/>string(POST) |1(GET/POST)<br/>hot(POST) | 分类:<br/>1 = hot<br/>2 = new<br/>3 = packs<br/>4 = search  | / |
|keyword |3|K  |string | / |  搜索的关键字 | 可以是title、tag、艺术家、作图者、难度名、标签、来源 |
|subType |4 |S |int |0xffffffff | 精确匹配：<br/>1 = title/titleU<br/>2 = artist/artistU<br/>4 = creator<br/>8 = version<br/>16 = tags<br/>32 = source  | 匹配多个的时候直接加起来获得最终数值,如：<br/>仅搜索标题 1=1，<br/>搜索标题和艺术家 1 + 2 = 3<br/>搜索tags和难度名 16+8=24 |
|mode |5 |M |int |0xffffffff |mode 匹配：<br/>1 = std<br/>2 = taiko<br/>4 = ctb<br/>8 = mania | 同上 |
|class |6 |C  |int |0xffffffff |铺面状态：<br/>1 = Ranked & Approved<br/>2 = Qualified<br/>4 =  Loved<br/>8 = Pending & WIP<br/>16 = Graveyard  | 同上 |
|genre |7 |G  |int |0xffffffff |风格：<br/>1 = any<br/>2 = 尚未指定<br/>4 =  电子游戏<br/>8 = 动漫<br/>16 = 摇滚<br/>32 = 流行乐<br/>64 = 其他<br/>128 = 新奇<br/>256 = 嘻哈<br/>512 = 没有512<br/>1024 = 电子  | 同上 |
|language |8 |E |int |0xffffffff |语言：<br/>1 = any(未分类)<br/>2 = 其他<br/>4 = 英语<br/>8 = 日语<br/>16 = 中文<br/>32 = 器乐<br/>64 = 韩语<br/>128 = 法语<br/>256 = 德语<br/>512 = 瑞典语<br/>1024 = 西班牙语<br/>2048 = 意大利语<br/>4096 = /  | 同上 |
|other(GET only) |9 |R  |string |/ |star:0~10,AR:0~10,OD:0~10,CS:0~10,HP:0~10,length:0~999,BPM:0~9999,end| 注意！！必须按照这个格式请求，不能缺省，符号为半角 |
|stars(POST only)| | | float Array | [0,1000.0] | 难度范围 | 左小右大，因为float精度原因建议适当放宽0.1以提高匹配成功率 |
|ar(POST only)| | | float Array | [0,1000.0] | 难度范围 | 左小右大，因为float精度原因建议适当放宽0.1以提高匹配成功率 |
|od(POST only)| | | float Array | [0,1000.0] | 难度范围 | 左小右大，因为float精度原因建议适当放宽0.1以提高匹配成功率 |
|cs(POST only)| | | float Array | [0,1000.0] | 难度范围 | 左小右大，因为float精度原因建议适当放宽0.1以提高匹配成功率 |
|hp(POST only)| | | float Array | [0,1000.0] | 难度范围 | 左小右大，因为float精度原因建议适当放宽0.1以提高匹配成功率 |
|length(POST only)| | | float Array | [0,1000.0] | 难度范围 | 左小右大，因为float精度原因建议适当放宽0.1以提高匹配成功率 |
|bpm(POST only)| | | float Array | [0,1000.0] | 难度范围 | 左小右大，因为float精度原因建议适当放宽0.1以提高匹配成功率 |

**请求示例**
- GET
- 获取热门20张图 ` https://api.sayobot.cn/beatmaplist?L=20&O=0&T=1 ` or ` https://api.sayobot.cn/beatmaplist?0=20&1=0&2=1 `
- POST
- 获取热门20张图 
```
{
"cmd": "beatmaplist",
"type": "hot",
"limit": 20
}
```
- 搜索歌手kano并筛选难度
```
{
"cmd": "beatmaplist",
"type": "search",
"limit": 20,
"keyword": "kano",
"class": 7,
"mode": 1,
"subtype": 2,
"stars": [4.0, 7.0]
}
```


**返回示例**

``` 
{
  "data": [
    {
      "approved": 3,
      "artist": "Soken Masayoshi",
      "artistU": "",
      "creator": "kanor",
      "favourite_count": 3,
      "lastupdate": 1582859628,
      "modes": 1,
      "order": 10,
      "play_count": 180,
      "sid": 1097108,
      "title": "Sunrise",
      "titleU": ""
    },
    {
      "approved": 1,
      "artist": "Kami-sama, I have noticed",
      "artistU": "",
      "creator": "Ryuusei Aika",
      "favourite_count": 62,
      "lastupdate": 1579421827,
      "modes": 1,
      "order": 0,
      "play_count": 101574,
      "sid": 1094943,
      "title": "Namae no Nai Ao (TV Size)",
      "titleU": ""
    }
  ],
  "endid": 25,
  "match_artist_results": 1813,
  "match_creator_results": 394,
  "match_tags_results": 1535,
  "match_title_results": 264,
  "match_version_results": 239,
  "results": 3857,
  "status": 0,
  "time_cost": 218
}

```



 **返回参数说明** 

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|endid |number   |下次请求的起始点（offset）。0=请求完毕 |
|time_cost | number  | 搜索耗时（ms） |
| results | number  | 该关键词匹配的结果总数, match 字段都仅在offset=0的时候出现 |
| match_title_results | number  | 匹配到的标题总数 |
| match_artist_results | number  | 匹配到的作者总数 |
| match_creator_results | number  | 匹配到的创作者总数 |
| match_version_results | number  | 匹配到的难度总数 |
| match_tags_results | number  | 匹配到的标签总数 |
| sid | number  | 铺面集合唯一 id |
| modes | number  |模式：<br />1 = osu<br />2 = taiko<br />4 = ctb<br />8 = mania|
| approved | number  | Rank 状态：<br />-2 = graveyard<br />-1 = WIP<br />0 = pending<br />1 = ranked<br />2 = approved<br />3 = qualified<br />4 = loved |
|lastupdate | date  | 最后更新日期 |
|title | number  |标题 |
|titleU | number  | 标题 Unicode |
|artist | number  | 艺术家 |
|artistU | number  | 艺术家 Unicode |
|creator | number  | 作图者 |
|favourite_count | number  | 被收藏的次数 |
|order | number  | 排序标识(热度？) |
|play_count | number  | 被玩的次数 |



