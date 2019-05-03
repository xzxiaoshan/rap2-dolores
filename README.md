# rap2-dolores

阿里rap2-dolores

### 一、启动docker

**环境变量说明：**

SERVE_URL 服务端rap2-delos的地址

**启动docker命令**
```
docker run -itd --name xzxioashan-rap2-dolores -e TZ='Asia/Shanghai' -e SERVE_URL='http://192.168.20.50:8083' -p 8084:8081 xzxiaoshan/rap2-dolores:latest 
```

### 二、确认是否启动成功

查看docker启动日志
```
docker logs xzxioashan-rap2-dolores
```
输出如下内容，证明成功！
```
   ┌────────────────────────────────────────────────┐
   │                                                │
   │   Serving!                                     │
   │                                                │
   │   - Local:            http://localhost:8081    │
   │   - On Your Network:  http://172.17.0.4:8081   │
   │                                                │
   └────────────────────────────────────────────────┘
```
在确保服务端rap2-delos已经成功启动的情况下，浏览器访问 http://192.168.20.50:8084 可看到结果。

（结束）




