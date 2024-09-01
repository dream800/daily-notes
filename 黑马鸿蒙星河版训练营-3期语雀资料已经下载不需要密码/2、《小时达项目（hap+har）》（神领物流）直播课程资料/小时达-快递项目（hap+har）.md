# 版权所有，盗版必究
- 小时达司机端设计图：[https://codesign.qq.com/s/P4VlZMyVoRZq6wL/ALwE9V4JwNRZX1D/inspect](https://codesign.qq.com/s/P4VlZMyVoRZq6wL/ALwE9V4JwNRZX1D/inspect)
- 小时达接口地址：[https://apifox.com/apidoc/shared-4b036830-59b1-4526-b00a-61df2b3d4ae1](https://apifox.com/apidoc/shared-4b036830-59b1-4526-b00a-61df2b3d4ae1)
- 小时达司机端账号注册地址: [https://fe-slwl-manager.itheima.net/#/driver-register](https://fe-slwl-manager.itheima.net/#/driver-register)
- 上课代码仓库地址- [https://gitee.com/luckybo0027/xsd.git](https://gitee.com/luckybo0027/xsd.git)
- 完整代码仓库-[https://gitee.com/shuiruohanyu/quick-delivery](https://gitee.com/shuiruohanyu/quick-delivery)
# 分层架构逻辑模型
> HarmonyOS应用的分层架构主要包括三个层次：产品定制层products、基础特性层features和公共能力层commons，为开发者构建了一个清晰、高效、可扩展的设计架构。

- 不同设备意味着不同的入口 。products是个入口 可能 包含手机 + 平板 + 2in1 + 手表 + Car

  三层: 三个大的文件夹.  UI界面适配的。可复用的业务逻辑、组合各个模块
> - **产品定制层**产品定制层专注于满足不同设备或使用场景（如应用）的个性化需求，包括UI设计、资源和配置，以及针对特定场景的交互逻辑和功能特性。产品定制层的功能模块独立运作，同时依赖基础特性层和公共能力层来实现具体功能。作为应用的入口，产品定制层是用户直接互动的界面。为满足特定产品需求，产品定制层可灵活地调整和扩展，从而满足各种使用场景。
> - **基础特性层**基础特性层位于公共能力层之上，用于存放基础特性集合，例如相对独立的功能UI和业务逻辑实现。该层的每个功能模块都具有高内聚、低耦合、可定制的特点，以支持产品的灵活部署。基础特性层为上层的产品定制层提供稳健且丰富的基础功能支持，包括UI组件、基础服务等。同时依赖于下层的公共能力层为其提供通用功能和服务。为了增强系统的可扩展性和维护性，基础特性层将功能进行模块化处理。例如，一个应用的底部导航栏中的每个选项都可能是一个独立的业务模块。
> - **公共能力层**公共功能层用于存放公共基础能力，集中了例如公共UI组件、数据管理、外部交互以及工具库等的共享功能。应用可以共享和调用这些公共能力。公共能力层为上层的基础特性层和产品定制层提供稳定可靠的功能支持，确保整个应用的稳定性和可维护性。公共能力层包括但不限于以下组成：
>    - 公共UI组件：这些组件被设计成通用且高度可复用的，确保在不同的应用程序模块间保持一致的用户体验。公共UI组件提供了标准化且友好的界面，帮助开发者快速实现常见的用户交互需求，例如提示、警告、加载状态显示等，从而提高开发效率和用户满意度。
>    - 数据管理：负责应用程序中数据的存储和访问，包括应用数据、系统数据等，提供了统一的数据管理接口，简化数据的读写操作。通过集中式的数据管理方式不仅使得数据的维护更为简单，而且能够保证数据的一致性和安全性。
>    - 外部交互：负责应用程序与外部系统的交互，包括网络请求、文件I/O、设备I/O等，提供统一的外部交互接口，简化应用程序与外部系统的交互。开发者可以更为方便地实现应用程序的网络通信、数据存储和硬件接入等功能，从而加速开发流程并保证程序的稳定性和性能。
>    - 工具库：提供一系列常用工具函数和类，例如字符串处理、日期时间处理、加密解密、数据压缩解压等，帮助开发者提高效率和代码质量。

Hap-entry
Hsp-共享包
Har包-静态共享包
## 开发模型
**图2 **分层架构开发模型
![](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712819738244-07a73c79-1eb9-4bf4-b4c5-d380adfb5a31.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_63%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f8fcf7&clientId=u81ac0f1b-b02e-4&from=paste&id=fHDqY&originHeight=1321&originWidth=2220&originalType=url&ratio=1&rotation=0&showTitle=false&status=done&style=none&taskId=ue435678c-c351-4ccd-ae67-064f658ba23&title=)

- **产品定制层**产品定制层的各个子目录会被编译成一个[Entry类型的HAP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/application-package-structure-stage-0000001774279566)，作为应用的主入口。该层主要针对跨多种设备，为各种设备形态集成相应的功能和特性。产品定制层被划分为多个功能模块，每个功能模块都针对特定的设备或使用场景设计，并根据具体的产品需求进行功能及交互的定制开发。**说明**
   - 在产品定制层，开发者可以从不同设备对应应用的UX设计和功能两个维度，结合具体的业务场景，选择一次编译生成[相同或者不同的HAP（或其组合）](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/introduction-0000001821000377#ZH-CN_TOPIC_0000001821000377__%E9%83%A8%E7%BD%B2%E6%A8%A1%E5%9E%8B)。
   - 通过使用[定制多目标构建产物](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-customized-multi-targets-and-products-guides-0000001731595144)的定制功能，可以将应用所对应的HAP编译成各自的.app文件，用于上架到应用市场。
- **基础特性层**在基础特性层中，功能模块根据部署需求被分为两类。对于需要通过Ability承载的功能，可以设计为[Feature类型的HAP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hap-package-0000001820879541)，而对于不需要通过Ability承载的功能，根据是否需要实现按需加载，可以选择设计为[HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/har-package-0000001774279570)模块或者[HSP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/in-app-hsp-0000001774119898)模块，编译后对应HAR包或者HSP包。
- **公共能力层**公共能力层的各子目录将被编译成HAR包，而他们只能被产品定制层和基础特性层所依赖，不允许存在反向依赖。该层旨在提取模块化公共基础能力，为上层提供标准接口和协议，从而提高整体的复用率和开发效率。
## 部署模型
**图3 **分层架构部署模型（不同设备的定制）
![](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712819738343-17547882-3dda-4222-9793-33b97cb80af1.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_37%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fef1d2&clientId=u81ac0f1b-b02e-4&from=paste&id=WE41h&originHeight=223&originWidth=1306&originalType=url&ratio=1&rotation=0&showTitle=false&status=done&style=none&taskId=udf6b6eb7-03d7-4799-9ed4-40d8bfcf306&title=)
应用程序（.app文件）在流水线或应用市场上被解包为n * Entry类型的HAP + n * Feature类型的HAP，根据设备类型和使用场景将应用部署到不同类型的设备上，实现多端的统一用户体验。
**说明**
当Entry类型的HAP和Feature类型的HAP被分发并部署到相应的设备时，他们所依赖的HSP也会一同被分发并部署到相应的设备上。
在部署模型中，每个Entry类型的HAP代表了应用的入口点，而Feature类型的HAP则包含了应用的特定功能模块。允许应用能够以模块化的方式适配和部署，从而满足不同设备和场景的需求。
该部署模型不仅优化了应用的组织结构，也为保持应用在各种设备和场景中的一致性提供了支持。通过按照设备类型和使用场景来区分和部署不同的HAP，能确保无论在何种设备或场景中，用户都能获得统一且高质量


![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712916817588-4a9a8acc-3304-4ab5-9998-4b48e128a72b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_33%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f7f6&clientId=u8a4ef82d-46a6-4&from=paste&height=747&id=NGC4i&originHeight=747&originWidth=1142&originalType=binary&ratio=1&rotation=0&showTitle=false&size=85896&status=done&style=none&taskId=u6f79fcb7-2301-4577-aec9-b2e5b79eeca&title=&width=1142)
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712916416182-07dc1510-8dc3-4407-a57c-4678af9b21ff.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_28%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f6f6f6&clientId=u8a4ef82d-46a6-4&from=paste&height=668&id=p1TuZ&originHeight=668&originWidth=990&originalType=binary&ratio=1&rotation=0&showTitle=false&size=131010&status=done&style=none&taskId=u2a6b9632-e757-4c0b-b575-4b87aced557&title=&width=990)


![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712916457631-c7cfea26-99d9-490d-bff0-50142f1262d9.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_29%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f8f8f8&clientId=u8a4ef82d-46a6-4&from=paste&height=467&id=FcXa3&originHeight=467&originWidth=1004&originalType=binary&ratio=1&rotation=0&showTitle=false&size=69000&status=done&style=none&taskId=u6750d21e-022c-4d8e-b547-9f5b500c341&title=&width=1004)
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712916491742-14673c07-0963-4be9-ba01-b73a39953b7d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_28%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e0e9e0&clientId=u8a4ef82d-46a6-4&from=paste&height=215&id=x3c2l&originHeight=215&originWidth=992&originalType=binary&ratio=1&rotation=0&showTitle=false&size=46427&status=done&style=none&taskId=u4211f16e-69e9-42e3-8ea7-da9d07e8921&title=&width=992)
## 单层项目架构
```
ets
├── common                      // 通用模块
│   ├── builders                // - 通用组件 @Builder
│   ├── components              // - 通用组件 @Component
│   ├── constants               // - 常量数据
│   ├── images                  // - 图片资源
│   └── utils                   // - 工具类
├── entryability                // 入口UIAbility
│   └── EntryAbility.ts
├── models                      // - 数据模型
├── pages                       // - 页面组件
│   ├── HomePage.ets 
│   └── Index.ets
└── views                       // - 页面对应自定义组件
    ├── HomePage 
    └── Index
```

> 三层项目架构代码实例
> [优秀实践-HMOS世界（ArkTS）.zip](https://www.yuque.com/attachments/yuque/0/2024/zip/38936526/1718508993787-fe8b6159-44db-4545-b6ae-070358631e40.zip?_lake_card=%7B%22src%22%3A%22https%3A%2F%2Fwww.yuque.com%2Fattachments%2Fyuque%2F0%2F2024%2Fzip%2F38936526%2F1718508993787-fe8b6159-44db-4545-b6ae-070358631e40.zip%22%2C%22name%22%3A%22%E4%BC%98%E7%A7%80%E5%AE%9E%E8%B7%B5-HMOS%E4%B8%96%E7%95%8C%EF%BC%88ArkTS%EF%BC%89.zip%22%2C%22size%22%3A175868101%2C%22ext%22%3A%22zip%22%2C%22source%22%3A%22%22%2C%22status%22%3A%22done%22%2C%22download%22%3Atrue%2C%22taskId%22%3A%22u797eb11c-07b5-4385-8168-f9361cc2609%22%2C%22taskType%22%3A%22transfer%22%2C%22type%22%3A%22application%2Fzip%22%2C%22mode%22%3A%22title%22%2C%22id%22%3A%22d8qSF%22%2C%22card%22%3A%22file%22%7D)

## 三层架构
```typescript
project-root
├── commons                     // 基础层（通用组件、工具类、资源）
│   └── basic                   // - 通用模块
├── features                    // 需求层（业务组件）
│   ├── home                    // - 需求模块
│   └── mine                    // - 需求模块
└── products                    // 入口层（页面）
    └── phone                   // - 设备模块

```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712851954181-82a3676e-25ad-423d-b907-777dbfdd9dec.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e2e3ec&clientId=u496588dc-ed58-4&from=paste&height=518&id=CrYWz&originHeight=518&originWidth=516&originalType=binary&ratio=1&rotation=0&showTitle=false&size=165346&status=done&style=none&taskId=ua8d80816-6a1c-4a1e-a9e7-8da39758111&title=&width=516)
# 创建项目-使用git管理
使用DevEcoSudio创建一个空项目
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712931930180-5ea980c2-3f54-4b7e-ab8d-e91ebf4cb6fc.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_57%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%233e4043&clientId=ub61e62fd-1414-4&from=paste&height=1326&id=mkobs&originHeight=1326&originWidth=1992&originalType=binary&ratio=1&rotation=0&showTitle=false&size=117518&status=done&style=none&taskId=u520b3f85-11ac-46b1-ae73-87816183e5e&title=&width=1992)
直接finish
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701412088201-dd122443-78d7-48a1-bd78-b7dbff2c32c5.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_43%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23457451&clientId=u5dc4dc7c-f3e3-4&from=paste&height=398&id=scOEw&originHeight=944&originWidth=1512&originalType=binary&ratio=2&rotation=0&showTitle=false&size=183332&status=done&style=none&taskId=ub28aacfa-e709-4f04-92cb-17c8ede825d&title=&width=638)

- 建立码云远程仓库

   ![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701412164042-44902585-63b7-4720-9b08-363a6e0d6f8d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_27%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fefdfc&clientId=u5dc4dc7c-f3e3-4&from=paste&height=325&id=jW9Ll&originHeight=649&originWidth=947&originalType=binary&ratio=2&rotation=0&showTitle=false&size=62354&status=done&style=none&taskId=u9c2b58fd-9cb5-421d-81a3-ab19e4d69be&title=&width=473.5)

- 拷贝远程仓库链接 

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701412378176-8d4f1696-ea96-4069-8407-98ce6d354cb4.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fdfcfc&clientId=u5dc4dc7c-f3e3-4&from=paste&height=200&id=VhlYc&originHeight=296&originWidth=836&originalType=binary&ratio=2&rotation=0&showTitle=false&size=55751&status=done&style=none&taskId=ub7649a0d-e4a3-4cc0-bae5-d63b2a07d8c&title=&width=565)

- 找到创建项目的目录下初始化仓库 并添加远程仓库 推送
```bash
$ git init 
$ git add .
$ git commit -m "初始化神领物流项目"
$ git remote add origin <远程仓库地址>
$ git push -u origin master
```

# 创建一个静态har包， 导入素材和资源
> 本次项目采用单层架构 + har公共包的模式进行开发

- 新建一个common目录,  在该目录下新建一个静态模块`Static Library`

![image.png](https://cdn.nlark.com/yuque/0/2024/png/38936526/1718522194966-806d4640-2abe-4636-a259-99c63de274c3.png#averageHue=%233e4145&clientId=ue8b47e99-45be-4&from=paste&height=651&id=IaILf&originHeight=1302&originWidth=1932&originalType=binary&ratio=2&rotation=0&showTitle=false&size=127951&status=done&style=none&taskId=u3480194e-6e2b-46d5-b25f-4df3fa57564&title=&width=966)
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932009554-0adb7ce6-ba5a-4c5e-acb6-c4b682c72429.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_57%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%233d4042&clientId=ub61e62fd-1414-4&from=paste&height=1326&id=xDzvh&originHeight=1326&originWidth=1992&originalType=binary&ratio=1&rotation=0&showTitle=false&size=68191&status=done&style=none&taskId=u5d031460-d92a-4801-8647-c62c47d2752&title=&width=1992)
[media.zip](https://www.yuque.com/attachments/yuque/0/2024/zip/38936526/1718508993833-e464e189-c309-4dd6-8753-b850c2eeda09.zip?_lake_card=%7B%22src%22%3A%22https%3A%2F%2Fwww.yuque.com%2Fattachments%2Fyuque%2F0%2F2024%2Fzip%2F38936526%2F1718508993833-e464e189-c309-4dd6-8753-b850c2eeda09.zip%22%2C%22name%22%3A%22media.zip%22%2C%22size%22%3A455136%2C%22ext%22%3A%22zip%22%2C%22source%22%3A%22%22%2C%22status%22%3A%22done%22%2C%22download%22%3Atrue%2C%22taskId%22%3A%22u67bfad0a-da0b-475f-8de1-66b7c1476c8%22%2C%22taskType%22%3A%22transfer%22%2C%22type%22%3A%22application%2Fzip%22%2C%22mode%22%3A%22title%22%2C%22id%22%3A%22thLZt%22%2C%22card%22%3A%22file%22%7D)

1. 下载该media文件夹，将所有的图标素材拖动到静态资源包下的 src/main/resources/base/media下

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932074837-27ea1c68-1b8d-4b9b-a2c9-a9bd9ffc87fc.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_47%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%236f8675&clientId=ub61e62fd-1414-4&from=paste&height=1590&id=mJg3D&originHeight=1590&originWidth=1652&originalType=binary&ratio=1&rotation=0&showTitle=false&size=256849&status=done&style=none&taskId=u55c1bf72-046e-4ca4-bc26-683083c1008&title=&width=1652)

- 导入色值
```json
{
  "color": [
    {
      "name": "start_window_background",
      "value": "#FFFFFF"
    },
    {
      "name": "primary",
      "value": "#FE6A3D"
    },
    {
      "name": "primary_disabled",
      "value": "#FADCD9"
    },
    {
      "name": "success",
      "value": "#27BA9B"
    },
    {
      "name": "warning",
      "value": "#FFAB2E"
    },
    {
      "name": "danger",
      "value": "#FF4C4C"
    },
    {
      "name": "text_primary",
      "value": "#2A2929"
    },
    {
      "name": "text_secondary",
      "value": "#818181"
    },
    {
      "name": "text_placeholder",
      "value": "#C2C1C1"
    },
    {
      "name": "border",
      "value": "#D9D9D9"
    },
    {
      "name": "background_divider",
      "value": "#EEEEEE"
    },
    {
      "name": "background_page",
      "value": "#F4F4F4"
    },
    {
      "name": "black",
      "value": "#000000"
    },
    {
      "name": "white",
      "value": "#FFFFFF"
    },
    {
      "name": "gray_1",
      "value": "#F7F8FA"
    },
    {
      "name": "gray_2",
      "value": "#F2F3F5"
    },
    {
      "name": "gray_3",
      "value": "#EBEDF0"
    },
    {
      "name": "gray_4",
      "value": "#DEDEE0"
    },
    {
      "name": "gray_5",
      "value": "#C8C9CC"
    },
    {
      "name": "gray_6",
      "value": "#969799"
    },
    {
      "name": "gray_7",
      "value": "#646566"
    },
    {
      "name": "gray_8",
      "value": "#323233"
    },
    {
      "name": "btn_plain",
      "value": "#FFE0DD"
    },
    {
      "name": "btn_gray",
      "value": "#E6E6E6"
    },
    {
      "name": "upload_panel",
      "value": "#f2f2f2"
    }
  ]
}
```

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932246554-90c58e17-fb20-435d-9929-d1fab00ad45a.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_69%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%236c7f59&clientId=ub61e62fd-1414-4&from=paste&height=1690&id=AYxC5&originHeight=1690&originWidth=2432&originalType=binary&ratio=1&rotation=0&showTitle=false&size=329575&status=done&style=none&taskId=uf30ce8ca-9411-4453-82f3-f140f03ca46&title=&width=2432)


> 提交代码




# 修改项目名称和图标

- 修改项目名称

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932438538-5df0d9b7-a163-4209-b37a-9f2cd01a966a.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_65%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%235a734b&clientId=ub61e62fd-1414-4&from=paste&height=1136&id=fbqIc&originHeight=1136&originWidth=2290&originalType=binary&ratio=1&rotation=0&showTitle=false&size=178634&status=done&style=none&taskId=u81f1d3d3-a69c-4341-a6be-58548d8b5d4&title=&width=2290)

- 通过生成图标工具创建app图标

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932481323-64f3360d-b443-41fa-a296-df87c12bdf29.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_37%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%233d4042&clientId=ub61e62fd-1414-4&from=paste&height=984&id=SqZTc&originHeight=984&originWidth=1310&originalType=binary&ratio=1&rotation=0&showTitle=false&size=293970&status=done&style=none&taskId=u7eb497f7-fb18-4c10-9ab9-41cc3dcbd03&title=&width=1310)

- 选择图标

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932516317-854c8d47-5b33-4c94-bd8f-0bd79d4de77b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_68%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%233b4554&clientId=ub61e62fd-1414-4&from=paste&height=1270&id=nkONP&originHeight=1270&originWidth=2374&originalType=binary&ratio=1&rotation=0&showTitle=false&size=714459&status=done&style=none&taskId=u2529f12a-03c9-431d-8fa3-b7c270cef02&title=&width=2374)
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932525442-4555ffb9-e9e9-47d2-a91f-a27a33346aeb.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_57%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232bbe40&clientId=ub61e62fd-1414-4&from=paste&height=1326&id=E6sFQ&originHeight=1326&originWidth=1992&originalType=binary&ratio=1&rotation=0&showTitle=false&size=304409&status=done&style=none&taskId=u1d89c345-4d42-4134-b9cb-2b7f990b9fa&title=&width=1992)
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932581811-814aa086-f3e6-46bb-89c8-f05f12ae9b3d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_66%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%2359734d&clientId=ub61e62fd-1414-4&from=paste&height=1194&id=s0zy7&originHeight=1194&originWidth=2310&originalType=binary&ratio=1&rotation=0&showTitle=false&size=193855&status=done&style=none&taskId=u6bbc4de2-5598-4d3b-9721-7cc37cd3c42&title=&width=2310)

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932656045-7dbb16da-2894-4f90-9688-318a1e94e3c0.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_35%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23a0a1a1&clientId=ub61e62fd-1414-4&from=paste&height=508&id=gk0ol&originHeight=508&originWidth=1230&originalType=binary&ratio=1&rotation=0&showTitle=false&size=51995&status=done&style=none&taskId=u33b7eec6-82f0-4f65-b28d-c73b7779d40&title=&width=1230)

> 提交代码

# 公共静态包(HAR)基础目录搭建
> 在har包中建立如下目录

- 按照客户端开发的需要我们要在项目中建立如下结构
```bash
-ets
  -api                   负责存放所有的请求
  -components            负责放置所有的公共组件
  -constants             负责存放所有的常量
  -models                负责存放所有的数据类型结构
  -utils                 负责存放所有的工具
```

- 在项目中添加上述的目录，并统一新建一个index.ets文件

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701425632538-c124b511-36fa-4542-a86e-777fcebe4269.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%233d4143&clientId=ufa936666-d686-4&from=paste&height=191&id=O3Bqg&originHeight=144&originWidth=375&originalType=binary&ratio=2&rotation=0&showTitle=false&size=9818&status=done&style=none&taskId=u0de2c800-1b26-4e3a-9ec0-f8b21b00fe1&title=&width=498.5)

- 清空har包下index.ets文件内容

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712932899480-b21dfdf5-6ae6-418a-851e-029b0690630f.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_81%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23708855&clientId=ub61e62fd-1414-4&from=paste&height=1280&id=x4CpN&originHeight=1280&originWidth=2834&originalType=binary&ratio=1&rotation=0&showTitle=false&size=115672&status=done&style=none&taskId=u223e769d-432d-489f-8d6b-d800e6bfce3&title=&width=2834)
> 提交代码

# 搭建广告展示页Start
> 广告页的思路
>    -华为有广告业务，但是我们不用- ad模块
> 想自定义广告-
>    场景： app启动-有广告需求，就打开广告页，没有的话就去登录或者主页
> 腾讯体育的广告- 启动有广告页，退到后台的情况下，再次进入前台也会有广告

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701415168601-2fdd492a-6f49-4279-b2a0-cc2ec77dfcca.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_14%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e5e1e0&clientId=u5dc4dc7c-f3e3-4&from=paste&height=593&id=ZoS8L&originHeight=662&originWidth=308&originalType=binary&ratio=2&rotation=0&showTitle=false&size=61776&status=done&style=none&taskId=u1cfa127d-1192-4306-9dbd-7a72b8010a3&title=&width=276)

分析- 广告页作为一个app启动的首页，应该是在我们应用启动就进去的。
> - 有的app有的需要广告页，有的不需要，搞个配置呗！！！
> 1. 通过首选项配置存储我们的一些常用配置，比如要不要广告页，还有广告页的路由地址，点击广告页跳转的链接，广告页倒计时的秒数
> 2. 在入口处进行判断是否需要广告页，需要的话，跳转广告页-广告页根据设置的参数进行渲染
> 3. 有的同学可能会问，广告页能不能设置-因为运营人员肯定不能每次都去改我们底层的代码-这里我还可以设置成动态的-就是初始化的时候通过请求去读一下云端的请求，然后把我们的图片和一些参数配置下来，这样每次你启动app就是运营人员给你配置的广告和设置了

- 新建一个关于广告类的数据模型-basic/models/advert.ets
```typescript

export class AdvertClass {
  showAd: boolean = false // 显示广告
  adTime: number = 5 // 广告时长
  adUrl?: string = '' // 广告链接
  adImg?: ResourceStr = '' // 广告图片
}
```

- 在model/index.ets中进行统一导出
```typescript
export * from './advert'
```

- 在utils中新建一个关于读取首选项的类，用来读取和设置首选项的广告设置
```typescript
import { AdvertClass } from '../models'
import preferences from '@ohos.data.preferences'
import { USER_SETTING, USER_SETTING_AD } from '../constants'
// 默认广告选项
export const defaultAd: AdvertClass = {
  showAd: true,
  adTime: 5,
  adImg: $r('app.media.start')
}
export class UserSettingClass {
  context: Context
  constructor(context: Context) {
    this.context = context
  }
  // 获取存储用户信息的首选项仓库
  getStore () {
     return preferences.getPreferencesSync(this.context, USER_SETTING)
  }
  // 设置用户广告设置
  setUserAd (ad: AdvertClass) {
    const adStore = this.getStore()
    adStore.putSync(USER_SETTING_AD, JSON.stringify(ad))
    await adStore.flush()
  }
  // 获取广告配置
  getUserAd (): AdvertClass {
    const  adStore =  this.getStore()
    return  JSON.parse( adStore.getSync(USER_SETTING_AD, JSON.stringify(defaultAd)) as string) as AdvertClass
  }
}
```
> 在上面代码中，我们设计了读取和设置广告的两个方法，并且提供了一个默认广告的设置

- 在utils中统一导出
```typescript
export * from './setting'
```

- 上面还用到了两个常量，我们同样需要在constants目录下定义一个文件专门用来记录-setting
```typescript
export const USER_SETTING = 'fast_driver_setting' // 用来存储用户设置的首选项的key
export const USER_SETTING_AD = 'fast_driver_setting_ad' // 用来存储用户设置广告首选项的key
```

- 同样在constants/index.ets文件中导出
```typescript
export * from './setting'
```

- 在basic/Index.ets统一导出
```typescript
export * from './src/main/ets/models'
export * from './src/main/ets/constants'
export * from './src/main/ets/utils'
```
> **entry模块-oh-package.json5**

- 在ability中引入该har包依赖
```typescript
{
  "name": "entry",
  "version": "1.0.0",
  "description": "Please describe the basic information.",
  "main": "",
  "author": "",
  "license": "",
  "dependencies": {
    "@hm/basic":"file:../common/basic"
  }
}


```

> ability中判断

- 导入包
```typescript
import { AdvertClass, UserSettingClass, defaultAd } from '@hm/basic'

```

- 判断
```typescript
 async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // Main window is created, set main page for this ability
   
    // 通过模拟请求拿到广告信息
    const ad = await new Promise<AdvertClass>((resolve, reject) => {
      setTimeout(() => {
        resolve(defaultAd) // 广告信息
      }, 500) // 0.5后秒请求成功
    })

   
    const setting = new UserSettingClass(this.context) // getContext拿到的是undefined
    setting.setUserAd(ad) // 写入首选项
    // 检查是否有广告
    if(ad.showAd) {
      // 展示广告的情况 展示广告页 有时限
      // 创建一个子窗口 子窗口加载广告 广告播完 窗口销毁
    }
    windowStage.loadContent('pages/Index'); // 正常加载页面
  }
```
> 这里我们模拟了一个请求，给了一个默认广告， 写入首选项-正常加载主页

1. 在pages下新建Start目录，下面新建Start的page页面

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701415313283-135cb96f-b5d3-43de-bf10-e009ac5218af.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_43%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%233d3f42&clientId=u5dc4dc7c-f3e3-4&from=paste&height=327&id=sqX2S&originHeight=654&originWidth=1503&originalType=binary&ratio=2&rotation=0&showTitle=false&size=124009&status=done&style=none&taskId=u5b4ccd8d-2ea2-42a5-94ca-1a36eeb4490&title=&width=751.5)

- 实现Start页的页面结构及倒计时逻辑
```typescript
import { UserSettingClass, AdvertClass } from '@hm/basic'

@Entry
@Component
struct Start {
  userSetting: UserSettingClass = new UserSettingClass(getContext(this))
  @State
  adObj: AdvertClass  = {
    showAd: false,
    adTime: 0
  }
  timer: number = -1
  
  async aboutToAppear() {
    this.adObj = await this.userSetting.getUserAd()
    this.timer = setInterval(() => {
      if(this.adObj.adTime === 0) {
        clearInterval(this.timer)
        return
      }
      this.adObj.adTime--
    }, 1000)
  }
  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image(this.adObj.adImg).objectFit(ImageFit.Cover)
      Text(`${this.adObj.adTime}秒后跳过`)
        .padding({ left: 10, right: 10 })
        .margin({ right: 20, top: 20 })
        .height(30)
        .fontSize(14)
        .borderRadius(15)
        .backgroundColor($r("app.color.background_page"))
        .textAlign(TextAlign.Center)

    }.height('100%').width('100%')
  }
}

```

- 使用子窗口模式加载广告
> 我们可以使用windowStage的createSubWindow来实现在当前页面上创建一个窗口

```typescript
 if (result.showAd) {
      const win = await windowStage.createSubWindow("ad_window")
      await win.showWindow()
          win.setUIContent("pages/Start/Start")
    }
```

- 广告页在广告结束或者点击跳过广告时，关闭广告
> Start/Start页面

```typescript
closeWin () {
    window.findWindow("ad_window").destroyWindow()
}
```

- 完成Start页面代码
```typescript
import { UserSettingClass, AdvertClass } from '@hm/basic'
import { window } from '@kit.ArkUI'

@Entry
@Component
struct Start {
  userSetting: UserSettingClass = new UserSettingClass(getContext(this))
  @State
  adObj: AdvertClass  = {
    showAd: false,
    adTime: 0
  }
  timer: number = -1
  closeWin () {
    window.findWindow("ad_window").destroyWindow()
  }
  async aboutToAppear() {
    this.adObj = await this.userSetting.getUserAd()
    this.timer = setInterval(() => {
      if(this.adObj.adTime === 0) {
        clearInterval(this.timer)
        this.closeWin()
        return
      }
      this.adObj.adTime--
    }, 1000)
  }
  aboutToDisappear(): void {
    clearInterval(this.timer)
  } 
  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image(this.adObj.adImg).objectFit(ImageFit.Cover)
      Text(`${this.adObj.adTime}秒后跳过`)
        .padding({ left: 10, right: 10 })
        .margin({ right: 20, top: 20 })
        .height(30)
        .fontSize(14)
        .borderRadius(15)
        .backgroundColor($r("app.color.background_page"))
        .textAlign(TextAlign.Center)
        .onClick(() => {
          this.closeWin()
        })

    }.height('100%').width('100%')
  }
}

```
> 这里请注意-如果需要使用线上的广告图片，需要开启网络权限

完整代码-EntryAbility
```typescript
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { AdvertClass, UserSettingClass } from '@hm/basic'

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void>  {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    // 这里要尝试去读一下运营的配置-我们现在还没有实现接口，直接模拟一下
    const userSetting = new UserSettingClass(this.context)
    const result = await new Promise<AdvertClass>((resolve, reject) => {
      setTimeout(() => {
        resolve({
          showAd: true,
          adTime: 5,
          adImg: $r("app.media.start")
        } as AdvertClass)
      }, 500)
    })
    await userSetting.setUserAd(result) // 写入首选项
    if (result.showAd) {
      const win = await windowStage.createSubWindow("ad_window")
      await win.showWindow()
      win.setUIContent("pages/Start/Start")
    }
    windowStage.loadContent('pages/Index');
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

```

> 提交代码


# 初始化App检查token
> 由于司机端是必须要求用户登录的，所以我们需要在跳转到主页前检查是否有token，有token的话跳转到主页，没有token的话跳转到登录

> **Entry模块**

1. 新建登录页- pages/Login/Login

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701417640825-69b69b60-1e58-4b7f-98b0-71ba5daa0442.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_27%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%2377822e&clientId=uf7c073ea-2c55-4&from=paste&height=291&id=HKC8H&originHeight=453&originWidth=937&originalType=binary&ratio=2&rotation=0&showTitle=false&size=70073&status=done&style=none&taskId=u4d5252b7-9dbd-49eb-9206-2d7dadd3d9f&title=&width=601.5)

> **Har包basic**

2. 在广告页跳转前检查token，有的话跳转到主页 Index，没有的话跳转到Login
- 声明一个token_key的常量-constants/user.ets
```typescript
export const TOKEN_KEY = 'user_token'
```

- 在constant/index.ts中导出
```typescript
export * from './user'
```
> 这里需要在首选项中在声明两个方法

```typescript
  /** 持久化存token */
  async setToken(token: string) {
    const store = this.getStore()
    store.putSync(TOKEN_KEY, token)
    await store.flush() // flush是异步的
  }

  /** 持久化获取token */
  getToken() {
    const store = this.getStore()
    return store.getSync(TOKEN_KEY, '') as string
  }
```
> **Entry模块**

```typescript
async onWindowStageCreate(windowStage: window.WindowStage): Promise<void>  {
  // Main window is created, set main page for this ability
  hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
 

  // 模拟发请求, 查询广告配置
  const ad = await new Promise<AdvertClass>((resolve) => {
      setTimeout(() => {
        resolve(defaultAd) // artTS进阶  resolve 表示成功的返回值
      }, 500)
  })

  // 存到用户的持久化存储中
  const userSetting = new UserSettingClass(this.context)
  userSetting.setAdvert(ad)

  if(ad.showAd){
  //   创建子窗口
    const win = await windowStage.createSubWindow('ad_window')
    await win.showWindow() // 打开子窗口
    win.setUIContent('pages/Start/Start')  // 显示那个页面的内容做为子窗口的页面
  }

  windowStage.loadContent('pages/Index');

  const token = await userSetting.getUserToken()
    if(token) {
      AppStorage.setOrCreate(TOKEN_KEY, token)
      windowStage.loadContent('pages/Index');
    }else {
      windowStage.loadContent("pages/Login/Login")
    }

}
```

:::info

- 提交代码
:::

# 登录页基本功能实现
> Entry模块：**登录信息属于业务的数据，所以内容留存在当前的entry模块中**

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712934373630-795bc50c-ffeb-43b3-a165-b9881f7c356c.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f4f2f2&clientId=u2767f9ae-cfad-4&from=paste&height=362&id=FJZiB&originHeight=721&originWidth=335&originalType=binary&ratio=1&rotation=0&showTitle=false&size=36515&status=done&style=none&taskId=u97ed98cf-0b75-4685-b5ab-be1398dbe84&title=&width=168)

- 拷贝结构
```typescript
@Entry
@Component
struct Login {

  @State showLoading: boolean = false
  
  @Styles
  loginStyle() {
    .backgroundColor('#fff')
    .border({ color: $r('app.color.background_divider'), width: { bottom: 1 } })
    .width('100%')
    .height(58)
    .borderRadius(0)
  }

  build() {
    Column() {
      // 顶部标题
      Text("小时达").fontColor($r('app.color.text_primary')).fontSize(18).height(25)
      // 账号登录
      Row() {
        Text('账号登录').fontColor($r('app.color.text_primary')).fontSize(24).fontWeight(FontWeight.Bold)
        Row() {
          Text("手机号登录").fontColor($r('app.color.primary')).fontSize(16).fontWeight(FontWeight.Bold)
          Image($r("app.media.ic_angle")).width(10).height(10).margin({ left: 5 })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 50, bottom: 50 })

      // 用户名输入框
      TextInput({ placeholder: '请输入账号' })
        .loginStyle()

      // 密码框
      TextInput({ placeholder: '请输入密码' })
        .loginStyle()
        .type(InputType.Password) // 密码框
        .showPasswordIcon(true) // 显示密码按钮

      // 登录按钮
      Button({ type: ButtonType.Capsule }) {
        Row() {
          if (this.showLoading) {
            LoadingProgress().width(20).height(20).margin({ right: 12 }).color($r('app.color.white'))
          }
          Text('登录').fontColor($r('app.color.white'))
        }
      }
      .backgroundColor($r('app.color.primary_disabled'))
      .width('100%')
      .height(50)
      .margin({ top: 50 })
    }
    .padding({ left: 32, right: 32 })
    .margin({ top: 40 })
  }
}
```

:::info

- 接下来我们来把表单数据进行一下双向绑定-和类型定义
:::

- 首先在models下新建user.ts文件
> 这里我们拷贝接口文档中的interface接口声明-要去除默认自带的

```typescript
export interface LoginFormModel {
    /**
     * 登录账号
     */
    account: string;
    /**
     * 登录密码
     */
    password: string;
}
```

- 然后在models/index.ets中统一导出
```typescript
export * from './user'
```

> 接下来就可以通过 引用models来使用所有模块的类型了

- 在Login页面中导入类型
```typescript


```

- 在Login组件中声明State数据
```typescript
  @State accountForm: LoginFormModel = {
    account: '',
    password: ''
  }
```

- 完成账户和密码的双向绑定
```typescript
 // 用户名输入框
      TextInput({ placeholder: '请输入账号', text: this.accountForm.account })
        .loginStyle().onChange(value => {
          this.accountForm.account = value
      })

    // 密码框
      TextInput({ placeholder: '请输入密码', text: this.accountForm.password })
        .loginStyle()
        .type(InputType.Password) // 密码框
        .showPasswordIcon(true)
        .onChange((value) => {
          this.accountForm.password = value
        }) // 显示密码按钮
```
> 注意： 这里不能使用$$ 因为我们$$只支持单层数据的绑定，出现嵌套的情况还得使用监听方法

- 如果账户名和密码有值，则使按钮可用
```javascript
// 通过校验
  getFormValidate() {
    if (this.accountForm.password && this.accountForm.account) {
      return true
    }
    return false
  }
```

- 条件判断使用何种颜色和点击反馈
```typescript
 // 登录按钮
      Button({ type: ButtonType.Capsule, stateEffect: this.getFormValidate()  }) {
        Row() {
          if (this.showLoading) {
            // 显示进度条再显示
            LoadingProgress()
              .width(20)
              .height(20)
              .margin({ right: 12 })
              .color($r('app.color.white'))
          }
          Text('登录').fontColor($r('app.color.white'))
        }
      }
      .backgroundColor(this.getFormValidate() ? $r('app.color.primary') : $r('app.color.primary_disabled'))
      .width('100%')
      .height(50)
      .margin({ top: 50 }).enabled(this.getFormValidate())
```

> 提交代码

# 封装统一请求工具request

- 申请基础网络权限-在module.json5中配置
```json
 "requestPermissions": [
      {
        "name": "ohos.permission.INTERNET",
      }
    ]
```
> **Basic模块**

- 在constants/index.ets中设置baseURL基础地址常量
```typescript
/** 请求基础地址 */
export const BASE_URL = 'https://slwl-api.itheima.net'  
```

- 封装泛型工具-models/index.ets
> 工具的目的- 让返回的结构完成统一

```typescript
export interface ResponseData<T> {
  code: number
  msg: string
  data: T
}
```
 

- 封装一个公共的request方法来支持get/post/put/delete方法

[http官网链接](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-http-0000001478061929-V3#ZH-CN_TOPIC_0000001523968386__httpcreatehttp)
```typescript
import http from '@ohos.net.http'
import { UserSettingClass } from '.'
import { BASE_URL, TOKEN_KEY } from '../constants'
import { promptAction, router } from '@kit.ArkUI'
import { ResponseData } from '../models'

// 任何对象都可以as object
export async function requestHttp<T>(url: string, method: http.RequestMethod = http.RequestMethod.GET,
  data?: object) {
  const req = http.createHttp()
  let urlStr = BASE_URL + url  // 拼接url

  // 处理get请求的参数
  if (method === http.RequestMethod.GET) {
    if (data) {
      const xxx = Object.keys(data).map(key => `${key}=${data[key]}`).join('&')
      urlStr += `?${xxx}` // get请求时拼接参数到查询参数上  ?a=1&b=2&c=3
    }
  }

  // 组装参数
  let config: http.HttpRequestOptions = {
    method: method,
    extraData: method !== http.RequestMethod.GET ? data : '', // 非get请求不传data
    header: {
      ContentType: 'application/json',
      Authorization: AppStorage.get(TOKEN_KEY) || '',
    },
    readTimeout: 10000, // 如果多少秒没响应就断开 
    expectDataType: http.HttpDataType.OBJECT // 自动将res.result转换为对象
  }

  try {
    const res = await req.request(urlStr, config)
    if (res.responseCode === 401) {
      promptAction.showToast({ message: '登录失效' })
      // 删除token - 删两个地址 首选项- 全局状态
      new UserSettingClass(getContext()).setToken("") // 清空首选项token
      AppStorage.set(TOKEN_KEY, "") // 只能设置 不能删除
      router.replaceUrl({
        url: 'pages/Login/Login' // 跳转到登录页
      })
      return Promise.reject(new Error("登录失效"))
    }

    if (res.responseCode === 404) {
      promptAction.showToast({ message: '请求地址错误' })
      return Promise.reject(new Error("请求地址错误"))
    }

    const result = res.result as ResponseData<T>
   if (result.code === 200) {
      return result.data
    } else {
      promptAction.showToast({ message: "接口请求错误" }) //  res.msg没处理好 有可能出来一堆服务器语言
      console.error(' 接口请求错误-----> ', JSON.stringify(result))
      return Promise.reject(JSON.stringify(result)) // 业务错误 请求终止
    }

  } catch (err) {
    console.error('err -----> ', err)
    return Promise.reject(err)
  }

}


export class Request {
  static get<T =null>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url, http.RequestMethod.GET, data)
  }

  static post<T = null>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url, http.RequestMethod.POST, data)
  }

  static delete<T = null>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url, http.RequestMethod.DELETE, data)
  }

  static put<T =null>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url, http.RequestMethod.PUT, data)
  }
}

```

- 在utils中导出
```typescript
export * from './request'
```
:::info
总结： 上面请求工具总共处理了这么几件事

- 封装请求-拼接基础地址-传入参数
- 解构返回的数据-判断状态
- 200 认为成功直接返回data数据
- 200以外 401 认为是token超时
- 500认为是服务器任务
- 最后暴露一个类的四个静态方法 可以方便的调用 get/put/delete/post
- 提交代码
:::
# 封装请求登录的api
> **Entry模块**

- 在api下新建user.ets， 并在index.ets导出
```typescript
import { Request } from '@hm/basic'
import { LoginFormModel } from '../models'

export function loginAPI(data: LoginFormModel) {
  return Request.post<string>('/driver/login/account', data)
}
```

- index.ets中导出
```typescript
export * from './user'
```

:::info
封装api是为后续更灵活的使用

-  Request.post<string>这里面的string相当于传入的泛型数据，指代返回的data是个string
- 提交代码
:::
# 登录存储token跳转主页

- 首先大家先通过这个网址

[神领TMS管理系统](https://fe-slwl-manager.itheima.net/#/driver-register)
> - 去注册一个属于自己的账号
> - 在登录页引入登录api-存入token-跳转主页

- 导入api
```typescript
import router from '@ohos.router'
import { login } from '../../api'
import { TOKEN_KEY, UserSetting } from '@hm/basic'
```
```typescript
 // 调用登录接口
  async login() {
    this.showLoading = true
    const token = await login(this.accountForm)
    AppStorage.setOrCreate(TOKEN_KEY, token) // 写入全局状态
    new UserSettingClass(getContext(this)).setUserToken(token) // 存入首选项
    this.showLoading = false
    router.replaceUrl({
      url: 'pages/Index'
    })  
  }
```

- 注册事件位置
```typescript
Button("登录")...
  .onClick(() => {
         this.login()
     })
```

- 当我们使用键盘回车之后，账号和密码也可以直接提交
```typescript
TextInput()
  ...
.onSubmit(() => {
        if(this.getFormValidate()) {
          this.login()
        }
      })
```
:::info
总结

- 登录需要自己去网站上注册账号-移动端暂时没有注册接口
- 请求的时候需要准确的准备返回的响应体
- 登录成功之后-存入token- 跳转页面
- 这里登录失败为啥没处理，因为在请求模块的位置，我们判断了200，只要是200 我们就终止了请求，不会再往下走啦
- 最后不要忘记提交代码
:::

# 布局首页结构
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1712936350358-ee4bc2e5-8d09-4276-8ada-a67a23655995.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f5f5f5&clientId=u143c6d30-24d7-4&from=paste&height=360&id=mKg5V&originHeight=717&originWidth=339&originalType=binary&ratio=1&rotation=0&showTitle=false&size=29869&status=done&style=none&taskId=u08f53d4d-cdc6-4029-b7e1-ecb60c011fd&title=&width=170)
> **basic模块**

```typescript
/** 首页Tab类型 */
export interface TabClass {
  title: string
  name: string
  icon?: ResourceStr
}
```
> **entry模块**

:::info

- 上图得知，首页底部分为三个区域，任务，消息，我的
- 任务里面有 待提货，在途， 已完成
:::

- 底部为第一级别，上部分内容为第二级别，我们先完成第一级别
> 首先把我们的首页设置成Index/Index，改成目录结构的嵌套
> - 另外需要调整原来路由跳转的地方- Login/EntrtAbility

采用Tabs组件就可以轻松实现
```typescript
import { TabClass } from '@hm/basic'

@Entry
@Component
struct Index {
  @State
  currentIndex: number = 0 // 当前激活项
  @State tabsData: TabClass[] = [{
    title: '任务',
    name: 'task',
    icon: $r("app.media.ic_tab_btn_task")
  },{
    title: '消息',
    name: 'message',
    icon: $r("app.media.ic_tab_btn_mess_nor")
  },{
    title: '我的',
    name: 'my',
    icon: $r("app.media.ic_tab_btn_mine_nor")
  }]

  @Builder
  getTabBar(item: TabClass) {
    Column() {
      Image(item.icon).width(22).height(22)
        .fillColor(item.name === this.tabsData[this.currentIndex].name ?
        $r('app.color.primary') : $r('app.color.text_secondary'))
      Text(item.title)
        .fontSize(12)
        .fontWeight(400)
        .margin({ top: 5 })
        .fontColor(item.name === this.tabsData[this.currentIndex].name ?
        $r('app.color.primary') : $r('app.color.text_secondary'))
    }.alignItems(HorizontalAlign.Center)
  }
  build() {
    Tabs({ barPosition: BarPosition.End, index: $$this.currentIndex }){
      ForEach(this.tabsData, (item: TabClass) => {
        TabContent(){
          if(item.name === 'task') {
            Text("任务组件")
          }
          else if(item.name === 'message') {
            Text("消息组件")
          }
          else {
            Text("我的组件")
          }
        }.tabBar(this.getTabBar(item))
      })
    }
  }
}
```
> 提交代码


# 我的-组件基本布局
> **Entry模块**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703664064423-3fabb273-9ad0-4689-aef3-69097a288437.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_14%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f4cac6&clientId=u32fbbb44-eeb4-4&from=paste&height=348&id=xkbGF&originHeight=694&originWidth=309&originalType=binary&ratio=1&rotation=0&showTitle=false&size=51880&status=done&style=none&taskId=udbc743c4-ab4a-4d06-addc-0ff81bc794d&title=&width=155)
> - **页面也可以被当成组件来使用- 既可以被引用-也可以被跳转**
> - **组件不能当成页面来使用**


:::info
注意：
     我的是组件而不是页面，因为它属于Tabs中的子组件，所以我们在pages/Index 目录下新建一个My文件夹
里面新建一个My.ets(组件可以是Page,也可以不是，但是如果是Page的话，需要进行导出)
:::

- 新建pages/Index/My/My.ets文件-结构从静态模板中拷贝
```typescript
@Preview
@Component
struct My {
  build() {
    Column(){
      // 基本信息
      Column() {
        Image($r("app.media.ic_avatar_driver"))
          .width(67)
          .height(67)
          .borderRadius(34.5)
          .backgroundColor($r('app.color.white'))
        Text("司机")
          .fontSize(18)
          .fontWeight(600)
          .lineHeight(25)
          .margin({
            top: 9,
            bottom: 9
          })
          .fontColor($r('app.color.white'))
        Text(`司机编号: 66666666`).fontSize(14).fontWeight(400).lineHeight(20).fontColor($r('app.color.white'))
        Text(`手机号: 66666666`)
          .fontSize(14)
          .fontWeight(400)
          .lineHeight(20)
          .margin({
            top: 10
          })
          .fontColor($r('app.color.white'))
      }
      .backgroundImage($r("app.media.bg_page_my"))
      .backgroundImageSize(ImageSize.Cover)
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .height(292)
      .margin({
        top: -2
      })

      // 本月任务
      Column() {
        Text("- 本月任务 -").fontSize(14).fontColor($r('app.color.text_secondary')).lineHeight(20)
        Row() {
          Column() {
            Text("1000").fontSize(18).fontColor($r('app.color.text_primary')).lineHeight(25).margin({
              bottom: 17
            })
            Text("任务总量").fontSize(12).fontColor($r('app.color.text_primary')).lineHeight(17)
          }.justifyContent(FlexAlign.SpaceAround).layoutWeight(1)

          Column() {
            Text("1000")
              .fontSize(18)
              .fontColor($r('app.color.text_primary'))
              .lineHeight(25)
              .margin({ bottom: 17 })
            Text("完成任务量").fontSize(12).fontColor($r('app.color.text_primary')).lineHeight(17)
          }.justifyContent(FlexAlign.SpaceAround).layoutWeight(1)

          Column() {
            Text("1000")
              .fontSize(18)
              .fontColor($r('app.color.text_primary'))
              .lineHeight(25)
              .margin({ bottom: 17 })
            Text("运输里程(km)").fontSize(12).fontColor($r('app.color.text_primary')).lineHeight(17)
          }.justifyContent(FlexAlign.SpaceAround).layoutWeight(1)
        }.justifyContent(FlexAlign.SpaceBetween).width('100%').layoutWeight(1)
      }
      .backgroundColor($r('app.color.white'))
      .borderRadius(8)
      .margin({ left: 14.5, right: 14.5, top: -55, bottom: 15 })
      .height(134)
      .padding({ top: 13.5, bottom: 13.5 })
      .justifyContent(FlexAlign.SpaceBetween)

      // 信息列表
      Column() {
        Row() {
          Text("车辆信息").fontSize(16).fontWeight(400).fontColor($r('app.color.text_primary'))
          Image($r("app.media.ic_btn_more")).width(24).height(24)
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .border({ width: { bottom: 1 }, color: $r('app.color.background_page') })
        .width('100%')
        .height(60)

        Row() {
          Text("任务数据").fontSize(16).fontWeight(400).fontColor($r('app.color.text_primary'))
          Image($r("app.media.ic_btn_more")).width(24).height(24)
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .border({ width: { bottom: 1 }, color: $r('app.color.background_page') })
        .width('100%')
        .height(60)

        Row() {
          Text("系统设置").fontSize(16).fontWeight(400).fontColor($r('app.color.text_primary'))
          Image($r("app.media.ic_btn_more")).width(24).height(24)
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .width('100%')
        .height(60)
      }
      .padding({ left: 17.5, right: 17.5 })
      .backgroundColor($r('app.color.white'))
      .margin({ left: 14.5, right: 14.5, bottom: 15 })
      .borderRadius(8)

    }.width('100%').height('100%').backgroundColor($r('app.color.background_page')).borderRadius(8)
  }
}

export default My
```
> 这里用了默认导出 export default My 为什么不用按需导出啦，按需导出针对的是我们的组件库及一些公用的方法和组件，因为不确定一个组件可能会导出哪些内容，可能一个可能多个，但是这里My属于业务组件，只用于完成这个业务，所以这里用了默认导出

- 放置在Index组件中的**我的位置**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703663326290-a60dfc07-d4a9-4fbb-ad19-762b3e685764.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_38%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232d2d2c&clientId=ucfac3dd9-5fa2-4&from=paste&height=740&id=iD0gr&originHeight=740&originWidth=1350&originalType=binary&ratio=2&rotation=0&showTitle=false&size=74633&status=done&style=none&taskId=uab67ee9b-3f4d-465d-a85c-ca626daac7c&title=&width=1350)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701437559626-d36b0c50-b00b-4e4d-9bee-4aece644ed61.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_10%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e8e8e8&clientId=u9130c8f2-b379-4&from=paste&height=451&id=OuVhr&originHeight=312&originWidth=365&originalType=binary&ratio=2&rotation=0&showTitle=false&size=14092&status=done&style=none&taskId=ud1a51445-84c8-45d0-82ea-17285f402b2&title=&width=527.5)

:::info

- 大家拷贝过程中发现了什么，就是我们车辆信息，任务数据，系统设置好像结构基本都一样，但是这样代码可读性确实有点低，怎么办？
- 封装组件库是一个好的办法
- 大家先把代码提交，接下来，我们来抽提两个组件 HmCard和HmCardItem
:::

# 抽提HmCard和HmCardItem组件
> **Basic模块**

:::info

- 抽提组件的原因是为了复用，小时达中有很多类似的需求设计如下图
:::
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701437723576-32309d22-117a-4e25-b43a-a9c89e7f10e0.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_26%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f9f9f9&clientId=u9130c8f2-b379-4&from=paste&height=267&id=Rjxig&originHeight=534&originWidth=908&originalType=binary&ratio=2&rotation=0&showTitle=false&size=50420&status=done&style=none&taskId=uef185680-3ce1-4ede-8307-9651c5b0f94&title=&width=454)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701437786287-f69975a2-0af1-4edb-8a8a-cf56684cd485.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_28%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fefdfa&clientId=u9130c8f2-b379-4&from=paste&height=450&id=g9LZV&originHeight=900&originWidth=992&originalType=binary&ratio=2&rotation=0&showTitle=false&size=65352&status=done&style=none&taskId=u3a87a92d-a61f-45ed-bbdd-bf089b700b3&title=&width=496)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701437795020-fb038360-9daf-4e3e-8092-b52f4d6c873f.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_14%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f1f1f1&clientId=u9130c8f2-b379-4&from=paste&height=285&id=cvd3F&originHeight=197&originWidth=308&originalType=binary&ratio=2&rotation=0&showTitle=false&size=7718&status=done&style=none&taskId=u10f1619f-5153-47dd-8685-e7e532a8982&title=&width=445)
> 综上，我们需要一个卡片的容器，和一个左右显示内容的组件，并且容器中还可以放置其他组件


- 所以我们首先封装一个卡片HmCard- components/HmCard.ets
```typescript
@Component
export struct HmCard {
  @BuilderParam
  HmCardFn: () => void

  build() {
    Column() {
      Column() {
        if(this.HmCardFn) {
          this.HmCardFn()
        }
      }.backgroundColor($r('app.color.white')).borderRadius(10).width('100%').padding({
        left: 15,
        right: 15
      }).backgroundColor($r('app.color.white'))
    }.width('100%').padding(15)
  }
}

```

- 在compoments/index.ets中导出
```typescript
export * from './HmCard'
```

:::info

- HmCard组件中，我们定义了一个BuilderParam的函数（插槽），通过传入的方式传入内容
:::

- 接下来我们封装HmCardItem.ets组件，在HmCard同级新建HmCardItem组件

需求
:::info

1. 能够两头对齐
2. 右侧能够显示向右的图标，也可以不显示
3. 右侧还可以显示内容-并且应该是可变得
4. 右侧的内容可以触发点击事件，并且在使用它时可以监听到
5. 可以控制是否显示下边框
:::
HmCardItem.ets代码实现
```typescript
@Component
struct HmCardItem {

  leftText: string = ''
  @Prop rightText: string
  
  showBottomBorder: boolean = true
  showRightIcon: boolean = true
  
  onRightClick: () => void = () => {}


  build() {
    Row() {
      Text(this.leftText).fontSize(16).fontWeight(400).fontColor($r('app.color.text_primary'))
      Row() {
        if (this.rightText) {
          Text(this.rightText).fontColor($r("app.color.text_secondary")).fontWeight(400).fontSize(14)
        }
        if (this.showRightIcon) {
          Image($r("app.media.ic_btn_more")).width(24).height(24)
        }
      }.onClick(() => {
         this.onRightClick()
      })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .border({
      width: {
        bottom: this.showBottomBorder ? 1 : 0
      },
      color: $r('app.color.background_divider')
    })
    .width('100%')
    .height(60)
  }
}

export { HmCardItem }
```

- 在components/index.ets导出
```typescript
export * from './HmCard'
export * from './HmCardItem'
```
> 在basic/Index.ets中导出

```typescript
export * from './src/main/ets/components'
```
> **Entry模块**

- 引入组件
```typescript
import { HmCard, HmCardItem } from '@hm/basic'
```

- 接下来使用HmCard和HmCardItem去替换我的页面的三个内容吧
```typescript
 HmCard() {
    HmCardItem({ leftText: '车辆信息', rightText: '' })
    HmCardItem({ leftText: '任务设置', rightText: '' })
    HmCardItem({ leftText: '系统设置', rightText: '', showBottomBorder: false })
  }
```
 一摸一样的， Nice !
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701445423148-d341157f-b243-4869-81a1-c1fa090e3623.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_17%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f0f0f0&clientId=u86ae4e70-4527-4&from=paste&height=254&id=wYCVv&originHeight=508&originWidth=604&originalType=binary&ratio=2&rotation=0&showTitle=false&size=37831&status=done&style=none&taskId=u8ccea4a6-055f-404b-991f-08f7501ba9b&title=&width=302)

:::info
总结

- 封装了HmCard和HmCardItem组件，利用插槽技术把CardItem放入Card中
- CardItem设置了几个属性 如 显示图标 右侧文本(Prop) 显示底边框
- 提交代码
:::
# 获取我的个人信息
> 之前的遗留问题

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713600795823-7c51a478-76bd-4f2a-8d4a-9a4ce8216424.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_27%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23332f2f&clientId=u55a62aa9-581c-4&from=paste&height=433&id=GQfsP&originHeight=433&originWidth=940&originalType=binary&ratio=1&rotation=0&showTitle=false&size=83645&status=done&style=none&taskId=ubed135b3-f7f4-4446-937b-95dc7823215&title=&width=940)
:::info
标准流程

- 定义接口数据结构
- 封装api
- 组件中定义响应式数据
- 封装方法调用api获取数据赋值给响应式数据
- 在aboutToAppear中调用方法
- 将响应式数据更换到视图上换成真是的
:::

1. 找到[获取个人信息](https://apifox.com/apidoc/shared-4b036830-59b1-4526-b00a-61df2b3d4ae1/api-71325815)的接口文档

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701445838118-15aef68c-6d7d-41fd-9a7c-70ed1cc348e5.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_42%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fefefe&clientId=u86ae4e70-4527-4&from=paste&height=474&id=OiaKx&originHeight=948&originWidth=1462&originalType=binary&ratio=2&rotation=0&showTitle=false&size=116025&status=done&style=none&taskId=udb414e44-a45e-4643-be5d-80b047fc6b8&title=&width=731)

- 定义个人信息接口
```typescript
export interface UserInfoModel {
  /** 头像 */
  avatar: string;

  /** 姓名 */
  name: string;

  /** 司机编号 */
  number: string;

  /** 手机号 */
  phone: string;
}
```

2. 在api/user.ts中封装获取用户信息的接口
```typescript
import { LoginFormModel, UserInfoModel } from '../models'

// 获取用户信息
export const getUserInfoAPI = () => {
  return Request.get<UserInfoModel>("/drive/users")
}
```

3. 在My页面中导入类型并声明State数据
```typescript
import { UserInfoModel } from '../../../models'
struct My {
  @State
  userInfo: UserInfoModel = {} as UserInfoModel
  ...
}
```

4. 封装一个方法
```typescript
  async getUserInfo() {
    this.userInfo = await getUserInfoAPI()
  }
```

5. 在父组件通过Provide传入一个当前name
```typescript
  @State
  @Watch("updateName")
  currentIndex: number = 0 // 当前激活项
  
  @Provide
  currentName: string = ""

  updateName() {
    this.currentName = this.tabsData[this.currentIndex].name
  }
```

6. 在子组件监听数据变化，如果是当前的tab则获取个人信息
```typescript
  @Consume
  @Watch("getUserInfo")
  currentName: string
  async getUserInfo() {
    if (this.currentName === 'my') {
      this.userInfo = await getUserInfoAPI()
    }
  }
```

7. 更新数据

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703756564820-7cbc593f-6c56-4429-9604-2580261730d6.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_44%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232d2d2c&clientId=u896e7866-12c2-4&from=paste&height=1298&id=zFUll&originHeight=1298&originWidth=1544&originalType=binary&ratio=1&rotation=0&showTitle=false&size=163958&status=done&style=none&taskId=uf55f0177-62a1-4f6b-98c0-ccb8d8f53b4&title=&width=1544)

:::info
遵循我们一开始的标准流程后续所有的请求都按照此方式来进行

- 提交代码
:::

# 任务数据获取
上一节如果你能够顺利完成的话，那么接下来，我们来做一个带参数的查询
> [获取任务数据接口地址](https://apifox.com/apidoc/shared-4b036830-59b1-4526-b00a-61df2b3d4ae1/api-71327680)

1. 导入数据类型- entry/models/user_task.ets
> 导入的数据包括
> - 请求参数UserTaskInfoParams
> - 响应数据UserTaskInfo

```typescript
/** 响应数据 */
export interface UserTaskInfoModel {
  /** 完成任务数量,基于实际完成时间统计 */
  completedAmounts: number;
  /** 每日里程,基于实际完成时间统计 */
  dailyMileage: DailyMileageModel[];
  /** 任务数量,基于计划完成时间统计 */
  taskAmounts: number;
  /** 运输里程，单位：公里，基于实际完成时间统计 */
  transportMileage: number;
}

export interface DailyMileageModel {
  /** 日期,格式：2022-07-16 00:00:00 */
  dateTime: string | null;
  /** 里程，单位：公里;计算公式：原始数据（单位米）/1000 四舍五入取整 */
  mileage: number | null;
}

export interface UserTaskInfoParamsModel {
  /** 月 */
  month: string;
  /** 年 */
  year: string;
}
```
> 使用i2c插件自动生成实现类class-具体方式参照上一小节

2. 封装api-user.ets
```typescript
import {  UserTaskInfoModel, UserTaskInfoParamsModel } from '../models'

// 获取用户任务数据
export const getUserTaskInfoAPI = (data: UserTaskInfoParamsModel) => {
  return Request.get<UserTaskInfoModel>("/driver/users/taskReport", data)
}
```

3. 在my组件中定义数据，封装方法调用
```typescript
  @State
  userTaskInfo: UserTaskInfoModel = {} as UserTaskInfoModel
  queryTaskParams: UserTaskInfoParamsModel = {
    year: new Date().getFullYear().toString(),
    month: (new Date().getMonth() + 1).toString()
  }
  async getUserInfo() {
    if(this.currentName === 'my') {
      this.userInfo = await getUserInfo()
      this.userTaskInfo = await getUserTaskInfoAPI(this.queryTaskParams)
    }
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701447633425-69447dc8-73fe-4b65-be0e-b0f0e14f749a.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_17%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e5e5e5&clientId=u86ae4e70-4527-4&from=paste&height=97&id=UMWfP&originHeight=194&originWidth=596&originalType=binary&ratio=2&rotation=0&showTitle=false&size=22701&status=done&style=none&taskId=u0b07a5a0-25f3-4806-b48b-a4a9a339806&title=&width=298)	

:::info
注意：由于接口的问题，任务数据中的年和月是必填的，而且必须是字符串，否则会报错，请注意
:::

4. 最后一步替换数据

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703768481635-b930ce5d-f5a2-4329-80f4-0cd5ec9b8b7b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_31%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23302e2d&clientId=ufd04a747-c751-4&from=paste&height=741&id=SMnAO&originHeight=741&originWidth=1100&originalType=binary&ratio=1&rotation=0&showTitle=false&size=140986&status=done&style=none&taskId=ua0119389-087c-47c6-93de-3434369b046&title=&width=1100)

```typescript
      // 本月任务
      Column() {
        Text("- 本月任务 -").fontSize(14).fontColor($r('app.color.text_secondary')).lineHeight(20)
        Row() {
          Column() {
            Text(this.userTaskInfo.taskAmounts?.toString()).fontSize(18).fontColor($r('app.color.text_primary')).lineHeight(25).margin({
              bottom: 17
            })
            Text("任务总量").fontSize(12).fontColor($r('app.color.text_primary')).lineHeight(17)
          }.justifyContent(FlexAlign.SpaceAround).layoutWeight(1)

          Column() {
            Text(this.userTaskInfo.completedAmounts?.toString())
              .fontSize(18)
              .fontColor($r('app.color.text_primary'))
              .lineHeight(25)
              .margin({ bottom: 17 })
            Text("完成任务量").fontSize(12).fontColor($r('app.color.text_primary')).lineHeight(17)
          }.justifyContent(FlexAlign.SpaceAround).layoutWeight(1)

          Column() {
            Text(this.userTaskInfo.transportMileage?.toString())
              .fontSize(18)
              .fontColor($r('app.color.text_primary'))
              .lineHeight(25)
              .margin({ bottom: 17 })
            Text("运输里程(km)").fontSize(12).fontColor($r('app.color.text_primary')).lineHeight(17)
          }.justifyContent(FlexAlign.SpaceAround).layoutWeight(1)
        }.justifyContent(FlexAlign.SpaceBetween).width('100%').layoutWeight(1)
      }
      .backgroundColor($r('app.color.white'))
      .borderRadius(8)
      .margin({ left: 14.5, right: 14.5, top: -55, bottom: 15 })
      .height(134)
      .padding({ top: 13.5, bottom: 13.5 })
      .justifyContent(FlexAlign.SpaceBetween)
```


> 解释：
>     接口返回的是number类型，而只有字符串才能显示到文本上，我们使用了toString()，只不过你需要 this.TaskInfo.transportMileage?.toString() 并且加上短路表达式来 如果前者为空 则处理成空字符
> why?
>     因为TaskInfo我们定义的是空对象，直接对undefind的数据进行toString，会直接空指针异常的
> - 最后提交代码


:::info

- 提交代码
:::

# 系统设置页面
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701448216829-6ee9f21d-31bc-472c-a95b-3e470c3e9f15.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f9f9f9&clientId=u86ae4e70-4527-4&from=paste&height=550&id=Jb5Uc&originHeight=1100&originWidth=856&originalType=binary&ratio=2&rotation=0&showTitle=false&size=75855&status=done&style=none&taskId=u87ac0284-5a9b-4924-afc5-454f9e153fb&title=&width=428)

上面这个页面我们完全可以复用之前的HmCard和HmCardItem，但是顶部的内容还带标题比较通用，所以我们来封装一个新的组件

1. 新建一个Page，因为车辆设置是点击系统设置跳转的页面，所以它是一个页面，不是一个组件
- 在pages下新建Setting/Setting.ets页面

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701489355927-67c3a43c-c276-4f91-b76d-d5e2019d2820.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_83%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%238e9549&clientId=u3206b94d-e95c-4&from=paste&height=795&id=KOKXe&originHeight=1590&originWidth=2906&originalType=binary&ratio=2&rotation=0&showTitle=false&size=294869&status=done&style=none&taskId=u4e8f87f3-8108-41e6-94d8-de7ec429d3e&title=&width=1453)

2. 使用之前封装好的组件HmCard HmCardItem 构建主内容区，并放置退出按钮
```typescript
import { HmCard, HmCardItem } from '@hm/basic'

@Entry
@Component
struct Setting {
  build() {
    Column() {
      HmCard() {
        HmCardItem({ leftText: '换绑手机', rightText: '' })
        HmCardItem({ leftText: '修改密码', rightText: '' })
        HmCardItem({ leftText: '消息通知设置', rightText: '' })
        HmCardItem({ leftText: '清理缓存', rightText: '', showBottomBorder: false })
      }

      Row() {
        Button("退出", { type: ButtonType.Normal })
          .backgroundColor($r('app.color.white'))
          .fontColor($r("app.color.text_primary"))
          .width('100%')
          .borderRadius(8)
          .height(60)
      }
      .width('100%')
      .margin({ top: 20 })
      .padding({ left: 15, right: 15 })
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703768871409-cc47ea36-2240-4bea-9ffb-f7fd095cc5b7.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_76%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23656565&clientId=ufd04a747-c751-4&from=paste&height=1612&id=Gf6wd&originHeight=1612&originWidth=2678&originalType=binary&ratio=1&rotation=0&showTitle=false&size=311121&status=done&style=none&taskId=u0477b634-1b27-44eb-91ed-70496f270ae&title=&width=2678)

3. 在点击系统设置时，跳转到系统设置页-pages/Index/My/My.ets
```typescript
  HmCardItem({ leftText: '系统设置', rightText: '', onRightClick: () => {
          router.pushUrl({
            url: 'pages/Setting/Setting'
          })
        }})
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701490296893-1452b905-a29d-4582-b36e-648eabc8e196.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_51%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232e2e2e&clientId=u3206b94d-e95c-4&from=paste&height=261&id=PwKLM&originHeight=522&originWidth=1802&originalType=binary&ratio=2&rotation=0&showTitle=false&size=77357&status=done&style=none&taskId=ue607dcc2-8b26-40dd-92f5-e442eec6359&title=&width=901)
:::info
总结：

- 封装好的组件用起来很爽
- 按照业务的需求和UI的设计抽提组件时要考虑复用性，这样就会积累起自己的一套组件库，甚至为开源做贡献
- 提交代码
:::
# 系统设置页面-封装HmNavBar
> **basic包**


![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701490463068-082906db-0154-4c44-bf54-e89e04271689.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_21%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f9f9f9&clientId=u3206b94d-e95c-4&from=paste&height=66&id=ma83F&originHeight=132&originWidth=746&originalType=binary&ratio=2&rotation=0&showTitle=false&size=12729&status=done&style=none&taskId=u482d398d-62df-4af1-8804-477d8e3cea4&title=&width=373)
:::info
分析需求

- 能够设置中间的标题部分
- 点击左侧按钮能够返回上一层页面
:::
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703769543966-b12451ad-faad-48b7-b423-378f986a875d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_22%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fbfdfb&clientId=ufd04a747-c751-4&from=paste&height=238&id=OPB7I&originHeight=238&originWidth=784&originalType=binary&ratio=1&rotation=0&showTitle=false&size=17735&status=done&style=none&taskId=ub32bba40-bca5-470e-ac43-de536ecc110&title=&width=784)

1. 新建components/HmNavBar组件
```typescript
import router from '@ohos.router';

@Preview
@Component
export struct HmNavBar {
  title: string = "测试个人中心"
  showBackIcon: boolean = true

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Row() {
        if (this.title) {
          Text(this.title).fontColor($r('app.color.text_primary')).fontSize(18).fontWeight(600)
        }
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .height('100%')

      if (this.showBackIcon) {
        Row() {
          Image($r("app.media.ic_btn_nav_back")).width(44).height(44).onClick(() => {
            router.back() // 回上一页
          })
        }.alignItems(VerticalAlign.Center).width(44)
      }
    }
    .backgroundColor($r('app.color.white'))
    .height(50)
    .width('100%')
    .padding(10)
  }
}
```

2. 在components/index.ets中导出
```typescript
export * from './HmNavBar'
```

3. 直接在系统设置中引用，放置到最上方即可
```typescript
      HmNavBar({ title: '系统设置' })

```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713166568685-b05e8c34-816b-4ffc-917a-97349ca652e7.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_84%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23b2ad52&clientId=ude3f129b-28fe-4&from=paste&height=1772&id=NIZXD&originHeight=1772&originWidth=2964&originalType=binary&ratio=1&rotation=0&showTitle=false&size=434821&status=done&style=none&taskId=u850060db-1483-4ed9-8da7-c8251ef6b78&title=&width=2964)

:::info
总结

- 这里我们的HmNavBar的组件title和showBackIcon属性均没有采用@Link和@Prop ，因为它并不需要向响应式更新，这里请知晓，需要的话再去封装对应的需求即可
- 提交代码
:::
# 自定义弹窗-实现退出登录功能
> **Basic**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701491504866-087e2e5a-b0ef-438e-817a-f59fcc129e03.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d4d4d3&clientId=u3206b94d-e95c-4&from=paste&height=202&id=iDZOs&originHeight=404&originWidth=714&originalType=binary&ratio=2&rotation=0&showTitle=false&size=41051&status=done&style=none&taskId=u2aeeaf25-0ab8-4eb1-acf1-edb9e52a106&title=&width=357)
:::danger
按道理说-这是个很简单的需求，但是！！！目前鸿蒙提供的默认弹窗有点不忍直视，它是长这个样子的
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703770475131-8fa3fb81-b36d-4eee-8bfe-97f3aca816e0.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d5d5d5&clientId=ufd04a747-c751-4&from=paste&height=468&id=qUhNk&originHeight=468&originWidth=830&originalType=binary&ratio=1&rotation=0&showTitle=false&size=50149&status=done&style=none&taskId=uf2fdea24-e374-4fa2-8e3f-eaee3c02d9f&title=&width=830)

- 差别有点大，为了避免以后我们和UI或者产品开撕的风险， 我们还是自己来吧，系统默认的弹窗不好看，不符合要求，我们自己整一个呗，怎么整呢？ 我们需要使用鸿蒙提供的[自定义弹窗功能](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-common-components-custom-dialog-0000001450754206-V3)
:::

- 现在来浅析一下自定义弹窗的使用方式
> 1. 使用@CustomDialog装饰器装饰自定义弹窗。
> 2. @CustomDialog装饰器用于装饰自定义弹框，此装饰器内进行自定义内容（也就是弹框内容）。
> 3. 创建构造器，与装饰器呼应相连。
> 4. 点击与onClick事件绑定的组件使弹窗弹出

- 封装一个自定义弹窗组件
```typescript

@CustomDialog
@Component
export struct HmConfirm {
  // 必不可少的属性 用来控制这个结构的显示和隐藏的
  controller: CustomDialogController
  message: string = "确定要退出登录吗？"
  buttonList: HmConfirmButton[] = [{
    text: '确定',
    fontSize: 14,
    fontColor: $r('app.color.text_secondary')
  }]
  build() {
    Row() {
     Column() {
       Row() {
         Text(this.message)
           .fontSize(16)
           .fontColor($r('app.color.text_primary'))
       }
       .width('100%')
       .height(88)
       .justifyContent(FlexAlign.Center)
       .border({
         color: $r('app.color.background_divider'),
         width: {
           bottom: 0.5
         }
       })
       Row() {
         ForEach(this.buttonList, (item: HmConfirmButton, index: number) => {
           Text(item.text)
             .fontSize(item.fontSize || 16)
             .textAlign(TextAlign.Center)
             .fontColor(item.fontColor || $r('app.color.text_secondary'))
             .layoutWeight(1)
             .border({
               color: $r('app.color.background_divider'),
               width: {
                 right: this.buttonList.length > 1 && index !== this.buttonList.length - 1
                 ? 0.5: 0
               }
             })
             .height('100%')
             .onClick(async () => {
                if(item.action) {
                 await item.action()
                }
               this.controller.close()
             })
         })
       }
       .height(49)
       .width('100%')
     }
    }
    .width(278)
    .borderRadius(12)
    .backgroundColor($r('app.color.white'))
  }
}



class HmConfirmButton {
  fontColor?: ResourceStr = ''
  fontSize?: number = 16
  text: string = ""
  action?: () => void = () => {}
}
```

- 统一导出
```typescript
export * from './HmConfirm'
```
> **Entry模块**

- 在Setting中声明CustomDialogController

 
```typescript
confirm: CustomDialogController = new CustomDialogController({
    builder: HmConfirm({
      message: '确定要退出登录吗?',
      buttonList: [{
        text: '取消'
      },{
        text: '确定',
        fontColor: $r('app.color.primary'),
        action: () => {
          this.logout()
        }
      }]
    }),
    customStyle: true,
    alignment: DialogAlignment.Center,
    autoCancel: false
  })
```

- 给退出登录按钮注册点击事件
```typescript
 .onClick(() => {
            this.confirm.open()
        })
```

- 实现logout方法
```typescript
  logout () {
    // 删除token
    AppStorage.set<string>(TOKEN_KEY, "")
    new UserSettingClass(getContext(this)).setUserToken("")
    router.replaceUrl({
      url: 'pages/Login/Login'
    })
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703778579420-fd5494be-317b-4408-a79f-eb14c56ceb94.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d7d7d6&clientId=ua627155d-977d-4&from=paste&height=299&id=GBxVD&originHeight=494&originWidth=706&originalType=binary&ratio=2&rotation=0&showTitle=false&size=32897&status=done&style=none&taskId=u6a150fa3-5cc6-4a53-975e-e06c2bd4264&title=&width=427)

> 提交代码

# 封装骨架屏组件
> **basic模块**

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713168178689-1f10d50c-a678-4951-a421-004df9cf2d33.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f6f7f8&clientId=ude3f129b-28fe-4&from=paste&height=1368&id=wy7Ce&originHeight=1368&originWidth=716&originalType=binary&ratio=1&rotation=0&showTitle=false&size=15542&status=done&style=none&taskId=ua9d0484d-8c78-477f-a1b9-540043d3857&title=&width=716)
> 我们发现获取用户资料时速度较慢，此时页面会出现undefined的情况，我们可以判断下数据是否存在，如果不存在，我们直接显示一个骨架屏，如果数据出来，再把骨架屏撤

- 在basic中封装HmSkeleton组件
```typescript
@Preview
@Component
export struct HmSkeleton {
  @Prop
  showAvatar: boolean = true
  @Prop
  count: number = 3
  timer: number = -1
  @State
  currentColor: string = "#f3f4f5"

  aboutToAppear(): void {
    this.timer = setInterval(() => {
      if (this.currentColor === "#f3f4f5") {
        this.currentColor = "#f7f8f9"
      }else {
        this.currentColor = "#f3f4f5"
      }
    }, 100)
  }

  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  @Builder
  getSingleItem() {
    Column() {
      Row({ space: 10 }) {
        if (this.showAvatar) {
          Row()
            .width(40)
            .height(40)
            .borderRadius(20)
            .backgroundColor(this.currentColor)
        }
        Column({ space: 10 }) {
          Row()
            .width("30%")
            .height(26)
            .backgroundColor(this.currentColor)
          Row()
            .width("100%")
            .height(26)
            .backgroundColor(this.currentColor)
          Row()
            .width("100%")
            .height(26)
            .backgroundColor(this.currentColor)
          Row()
            .width("50%")
            .height(26)
            .backgroundColor(this.currentColor)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)

      }
      .alignItems(VerticalAlign.Top)
      .width('100%')
    }
    .width('100%')

  }

  build() {
    Column({ space: 30 }) {
      ForEach(Array.from(Array(this.count)), () => {
        this.getSingleItem()
      })
    }
    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .width('100%')
    .height('100%')
    .backgroundColor($r("app.color.white"))
  }
}

```

- 在components/index.ets中导出
```typescript
export * from './HmSkeleton'
```
> **entry模块**

- 定义状态判断
```typescript
 @State
  loading: boolean = true
  async getUserInfo() {
    if(this.currentName === 'my') {
      this.loading = true
      this.userInfo = await getUserInfo()
      this.userTaskInfo = await getUserTaskInfo(this.queryTaskParams)
      this.loading = false
    }
  }
```

- 在builde中判断

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713168653270-a6e5ee11-b6d0-49ab-a70e-baf3d87ee502.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_49%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232d2d2d&clientId=ude3f129b-28fe-4&from=paste&height=1190&id=ZTtuE&originHeight=1190&originWidth=1702&originalType=binary&ratio=1&rotation=0&showTitle=false&size=139400&status=done&style=none&taskId=u4c6a5960-94d8-4533-9b7f-b1e91abcbba&title=&width=1702)
> 提交代码


# 设计任务模块tabs
> **entry模块**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701493980389-ced98957-4a84-4e7b-aff1-ca120d82035d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e4e3e3&clientId=u7bd050ef-9c46-4&from=paste&height=347&id=lHYpZ&originHeight=1386&originWidth=712&originalType=binary&ratio=2&rotation=0&showTitle=false&size=58452&status=done&style=none&taskId=ub9ad43e8-2e14-4e69-8b71-3a19e961890&title=&width=178)![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701494051688-78f3956c-d044-4a27-a887-5c94f62db39b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_22%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f6f3f3&clientId=u7bd050ef-9c46-4&from=paste&height=366&id=cO9s8&originHeight=1460&originWidth=758&originalType=binary&ratio=2&rotation=0&showTitle=false&size=276154&status=done&style=none&taskId=u8f2d4278-39f4-4d63-a15d-dda81f83ec0&title=&width=190)
:::info
任务模块分析

- 任务模块又是一个tabs，位置居于上方  
- 里面三个待提货 在途 已完成
- 先要完成任务的基本布局，才可以往下推进
:::

1. 新建一个TaskTabs组件-位置 pages/Index/Task/TaskTabs.ets(组件-非Page)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701494310606-68f19c64-45de-4306-a104-77993430f208.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_52%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%238f984d&clientId=u7bd050ef-9c46-4&from=paste&height=478&id=fopKB&originHeight=956&originWidth=1812&originalType=binary&ratio=2&rotation=0&showTitle=false&size=108052&status=done&style=none&taskId=u8d09ddc9-c114-4732-9485-78074a85d5e&title=&width=906)

2. 在Index中引入该组件，并放入任务的tab内

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703818987324-e066df60-9cb2-47eb-aea6-2e48626e2929.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_31%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%2331312e&clientId=ud312e137-db3f-4&from=paste&height=390&id=M9VSr&originHeight=390&originWidth=1080&originalType=binary&ratio=1&rotation=0&showTitle=false&size=36257&status=done&style=none&taskId=u3ef26124-dc50-419e-be1f-383007c424c&title=&width=1080)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703818953505-b261b8bf-856d-47e1-aa53-9ea57c296afb.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_42%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232d2d2d&clientId=ud312e137-db3f-4&from=paste&height=1084&id=jQ1fk&originHeight=1084&originWidth=1478&originalType=binary&ratio=1&rotation=0&showTitle=false&size=109578&status=done&style=none&taskId=u72d7465b-4f63-4acc-9e0a-3b43804f1ca&title=&width=1478)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701494453760-0b948219-9506-454b-ac0e-c03609770e02.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_55%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23c3ae6f&clientId=u7bd050ef-9c46-4&from=paste&height=801&id=EZnwK&originHeight=1602&originWidth=1932&originalType=binary&ratio=2&rotation=0&showTitle=false&size=95440&status=done&style=none&taskId=ubb8518c8-e443-4796-90fe-d56d73e92cb&title=&width=966)

3. 使用tabs组件构建任务组件的布局和内容

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701495103896-106844ad-0a1d-4be9-9e0b-5298131bbfd0.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_82%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23bcb874&clientId=u79979bf4-7f10-4&from=paste&height=809&id=e6yUz&originHeight=1618&originWidth=2884&originalType=binary&ratio=2&rotation=0&showTitle=false&size=213165&status=done&style=none&taskId=uf18c88c7-76b4-4bad-b4ea-aac74895b0b&title=&width=1442)
```typescript
@Component
struct TaskTabs {
  build() {
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Text("待提货")
      }.tabBar("待提货")
      TabContent() {
        Text("在途")
      }.tabBar("在途")
      TabContent() {
        Text("已完成")
      }.tabBar("已完成")
    }.backgroundColor($r('app.color.background_page')).animationDuration(300)
  }
}

export default TaskTabs
```

4. 似曾相识，和首页的Index不是一样吗，我们之前不是设置了一个TabClass吗，正好用上
- 定义state数据
```typescript
  @State
  tabsData: TabClass[] = [{
    name: 'waiting',
    title: '待提货'
  },{
    name: 'line',
    title: '在途'
  },{
    name: 'finish',
    title: '已完成'
  }]
@State
 currentIndex: number  = 0
```

- 完成循环渲染
```typescript
build() {
    Tabs({ barPosition: BarPosition.Start, index: $$this.currentIndex }) {
      ForEach(this.tabsData, (item: TabClass) => {
        TabContent(){
          Text(item.title)
        }.tabBar(item.title)
      })
    }.backgroundColor($r('app.color.background_page')).animationDuration(300)
  }
```
> 由于目前Tabs组件不支持设置上面页签的位置和方式， 所以我们要采用自定义的方式来实现tabbar的设置

- 用Stack来包裹一下
```typescript
 build() {
    Stack({ alignContent: Alignment.Top }) {
      Tabs({ barPosition: BarPosition.Start, index: $$this.currentIndex }) {
        ForEach(this.tabsData, (item: TabClass) => {
          TabContent(){
            Text(item.title)
          }.tabBar(item.title)
        })
      }.backgroundColor($r('app.color.background_page')).animationDuration(300)
       Row ({ space: 30 }) {
       
      }
      .padding({
        left: 40,
        right: 40
      })
      .width('100%')
      .height(50)
      .backgroundColor($r("app.color.white"))

    }
  }
```

- 自定义tabbar
```typescript
 @Builder
  getTabBar(item: TabClass, index:number) {
    Column() {
      Text(item.title)
        .fontSize(16)
        .fontColor(this.currentIndex === index ? $r('app.color.text_primary') : $r('app.color.text_secondary'))
        .fontWeight(600)
        .animation({
          duration: 300
        })
        .margin({
          bottom: 10
        })
      Divider()
        .strokeWidth(4)
        .color($r('app.color.primary'))
        .lineCap(LineCapStyle.Round)
        .width(this.currentIndex === index ? 23 : 0)
        .animation({
          duration: 300
        })
    }
  }
```

- 定义tabController， 绑定Tabs组件
```typescript
tabController: TabsController = new TabsController()

Tabs({ barPosition: BarPosition.Start, index: $$this.currentIndex, controller: this.tabController }) {
```

- 点击时每个tab项时，切换tab
```typescript
 .onClick(() => {
      const index = this.tabsData.findIndex(i => i.name === item.name)
      this.tabController.changeIndex(index)
    })
```

- 实际效果

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713171278808-129fe708-53fb-4f4c-9e72-c0d9aece40fe.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23efeeee&clientId=uf0a57b41-869b-4&from=paste&height=354&id=PKftv&originHeight=705&originWidth=331&originalType=binary&ratio=1&rotation=0&showTitle=false&size=26999&status=done&style=none&taskId=ue0fb81f5-c409-4f42-a363-b2a1b217650&title=&width=166)

完整代码
```typescript
import { TabClass } from '@hm/basic'

@Component
export struct TaskTabs {
  tabList: TabClass[] = [
    { name: 'waiting', title: '待提货' },
    { name: 'line', title: '在途' },
    { name: 'finish', title: '已完成' }// ctrl + shift + j
  ]
  @State currentIndex: number = 0
  controller = new TabsController()

  @Builder
  getTabBar(item: TabClass, index: number) {
    Column() {
      Text(item.title)
        .fontSize(16)
        .fontColor(this.currentIndex === index ? $r('app.color.text_primary') : $r('app.color.text_secondary'))
        .fontWeight(600)
        .animation({
          duration: 300
        })
        .margin({
          bottom: 10
        })
      Divider()
        .strokeWidth(4)
        .color($r('app.color.primary'))
        .lineCap(LineCapStyle.Round)
        .width(this.currentIndex === index ? 23 : 0)
        .animation({
          duration: 300
        })
    }
    .onClick(() => {
      this.controller.changeIndex(index)
    })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Tabs({ index: $$this.currentIndex, controller: this.controller }) {
        ForEach(this.tabList, (item: TabClass) => {
          TabContent() {
            Text(item.title)
          }
          .tabBar(item.title)
        })
      }

      //   Row 占满一行, 高度跟Tabs的标题栏高度一致
      Row({ space: 20 }) {
        ForEach(this.tabList, (item: TabClass, index) => {
          this.getTabBar(item, index)
        })
      }
      .padding({
        left: 40,
        right: 40
      })
      .width('100%')
      .height(50)
      .backgroundColor($r("app.color.white"))
    }
  }
}
```

:::info
当无法调整tabbar位置的时候，换个思路，采用自定义的方式来实现

- 提交代码
:::

# 待提货功能分析及数据加载

> **entry模块**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701496641535-9c3b5888-9aa6-49af-8a98-9be1ac0a4120.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_23%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f6f4f3&clientId=u1e7c851e-cafb-4&from=paste&height=364&id=NEIO2&originHeight=1454&originWidth=802&originalType=binary&ratio=2&rotation=0&showTitle=false&size=278248&status=done&style=none&taskId=u4a988a12-d864-42cd-a7d0-ec13bb4d7fb&title=&width=201)

:::info
分析

- 待提货是一个列表
- 每一项都是单独的一个任务
- 每一项的结构较为个性-而且在其他位置有可能用到-要考虑封装组件
- 有下拉刷新和上拉加载的需求- 难点

该如何下手

- 无外乎就是数据视图的展示
- 先把提货的组件建好，
- 把数据加载出来
- 再去实现后面的内容
:::

1. 在pages/Index/Task下新建TaskList.ets组件
```typescript
@Preview
@Component
struct TaskList {
  build() {
    Text("待提货列表")
  }
}
export default  TaskList

```

2. 在TaskTabs中导入并使用

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701497356622-119366c7-a786-4c2a-a9f9-54acb5643105.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_22%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23c1ba7d&clientId=u1e7c851e-cafb-4&from=paste&height=62&id=zXdri&originHeight=124&originWidth=778&originalType=binary&ratio=2&rotation=0&showTitle=false&size=12795&status=done&style=none&taskId=ud1d8bf74-2f1a-44e8-b1b4-20eff2d6579&title=&width=389)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703826959214-4021adbe-e13d-42c6-9d73-86d0a5e039cb.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_41%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232d2d2d&clientId=ua099e80c-dbaa-4&from=paste&height=1090&id=oPnxC&originHeight=1090&originWidth=1440&originalType=binary&ratio=1&rotation=0&showTitle=false&size=111824&status=done&style=none&taskId=u8c3597aa-d192-44b6-9ffe-fa158b81839&title=&width=1440)

3. 定义任务数据的类型-[接口文档](https://apifox.com/apidoc/shared-4b036830-59b1-4526-b00a-61df2b3d4ae1/api-71286660)

 新建一个models/task.ts文件，负责管理所有任务数据的类型
> 步骤
> - 拷贝请求参数类型和响应数据
> - 这里将响应数据的Data改成TaskListData，将其Item[]改成TaskListItem名称-为了后续更好的辨别

```typescript
export interface TaskListParamsModel {
  /** 结束时间 */
  endTime: string | null;

  /** 页码 */
  page: number;

  /** 页面大小 */
  pageSize: number;

  /** 开始时间 */
  startTime: string | null;

  /** 作业状态，1为待提货）、2为在途(在途和已交付)、3为改派、5为已作废、6为已完成（已回车登记） */
  status: number;

  /** 运输任务id */
  transportTaskId: string | null;
}

/** 响应数据，分页数据统一对象 */
export interface TaskListDataModel {
  /** 总条目数 */
  counts: number;

  /** 数据列表 */
  items: TaskInfoItemModel[];

  /** 页码 */
  page: number;

  /** 总页数 */
  pages: number;

  /** 页尺寸 */
  pageSize: number;
}

export interface TaskInfoItemModel {
  /** 实际到达时间 */
  actualArrivalTime: string;

  /** 实际发车时间 */
  actualDepartureTime: string;

  /** 创建时间 */
  created: string;

  /** 司机id */
  driverId: string;

  /** 是否可提货 */
  enablePickUp: boolean;

  /** 目的机构地址 */
  endAddress: string;

  /** 目的机构id */
  endAgencyId: number;

  /** 交付对接人 */
  finishHandover: string;

  /** 司机作业单id */
  id: string;

  /** 计划到达时间 */
  planArrivalTime: string;

  /** 计划发车时间 */
  planDepartureTime: string;

  /** 起始机构地址 */
  startAddress: string;

  /** 起始机构id */
  startAgencyId: number;

  /** 提货对接人 */
  startHandover: string;

  /** 作业状态，作业状态，1为待提货）、2为在途）、3为改派）、4为已交付）、5为已作废 */
  status: TaskTypeEnum;

  /** 运输任务id */
  transportTaskId: string;
}
```

- 声明status类型的枚举
> 请求类型采用的是一个枚举，需要使用Enum来声明

```typescript
// 查询状态的枚举
export enum TaskTypeEnum {
  Waiting = 1,
  Line = 2,
  Finish = 6
}
```

- 在models/index.ets中导出
```typescript
export * from './task'
```

- 封装请求列表api - 新建api/task.ets
```typescript
import { TaskListDataModel, TaskListParamsModel } from '../models'
import { Request } from '@hm/basic'

// 获取任务列表

export const getTaskListAPI = (params: TaskListParamsModel) => {
  return Request.get<TaskListDataModel>("/driver/tasks/list", params)
}
```

- 在api/index.ets中导出
```typescript
export * from './task'
```

- 在TaskList中声明数据，封装方法，获取数据，显示获取的数据
```typescript
  @State
  queryParams: TaskListParamsModel = {
    status: TaskTypeEnum.Waiting,
    page: 1,
    pageSize: 5,

  } as TaskListParamsModel
  @State
  taskListData: TaskInfoItemModel[] = []
```

- 封装方法调用-显示
```typescript
import { getTaskListAPI } from '../../../api/task'
import { TaskInfoItemModel, TaskListParamsModel, TaskTypeEnum } from '../../../models'


@Preview
@Component
struct TaskList {
  @State
  queryParams: TaskListParamsModel = {
    status: TaskTypeEnum.Waiting,
    page: 1,
    pageSize: 5,

  } as TaskListParamsModel
  @State
  taskListData: TaskInfoItemModel[] = []
  aboutToAppear() {
    this.getTaskList()
  }
  async getTaskList() {
    const result = await getTaskListAPI(this.queryParams)
    this.taskListData = result.items
  }
  build() {
    Text(JSON.stringify(this.taskListData, null, 2))
  }
}
export default  TaskList

```
如图
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713172612620-344495cf-4a78-43d5-b3d5-b0b469a03397.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d9d9d8&clientId=uf0a57b41-869b-4&from=paste&height=718&id=eD9rt&originHeight=718&originWidth=339&originalType=binary&ratio=1&rotation=0&showTitle=false&size=202582&status=done&style=none&taskId=u0faa8070-4269-408b-a37c-ea432747a7e&title=&width=339)

:::info
总结    

- 标准的流程
- 定义类型
- 封装api
- 调用接口
- 获取数据
- 显示数据-待实现
- 提交代码
:::
# 使用列表循环渲染数据

- 首先需要一个统一的卡片

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701498977777-01286111-32c3-49de-9043-71fae2d7e03d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_19%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f6f1f0&clientId=u1e7c851e-cafb-4&from=paste&height=255&id=Nh8LS&originHeight=446&originWidth=662&originalType=binary&ratio=2&rotation=0&showTitle=false&size=97385&status=done&style=none&taskId=u9fcf1752-0d86-415e-a662-b49b8bfa582&title=&width=379)

- 静态结构-新建一个组件pages/Index/Task/TaskItemCard.ets
```typescript
@Preview
@Component
struct TaskItemCard {
  build() {
    Column() {
      Row() {
        Text(`任务编号：213893928399283924`)
          .fontSize(16)
          .fontColor($r("app.color.text_primary"))
          .fontWeight(500)
          .lineHeight(22)
      }.justifyContent(FlexAlign.SpaceBetween).width('100%')

      Row() {
        Text("起")
          .fontSize(12)
          .fontColor($r("app.color.white"))
          .backgroundColor($r("app.color.text_primary"))
          .width(22)
          .height(22)
          .borderRadius(11)
          .textAlign(TextAlign.Center)
        Text("北京市昌平区回龙观街道西三旗桥东金燕龙写字楼8877号")
          .margin({ left: 11.5 })
          .fontColor($r('app.color.text_secondary'))
          .fontSize(14)
      }.margin({ top: 21 }).width('100%')

      Row() {
        Text("止")
          .fontSize(12)
          .fontColor($r("app.color.white"))
          .backgroundColor($r('app.color.primary'))
          .width(22)
          .height(22)
          .borderRadius(11)
          .textAlign(TextAlign.Center)
        Text("河南省郑州市路北区北清路99号")
          .margin({ left: 11.5 })
          .fontColor($r('app.color.text_secondary'))
          .fontSize(14)
      }.margin({ top: 14.5 }).width('100%')

      Divider()
        .vertical(true)
        .height(2)
        .color($r('app.color.background_divider'))
        .opacity(0.6)
        .margin({ left: 8, right: 8, top: 21 })
      Row() {
        Column() {
          Text('提货时间').fontSize(14).fontColor($r('app.color.text_secondary'))
          Text("2022.05.04 13:00").fontSize(14).fontColor($r('app.color.text_secondary')).margin({ top: 4 })
        }.alignItems(HorizontalAlign.Start)

        Button("提货", { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.primary'))
          .fontColor($r("app.color.white"))
          .fontSize(14)
          .height(32)

      }.justifyContent(FlexAlign.SpaceBetween).width('100%')
    }
    .margin({ left: 15, right: 15, top: 15 })
    .padding({ left: 19.5, right: 19.5, bottom: 18.5, top: 18.5 })
    .borderRadius(10)
    .backgroundColor($r('app.color.white'))

  }
}

export default TaskItemCard
```

- 封装TaskItemCard组件-位置-pages/Index/Task/TaskItemCard.ets

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701500210665-468fc2a1-05b9-472d-b152-f9f70a9b1a3a.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_60%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23729046&clientId=u033049e9-d9d6-4&from=paste&height=659&id=phEpG&originHeight=1318&originWidth=2106&originalType=binary&ratio=2&rotation=0&showTitle=false&size=338446&status=done&style=none&taskId=u5597e1af-def1-4ea2-a9d4-46425b53819&title=&width=1053)

- 使用List和ListItem配合生成N个TaskItemCard

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713173166864-83bfa720-48a6-4c4b-b86b-3a1bb82354fd.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ece9e8&clientId=uf0a57b41-869b-4&from=paste&height=721&id=mQjfD&originHeight=721&originWidth=340&originalType=binary&ratio=1&rotation=0&showTitle=false&size=101708&status=done&style=none&taskId=u46fefb58-a38a-4bad-b7e5-c20aa8d4d31&title=&width=340)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703830817280-4d6e4bb2-e423-46e5-9b71-ff3b8bc16768.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_44%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232d2c2c&clientId=u15d6a3a1-b769-4&from=paste&height=518&id=c6FhO&originHeight=518&originWidth=1542&originalType=binary&ratio=1&rotation=0&showTitle=false&size=44575&status=done&style=none&taskId=u7bd4b9aa-8e4a-47fe-a78f-b9fcdfe7da8&title=&width=1542)
```typescript
 build() {
    List () {
      ForEach(this.taskListData, (item: TaskInfoItemModel) => {
        ListItem(){
          TaskItemCard()
        }
      })
    }
  }
```

:::info

- 目前实现了基本的首页的显示
- 利用List和ListItem进行循环渲染-数据是假的-下一步换成真实的
- 提交代码
:::

# 任务卡片数据显示

- 把任务卡片的数据变成真实的
> 之前在获取任务列表数据时，已经声明了TaskListItem的类型可以直接使用，可以用interface也可以用class

  1. 在TaskItemCard中声明一个属性，接收单个任务的数据

- TaskItemCard.ets
```typescript
import {  TaskInfoItemModel } from '../../../models'

@Component
struct TaskItemCard {
  @Prop
  taskItem: TaskInfoItemModel = {} as TaskInfoItemModel
  ...
}
```

- 替换静态数据

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701532018564-6f7f1713-83fd-4f76-a753-b4a307c1c8c7.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_16%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23353534&clientId=uc8a1c6fb-040d-4&from=paste&height=51&id=Jactj&originHeight=53&originWidth=569&originalType=binary&ratio=2&rotation=0&showTitle=false&size=10311&status=done&style=none&taskId=u49e46327-d85d-45f3-a739-3e74b18e720&title=&width=548.5)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701502911555-fa7ed103-f94a-4a98-b0a6-a033cdfa2718.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_38%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232d2d2d&clientId=udf29da87-9a1e-4&from=paste&height=405&id=tJzbM&originHeight=810&originWidth=1338&originalType=binary&ratio=2&rotation=0&showTitle=false&size=98378&status=done&style=none&taskId=u82b2380e-b46d-4677-aa8b-e9bae836335&title=&width=669)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701502925466-19d97105-55bc-46eb-88f5-c5e624fdb61b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_34%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23323231&clientId=udf29da87-9a1e-4&from=paste&height=239&id=kB1RD&originHeight=478&originWidth=1176&originalType=binary&ratio=2&rotation=0&showTitle=false&size=77384&status=done&style=none&taskId=u1f8d7425-9f75-47b8-b253-86013622f43&title=&width=588)

- 父组件TaskList传入item数据给TaskItemCard
```typescript
 build() {
    List () {
      ForEach(this.taskListData, (item: TaskInfoItemModel) => {
        ListItem(){
          TaskItemCard({ taskItem: item })
        }
      })
    }
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713173373006-c65e4b61-bcc3-49c7-a9ba-c833c53f79e2.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eeebea&clientId=uf0a57b41-869b-4&from=paste&height=721&id=hAOSr&originHeight=721&originWidth=332&originalType=binary&ratio=1&rotation=0&showTitle=false&size=87752&status=done&style=none&taskId=uce40c55f-5c88-4396-a1f1-f5cc4c7bf6a&title=&width=332)

:::info
总结
    子组件TaskItemCard中声明数据，接受数据，并没有使用修饰符，因为此数据是只读的，父级数据只会渲染，不会操作发生删除和修改

- 提交代码
:::

# 根据状态控制提货按钮
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701503444380-42ffc075-d764-4c88-bdf1-c3e143c40c69.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_17%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f4f2f2&clientId=udf29da87-9a1e-4&from=paste&height=328&id=io1lY&originHeight=656&originWidth=612&originalType=binary&ratio=2&rotation=0&showTitle=false&size=81724&status=done&style=none&taskId=ufb68af65-2a53-49e3-a17e-cb55de89514&title=&width=306)
:::info
分析
    当前司机只能有一个任务， 必须完成提货，交货，回车登记才可以继续下一个提货
:::
我们的接口中有一个字段可以帮助我们识别该任务用户可以提取
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701503523284-a0fa09ee-c64f-44eb-980c-39231e5a107c.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_27%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fefefe&clientId=udf29da87-9a1e-4&from=paste&height=222&id=TVSsK&originHeight=444&originWidth=962&originalType=binary&ratio=2&rotation=0&showTitle=false&size=49368&status=done&style=none&taskId=u4eafe8f2-15aa-499b-88ec-fecc8ee50e5&title=&width=481)
  我们根据这个字段true/false来控制一下提货按钮的显示颜色

```typescript
...

  Button("提货", { type: ButtonType.Capsule })
          .backgroundColor(this.taskItem.enablePickUp ? $r('app.color.primary') : $r('app.color.primary_disabled'))
          .fontColor($r("app.color.white"))
          .fontSize(14)
          .height(32)
          .enabled(this.taskItem.enablePickUp)

```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713173410546-6c934db2-6ab9-4175-b4cd-0875487ca85e.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23edebea&clientId=uf0a57b41-869b-4&from=paste&height=721&id=sb6RA&originHeight=721&originWidth=333&originalType=binary&ratio=1&rotation=0&showTitle=false&size=88183&status=done&style=none&taskId=u8e617618-51b3-4a67-b694-261550a45c1&title=&width=333)
:::info
总结
    根据状态控制按钮颜色
    提交代码
:::

# 封装抽提HmList组件实现上拉加载
> **basic模块**

:::info
HmList组件要完成的功能

- 支持下拉刷新
- 支持上拉加载
- 支持自定义结构
- 支持传入数据渲染内容
- 支持设置加载提示文本
- 支持设置加载完成文本
- 支持控制是否显示加载的进度条
:::

> 结构依然采用之前可以使用的Refresh包裹List的基本架构
> - 只不过我们需要向外暴露更多的属性
> - finished 是否加载结束（布尔值）
> - dataSource 数据源 （Link修饰符）
> - renderItem 渲染单个Item的(BuilderParam)
> - onLoad 执行上拉加载的逻辑(函数)
> - onRefresh 执行下拉刷新的逻辑（函数）
> - loadingText 加载时的文本（文本）
> - finishText 结束时的文本（文本）
> - showLoadingIcon 显示加载进度 （布尔值）
> - refreshIng 控制下拉刷新（State修饰 布尔值）
> - loading 控制上拉加载（State布尔值）


在components下新建HmList.ets组件
```typescript
import { promptAction } from '@kit.ArkUI'

@Component
struct HmList {
  @State
  refreshIng: boolean = false // 控制下拉刷新的变量
  // 传入数据的数组 根据数组进行渲染
  @Prop
  dataSource: object[] = [] // 数据源

  // 上拉加载的方法
  onLoad: () => void = () => {} // 由调用者传入

  // 下拉刷新方法
  onRefresh: () => void  = () => {} // 下拉刷新的方法

  // 需要一个标记 还没有数据的标记
  @Prop
  finished: boolean = false // 是否还有下一页数据

  @State
  loading: boolean = false // 是否正在加载中 1.显示加载中文本 2. 用来做阀门 当前这次请求没结束之前 下次请求滚远点

  loadingText: string = "加载中.." // 加载中的文本

  finishText: string = "没有数据啦" // 所有数据加载完成的文本

  @BuilderParam
  renderItem: (item: object) => void // 由调用者传入 由HmList调用 传入每一个项的数据
  @Builder
  getBottomDisplay () {
    // 获取底部的展示内容
    Row({ space: 10 }) {
      if(this.finished) {
        // 此时应该没有动画的loading
        Text(this.finishText)
          .fontSize(14)
          .fontColor($r("app.color.text_secondary"))
      }else {
        Text(this.loadingText)
          .fontSize(14)
          .fontColor($r("app.color.text_secondary"))
        LoadingProgress()
          .width(20)
          .aspectRatio(1)
          .color($r("app.color.text_secondary"))
      }
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
  build() {
    Refresh({ refreshing: $$this.refreshIng }) {
      List() {
        ForEach(this.dataSource, (item: object) => {
          // 每一项的结构的UI内容不是由列表决定 而由使用者决定
          // 传入builderParam
          if(this.renderItem) {
            this.renderItem(item)
          }
        })
        // 最后放置提示文本的地方
        ListItem () {
          this.getBottomDisplay()
        }
      }
      .onReachEnd(async () => {
        // 实现上拉加载
        // 需要一个标记 是否已经加载完所有数据
        // 在没有加载完所有页数据的情况 且没有请求在进程中的情况下
        if(!this.finished && !this.loading) {
          this.loading = true // 关闭阀门
          await this.onLoad() // 实现上拉加载
          this.loading = false // 打开阀门
        }
      })

    }
    .onStateChange(async (state) => {
       // 实现下拉刷新
      if(state === RefreshStatus.Refresh) {
        // 松手加载
        await this.onRefresh() // 调用刷新方法
        this.refreshIng = false // 关闭下拉的动画效果
        this.loading = false // 关闭上拉刷新的loading
        // 下拉刷新意味着所有数据全都不要 重新来过

      }
    })

  }
}
export { HmList }
```

- 在components/index.ets中导出
```typescript
export * from './HmList'
```

> **Entry模块**

- 在TaskList中应用组件， 实现加载下一页
```typescript
import { HmList } from '@hm/basic/Index'
import { getTaskList } from '../../../api'
import { TaskInfoItem, TaskInfoItemModel, TaskListParams, TaskListParamsModel, TaskTypeEnum } from '../../../models'
import TaskItemCard from './TaskItemCard'

// 待提货
@Component
struct TaskList {
  @State
  queryParams: TaskListParamsModel = new TaskListParamsModel(
    {
      status: TaskTypeEnum.Waiting, // 待提货的类型
      page: 1, // 第几页
      pageSize: 5 // 每页几条数据
    } as TaskListParams
  )
  @State
  taskListData: TaskInfoItem[] = []
  @State
  allPage: number = 1 // 默认只有一页

  async getTaskList() {
    const result = await getTaskList(this.queryParams)
    // 追加数据
    // this.taskListData = this.taskListData.concat(result.items) // 拿到返回的数组
    this.taskListData.push(...result.items) // 延展运算符的写法
    this.allPage = result.pages // 总页数
    this.queryParams.page++ // 下次请求的页码
  }
  @Builder
  renderItem (item: object) {
     TaskItemCard({ taskItem: item as TaskInfoItemModel })
  }
  build() {
    HmList({
      dataSource: this.taskListData, // 数据源
      finished: this.allPage < this.queryParams.page  ,// 是否还有下一页
      // 上拉加载的函数
      onLoad: async () => {
        // 上拉加载
        await this.getTaskList()
      },
      renderItem: (item: object) => {
        // 如果需要的是builderParams的参数 可以用普通函数包裹一个Builder的函数
        this.renderItem(item)
      },
      loadingText: '拼命加载中',
      finishText: '没啦没啦'
    })
  }
}

export default TaskList
```
> 提交代码


# 实现下拉刷新

- 给HmList传入onRefresh函数
```typescript
HmList({
      onLoad: async () => {
        await this.getTaskList(true)
      },
      onRefresh: async () => {
        await this.onRefresh()
      },
      dataSource: $taskListData,
      renderItem: this.renderItem,
      finished: this.allPage < this.queryParams.page,
      finishText: '没啦没啦',
      loadingText: '拼命加载中'
    })
```

- 实现onRefresh函数
```typescript
// 下拉刷新函数
  async onRefresh() {
    // 重新请求第一页数据
    this.queryParams.page = 1 // 重置第一页
    await this.getTaskList(false) // 直接赋值
  }
```

- 改造getTaskList方法
```typescript
async getTaskList(append: boolean) {
    const result = await getTaskList(this.queryParams)
    if(append) {
      this.taskListData.push(...result.items)
    }else {
      this.taskListData = result.items
    }

    this.allPage = result.pages
    this.queryParams.page++
  }
```

- 完整代码
```typescript
import { HmList } from '@hm/basic/Index'
import { getTaskList } from '../../../api'
import { TaskInfoItem, TaskInfoItemModel, TaskListParams, TaskListParamsModel, TaskTypeEnum } from '../../../models'
import TaskItemCard from './TaskItemCard'
import { promptAction } from '@kit.ArkUI'

// 待提货
@Component
struct TaskList {
  @State
  queryParams: TaskListParamsModel = new TaskListParamsModel(
    {
      status: TaskTypeEnum.Waiting, // 待提货的类型
      page: 1, // 第几页
      pageSize: 5 // 每页几条数据
    } as TaskListParams
  )
  @State
  taskListData: TaskInfoItem[] = []
  @State
  allPage: number = 1 // 默认只有一页

  async getTaskList(append: boolean) {
    const result = await getTaskList(this.queryParams)
    // 追加数据
    // this.taskListData = this.taskListData.concat(result.items) // 拿到返回的数组
    if (append) {
      this.taskListData.push(...result.items) // 延展运算符的写法
    } else {
      this.taskListData = result.items // 直接赋值
    }

    this.allPage = result.pages // 总页数
    this.queryParams.page++ // 下次请求的页码
  }

  @Builder
  renderItem(item: object) {
    TaskItemCard({ taskItem: item as TaskInfoItemModel })
  }

  // 下拉刷新函数
  async onRefresh() {
    // 重新请求第一页数据
    this.queryParams.page = 1 // 重置第一页
    await this.getTaskList(false) // 直接赋值
  }

  build() {
    HmList({
      dataSource: this.taskListData, // 数据源
      finished: this.allPage < this.queryParams.page, // 是否还有下一页
      // 上拉加载的函数
      onLoad: async () => {
        // 上拉加载
        await this.getTaskList(true) // 追加逻辑
      },
      onRefresh: async () => {
        // 下拉刷新
        await this.onRefresh()
      },
      renderItem: (item: object) => {
        // 如果需要的是builderParams的参数 可以用普通函数包裹一个Builder的函数
        this.renderItem(item)
      },
      loadingText: '拼命加载中',
      finishText: '没啦没啦'
    })
  }
}

export default TaskList
```
:::info
 总结
      下拉刷新要保证能够发出请求，所以设置allPage为1，查询页码为1
      下拉刷新时覆盖数据，上拉加载是追加数据
     提交代码
:::

# 改造下拉刷新的样式
> **basic模块**

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713174716924-dbf1d5b0-4911-43cb-81a4-51c3362cc1c4.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_28%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f8f8f8&clientId=uf0a57b41-869b-4&from=paste&height=197&id=kkQ2Q&originHeight=197&originWidth=976&originalType=binary&ratio=1&rotation=0&showTitle=false&size=30553&status=done&style=none&taskId=u797ab2d7-0b16-4e69-acf3-bb2793c9191&title=&width=976)
> Refresh组件支持自定义构建样式

- 声明变量记录当前下拉状态
```typescript
  @State
  refreshStatus: RefreshStatus = RefreshStatus.Inactive
```

- 下拉状态发生变化时赋值状态

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713174928553-104ee139-6962-42da-9dd5-5a34200339d1.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_40%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232f2e2e&clientId=uf0a57b41-869b-4&from=paste&height=718&id=VTTLJ&originHeight=718&originWidth=1420&originalType=binary&ratio=1&rotation=0&showTitle=false&size=65582&status=done&style=none&taskId=u30595be3-241d-499f-abf3-cecfd5f366a&title=&width=1420)

- 实现Refresh的builder的函数
```typescript
 
  // 动态生成文本
  getStatusText() {
    switch (this.refreshStatus) {
      case RefreshStatus.Inactive:
        return ""
      case RefreshStatus.Drag:
        return "继续下拉"
      case RefreshStatus.OverDrag:
        return "松手加载"
      case RefreshStatus.Refresh:
        return "加载中"
    }
    return ""
  }
@Builder
  getRefreshDisPlay() {
    Row({ space: 10 }) {
      LoadingProgress()
        .color($r('app.color.primary'))
        .width(40)
        .height(40)
      Text(this.getStatusText())
        .fontColor($r('app.color.text_secondary'))
        .fontSize(14)
    }
    .justifyContent(FlexAlign.Center)
    .height(50)
    .width('100%')
  }
```

- 绑定builder

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713174997786-1cb2afae-8140-4fab-8049-d96f435efcf2.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_61%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232e2e2d&clientId=uf0a57b41-869b-4&from=paste&height=846&id=AmdxF&originHeight=846&originWidth=2128&originalType=binary&ratio=1&rotation=0&showTitle=false&size=108003&status=done&style=none&taskId=ue1f355ff-bb88-4ca5-968d-f0af10dbe46&title=&width=2128)
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713175019372-3b175099-2c31-4aa3-bf08-da493d76fc0e.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ebe9e9&clientId=uf0a57b41-869b-4&from=paste&height=721&id=dBD6T&originHeight=721&originWidth=336&originalType=binary&ratio=1&rotation=0&showTitle=false&size=83851&status=done&style=none&taskId=u7a059fb5-f684-4281-954b-e039ff6c406&title=&width=336)

> 提交代码


# 任务列表跳转到任务详情
> **entry模块**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701529036067-3e459926-f439-458b-9ed6-c70c18e87aa6.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_23%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f6f4f3&clientId=u9fe4a56e-46d0-4&from=paste&height=662&id=zMezo&originHeight=1446&originWidth=804&originalType=binary&ratio=2&rotation=0&showTitle=false&size=281001&status=done&style=none&taskId=u6dedd5a2-a8ba-4e1e-a5af-af28dae345d&title=&width=368)![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701529053346-718cd509-2ec8-400d-a988-183a1b77b9b0.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_21%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f6f6&clientId=u9fe4a56e-46d0-4&from=paste&height=675&id=FPtsN&originHeight=1518&originWidth=726&originalType=binary&ratio=2&rotation=0&showTitle=false&size=209218&status=done&style=none&taskId=ucb120a09-7b0a-491f-a027-9bccb983a64&title=&width=323)
:::info
分析
   1. 在提货按钮可用情况下，点击提货，跳转到任务详情
   2. 通过路由传入任务详情的id
   3. 在任务详情接受任务id
:::

1. 新建一个TaskDetail的页面，因为是列表 => 详情，所以TaskDetail应该是个页面，在pages/TaskDetail/中新建一个TaskDetail.ets

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701529967363-f97ac9f4-2d98-4bbe-9697-d0f65e00a4e2.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_38%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23595740&clientId=u9e731a83-6a5c-4&from=paste&height=395&id=poPqt&originHeight=790&originWidth=1330&originalType=binary&ratio=2&rotation=0&showTitle=false&size=119471&status=done&style=none&taskId=udd4df23a-b7e3-4f20-a34c-c0580897d28&title=&width=665)
代码
```typescript
import { HmNavBar } from '@hm/basic'
@Entry
@Component
struct TaskDetail {
  build() {
    Column() {
      HmNavBar({ title: '任务详情' })
    }.backgroundColor($r('app.color.background_page')).
    height('100%')
  }
}
```

2. 在TaskItemCard组件中，监听onClick事件中，通过路由跳转传入任务id到任务详情页
```typescript
// 去提货
  toPickUp () {
     router.pushUrl({
        url: 'pages/TaskDetail/TaskDetail',
        params: {
          id: this.taskItem.id
        }
      })
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1703925891106-c0bfeec9-1ddc-482e-8292-05e0b85bdd28.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_45%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232e2e2d&clientId=uc847d291-8056-4&from=paste&height=594&id=p92Tw&originHeight=594&originWidth=1570&originalType=binary&ratio=1&rotation=0&showTitle=false&size=111414&status=done&style=none&taskId=u5c007f3e-f550-4fa3-977d-2b3be4a6278&title=&width=1570)

3. 在TaskDetail中接收id参数，并显示
> **basic模块**

- 声明一个统一的路由interface来接收Params参数
- models/index.ets
```typescript
export interface CommonRouterParams {
  id?: string
}
```

- 在
> **entry模块**

```typescript
aboutToAppear() {
    const params = router.getParams() as CommonRouterParams
    if(params && params.id) {
      AlertDialog.show({
        message: params.id
      })
    }
  }
```

:::info

- 这里特别注意下，大家需要用一个刚注册的司机账号，才可以拥有一个待提货权限，不要和老师同学使用一个账号，这样状态会极其混乱，每个同学请注意自己的司机账号-注册地址-[https://fe-slwl-manager.itheima.net/#/driver-register](https://fe-slwl-manager.itheima.net/#/driver-register)
:::
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713175603128-2e509430-6a30-4e80-bbd7-792d1a1942d3.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23edeae9&clientId=ub694c44a-0cfc-4&from=paste&height=725&id=o7coB&originHeight=725&originWidth=337&originalType=binary&ratio=1&rotation=0&showTitle=false&size=92852&status=done&style=none&taskId=u4114d296-e661-400b-a4d4-d2ff1069647&title=&width=337)![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713175614711-06b509cb-4b28-4b3a-862c-852665626704.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23c3c3c3&clientId=ub694c44a-0cfc-4&from=paste&height=721&id=q3lpT&originHeight=721&originWidth=332&originalType=binary&ratio=1&rotation=0&showTitle=false&size=28537&status=done&style=none&taskId=u500e3be6-5db0-4ce3-8e10-edb2e421ae4&title=&width=332)


:::info
总结
    通过路由跳转传递id，就可以进行数据查询了
    提交代码
:::
# 根据id获取任务详情数据

:::info
标准流程 

- 定义数据类型
- 封装api
- 获取数据
- 赋值数据
- 显示数据
:::
> basic模块

- 定义一个公共的图片类型
```typescript
// 后续上传 basic模块也需要类型
export interface ImageListModel {
  /** 图片url */
  url: string;
}
```

> **entry模块**

1. 拷贝接口返回的详情类型 [接口文档](https://apifox.com/apidoc/shared-4b036830-59b1-4526-b00a-61df2b3d4ae1/api-71281847)
> apifox生成的接口类型太多重复，直接拷贝下面的接口

```typescript
import { ImageListModel } from '@hm/basic'

/** 响应数据，响应数据 */
export interface TaskDetailInfoModel {
  /** 实际到达时间 */
  actualArrivalTime: string;

  /** 实际发车时间 */
  actualDepartureTime: string;

  /** 提货凭证 */
  cargoPickUpPictureList: ImageListModel[];

  /** 提货图片 */
  cargoPictureList: ImageListModel[];

  /** 回单凭证 */
  certificatePictureList: ImageListModel[];

  /** 回单图片 */
  deliverPictureList: ImageListModel[];

  /** 司机id */
  driverId: string;

  /** 司机姓名 */
  driverName: string;

  /** 目的市 */
  endAddress: string;

  /** 目的机构id */
  endAgencyId: string;

  /** 目的机构详细地址 */
  endCity: string;

  /** 目的省份 */
  endProvince: string;
  exceptionList: ExceptionListModel[];

  /** 交付对接人 */
  finishHandoverName: string;

  /** 交付对接人电话 */
  finishHandoverPhone: string;

  /** 司机作业单id */
  id: string;

  /** 车牌号码 */
  licensePlate: string;

  /** 计划到达时间 */
  planArrivalTime: string;

  /** 计划发车时间 */
  planDepartureTime: string;

  /** 起始机构详细地址 */
  startAddress: string;

  /** 起始机构id */
  startAgencyId: string;

  /** 起始市 */
  startCity: string;

  /** 提货对接人 */
  startHandoverName: string;

  /** 提货对接人电话 */
  startHandoverPhone: string;

  /** 起始省份 */
  startProvince: string;

  /** 作业状态，1为待提货）、2为在途）、3为改派）、4为已交付）、5为已作废、6为已完成（已回车登记） */
  status: number;

  /** 运输任务id */
  transportTaskId: string;
}


export interface ExceptionListModel {
  /** 异常描述 */
  exceptionDescribe: string;

  /** 异常图片 */
  exceptionImagesList: ImageListModel[];

  /** 上报的位置 */
  exceptionPlace: string;

  /** 异常时间 */
  exceptionTime: string;

  /** 异常类型(中文) */
  exceptionType: string;

  /** 处理结果 */
  handleResult: string;
}

```

- 统一导出
```typescript
export * from './task_detail'
```

2. 封装请求任务详情api- task.ets
```typescript
import {  TaskDetailInfoModel } from '../models'

export const getTaskDetailAPI = (id: string) => {
  return Request.get<TaskDetailInfoModel>(`/driver/tasks/details/${id}`)
}
```

3. 在任务详情封装方法，调用，赋值状态显示数据
```typescript
import { HmNavBar, CommonRouterParams } from '@hm/basic'
import { router } from '@kit.ArkUI'
import {   TaskDetailInfoModel } from '../../models'
import { getTaskDetailAPI } from '../../api'

@Entry
@Component
struct TaskDetail {
  @State
  taskDetailData: TaskDetailInfoModel = {} as TaskDetailInfoModel
  aboutToAppear() {
    const params = router.getParams() as CommonRouterParams
    if(params.id) {
      this.getTaskDetail(params.id)
    }
  }
  async getTaskDetail(id: string) {
    this.taskDetailData = await getTaskDetailAPI(id)
  }
  build() {
    Column() {
      HmNavBar({ title: '任务详情' })
      Text(JSON.stringify(this.taskDetailData, null, 2))
    }.backgroundColor($r('app.color.background_page')).
    height('100%')
  }
}
```
在页面中显示数据， 如图
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701532878396-75e4ec03-61c6-4dbb-9f4d-076b34ca24a5.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ececec&clientId=u34c44edc-aee4-4&from=paste&height=699&id=b1r0Q&originHeight=747&originWidth=381&originalType=binary&ratio=2&rotation=0&showTitle=false&size=94988&status=done&style=none&taskId=u9ad35134-aefd-427a-b4a6-cd003d5ade3&title=&width=356.5)

:::info
 提交代码     
:::

# 任务详情结构-封装折叠容器-HmToggleCard

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701533333535-824c282a-0949-4fbb-97dc-f5a4b9c80ba6.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_22%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f6f5&clientId=u34c44edc-aee4-4&from=paste&height=726&id=TRjUf&originHeight=1412&originWidth=772&originalType=binary&ratio=2&rotation=0&showTitle=false&size=198758&status=done&style=none&taskId=ub346c3d7-f03b-46ca-a316-33e0e66cb03&title=&width=397)

> **basic模块**

:::info

- 容器可以展开-可以折叠，
- 可以存放子组件内容
- 可以显示标题
:::
在components下新建 HmToggleCard.ets
```typescript
@Component
struct HmToggleCard {
  title: string = "基本信息"
  @State
  toggleCard: boolean = true // 是否展示
  // 尾随闭包
  @BuilderParam
  CardContent: () => void

  build() {
    Column() {
      Row() {
        Text(this.title)
          .fontSize(16)
          .fontColor($r("app.color.text_primary"))
          .fontWeight(500)
        Image(this.toggleCard ? $r("app.media.ic_btn_cut") : $r("app.media.ic_btn_add"))
          .width(24)
          .aspectRatio(1)
          .onClick(() => {
            animateTo({ duration: 300 }, () => {
              this.toggleCard = !this.toggleCard
            })

          })
      }
      .width("100%")
      .height(50)
      .justifyContent(FlexAlign.SpaceBetween)

      // 外部传入的内容
      if (this.toggleCard && this.CardContent) {
        this.CardContent()
      }
    }
    .backgroundColor($r("app.color.white"))
    .borderRadius(10)
    .padding({
      left: 18,
      right: 18,
      bottom: 18
    })
    .margin({ left: 10, right: 10, top: 10 })

  }
}

export { HmToggleCard }
```
在index.ts中导出
```typescript
export * from './HmToggleCard'
```
> **entry模块**

- 在任务详情中导入测试
```typescript
import {  HmToggleCard } from from  '@hm/basic'

```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701534387348-9022a5a2-29cc-46fd-b410-8de5caddbd00.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_16%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23322d2d&clientId=u34c44edc-aee4-4&from=paste&height=282&id=bKKeS&originHeight=267&originWidth=575&originalType=binary&ratio=2&rotation=0&showTitle=false&size=30303&status=done&style=none&taskId=u54715b30-3b1d-4465-b508-406f0a5a539&title=&width=607.5)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701534399185-cbe18464-018d-4e76-935d-2a42d084bdd7.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eeeeee&clientId=u34c44edc-aee4-4&from=paste&height=774&id=LA8lR&originHeight=639&originWidth=398&originalType=binary&ratio=2&rotation=0&showTitle=false&size=106608&status=done&style=none&taskId=u6fffc61f-71b5-4804-a469-e0c0fb30d8a&title=&width=482)


:::info
提交代码
:::

# 使用Scroll组件实现滚动结构
:::info
注意：
   Scroll有且只能有一个子组件，不要设置Scroll的高度，让内容去自动撑满
:::
```typescript
scroller: Scroller = new Scroller() // 滚动

build() {
    Column () {
      HmNavBar({ title: '任务详情' })
      Scroll(this.scroller) {
        Column() {
          HmToggleCard({ title: '基本信息' }) {
            Text(JSON.stringify(this.taskDetailData))
          }
          HmToggleCard({ title: '基本信息' }) {
            Text(JSON.stringify(this.taskDetailData))
          }
          HmToggleCard({ title: '基本信息' }) {
            Text(JSON.stringify(this.taskDetailData))
          }
        }.padding({
        bottom: 20
      })
      }
    }.backgroundColor($r('app.color.background_page')).height('100%')
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1704037457866-ad463ed5-dcbf-42b6-b309-4425e82ced98.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f4f4f4&clientId=uf891fe4d-2f8e-4&from=paste&height=908&id=BXsKl&originHeight=632&originWidth=295&originalType=binary&ratio=2&rotation=0&showTitle=false&size=102720&status=done&style=none&taskId=u55a9967a-fd7b-457d-a7fc-b34c1f00592&title=&width=424)

:::info
提交代码
:::

# 任务详情静态-基本信息展示
> PushKit
> mpass

:::info
 准备任务详情的静态结构
 ![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701535331882-14d54522-a213-46bb-98dd-619270f7d4ca.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_18%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f8f7f7&clientId=u34c44edc-aee4-4&from=paste&height=332&id=gXM0j&originHeight=664&originWidth=640&originalType=binary&ratio=2&rotation=0&showTitle=false&size=122620&status=done&style=none&taskId=ua13e0cca-9f5e-4960-8ba1-074fb9faa76&title=&width=320)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701535380436-911eb87f-9bb7-4806-ac02-0148db749853.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_18%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f8f8f8&clientId=u34c44edc-aee4-4&from=paste&height=279&id=DsEzn&originHeight=558&originWidth=648&originalType=binary&ratio=2&rotation=0&showTitle=false&size=52005&status=done&style=none&taskId=u40de1a3e-92ea-4735-9159-87808c7f556&title=&width=324)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701535393077-7c31b71a-853e-4716-a146-f16684bf68db.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_19%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fafafa&clientId=u34c44edc-aee4-4&from=paste&height=361&id=I6DQp&originHeight=722&originWidth=668&originalType=binary&ratio=2&rotation=0&showTitle=false&size=33163&status=done&style=none&taskId=u0408b1df-2eee-4e0e-8af4-7c92ee92921&title=&width=334)
设计图中的货物详情-因接口没有实际数据，所以不在实现。
:::

1. 实现基本信息数据展示-拷贝静态结构
```typescript
@Extend(Text)
function baseTextIconStyle() {
  .fontSize(12)
  .fontColor($r('app.color.white'))
  .backgroundColor($r('app.color.text_primary'))
  .width(22)
  .height(22)
  .borderRadius(11)
  .textAlign(TextAlign.Center)
}

@Extend(Text)
function baseTextStyle() {
  .margin({ left: 11.5 })
  .fontColor($r('app.color.text_secondary'))
  .fontSize(14)
  .lineHeight(20)
}
```

- 准备一个class提供给builder函数使用
> builder里面的数据 如果用传参数的形式- 基础数据不响应  引用数据类型是响应式的
> ~~builder($$: { title: string, name: string }) . Next版本不允许这种声明类型的方式~~

```typescript
interface BaseBuilderClass {
  title: string
  value: string
  icon?: ResourceStr
}
```
> 同学们问： 为什么这里不在models中声明了，因为这里只是在我们业务组件内容进行一个简单的使用，不涉及以后的数据通用型，所以在这里使用是可以的

自定义builder
```typescript
  @Builder
  getBaseContentItem(item: BaseBuilderClass) {
    Row() {
      Text(item.title).fontSize(14).fontColor($r('app.color.text_secondary'))
        .lineHeight(20)
      Row() {
        Text(item.value).fontSize(14).fontColor($r('app.color.text_secondary'))
        if (item.icon) {
          Image(item.icon).width(24).height(24)
        }
      }
    }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({
      top: 14
    })
  }

  // 获取基础信息
  @Builder
  getBaseContent() {
    Row() {
      Column() {
        Row() {
          Text("起").baseTextIconStyle()
          Text("北京市昌平区回龙观街道西三旗桥东金燕龙写字楼8877号").baseTextStyle()
        }.margin({ top: 21 })

        Row() {
          Text("止").baseTextIconStyle().backgroundColor($r('app.color.primary'))
          Text("河南省郑州市路北区北清路99号").baseTextStyle()
        }.margin({ top: 14.5 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ right: 20 })

      Column() {
        Image($r("app.media.ic_navigation")).width(22).height(22)
        Text("开始导航").fontSize(14).margin({ top: 10, bottom: 10 })
      }.justifyContent(FlexAlign.SpaceBetween)
      .margin({
        top: 20
      })

    }.justifyContent(FlexAlign.SpaceBetween).alignItems(VerticalAlign.Center).width('100%')
    
    Divider().vertical(false).height(2).color($r('app.color.background_divider')).margin({ left: 8, right: 8, top: 21 })
    
    this.getBaseContentItem({
      title: '任务编号',
      value: '2132324324343434'
    })
    this.getBaseContentItem({
      title: '联系人',
      value: '2132324324343434'
    })
    this.getBaseContentItem({
      title: '联系电话',
      value: '2132324324343434',
      icon: $r('app.media.ic_phone')
    })
    this.getBaseContentItem({
      title: '提货时间',
      value: '2132324324343434'
    })
    this.getBaseContentItem({
      title: '预计送达时间',
      value: '2132324324343434'
    })

  }
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701538608322-cbde23fa-06dd-4875-b60e-6314cf8ef47f.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_12%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eaeaea&clientId=uf366c8bb-79d1-4&from=paste&height=458&id=u5ljD&originHeight=430&originWidth=407&originalType=binary&ratio=2&rotation=0&showTitle=false&size=43385&status=done&style=none&taskId=u370329bf-ccf3-4b0f-a5ae-2ebdcaf6733&title=&width=433.5)

替换为真实数据
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701538995636-0d067b46-314f-4b09-8a0a-65aeba324b84.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f8f7f7&clientId=uf366c8bb-79d1-4&from=paste&height=346&id=gwpkr&originHeight=347&originWidth=379&originalType=binary&ratio=2&rotation=0&showTitle=false&size=28925&status=done&style=none&taskId=uba13bf7f-1895-4bd1-a6dc-b62f650be23&title=&width=377.5)

```typescript
this.getBaseContentItem({
      title: '任务编号',
      value:  this.taskDetailData.transportTaskId
    })
    this.getBaseContentItem({
      title: '联系人',
      value: this.taskDetailData.startHandoverName
    })
    this.getBaseContentItem({
      title: '联系电话',
      value: this.taskDetailData.startHandoverPhone,
      icon: $r('app.media.ic_phone')
    })
    this.getBaseContentItem({
      title: '提货时间',
      value: this.taskDetailData.planDepartureTime
    })
    this.getBaseContentItem({
      title: '预计送达时间',
      value: this.taskDetailData.planArrivalTime
    })
```

- 准备builder函数
```typescript
 // 司机信息
  @Builder
  getDriverContent() {

    this.getBaseContentItem({
      title: '车牌号',
      value: "京A123456"
    })

    this.getBaseContentItem({
      title: '司机姓名',
      value: "张三"
    })

  }

  // 运输路线
  @Builder
  getTransLineContent() {
    Row() {
      Column() {
        Text("北京市").fontSize(16).fontColor($r('app.color.text_primary')).lineHeight(22).fontWeight(600)
        Text("北京市").fontSize(14).lineHeight(22)
      }.width(50)

      Image($r("app.media.ic_right_arrow")).width(36).height(16)
      Column() {
        Text("河南省").fontSize(16).fontColor($r('app.color.text_primary')).lineHeight(22).fontWeight(600)
        Text("郑州市").fontSize(14).lineHeight(22)
      }.width(50)
    }.justifyContent(FlexAlign.SpaceBetween).alignItems(VerticalAlign.Center).width('100%').padding({
      left: 60,
      right: 60
    })
  }
```

- 放置车辆司机信息和运输路线插槽
```typescript
build() {
    Column () {
      HmNavBar({ title: '任务详情' })
      Scroll(this.scroller) {
        Column() {
          HmToggleCard({ title: '基本信息' }) {
            this.getBaseContent()
          }
          HmToggleCard({ title: '车辆司机信息' }) {
            this.getDriverContent()
          }
          HmToggleCard({ title: '运输路线' }) {
            this.getTransLineContent()
          }
        }.padding({
          bottom: 20
        })
         .layoutWeight(1)
      }
    }.backgroundColor($r('app.color.background_page')).height('100%')
  }
```
替换真实的数据
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701595054064-eb02cefa-b7a6-4fab-9e10-a61b2186852c.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_32%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232f2d2d&clientId=u8cef0106-e778-4&from=paste&height=246&id=zKhyB&originHeight=447&originWidth=1136&originalType=binary&ratio=2&rotation=0&showTitle=false&size=79371&status=done&style=none&taskId=u752d02ce-7d75-44dc-8aa9-f13319278bc&title=&width=625)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701595126031-db227400-bedb-4c9c-930e-033e60735398.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_21%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23343030&clientId=u8cef0106-e778-4&from=paste&height=353&id=gyImq&originHeight=421&originWidth=741&originalType=binary&ratio=2&rotation=0&showTitle=false&size=69784&status=done&style=none&taskId=u8793d365-552c-4552-8bcf-6447dbf3474&title=&width=621.5)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701595161885-67319231-3c4c-4dff-97ea-ec0f96be420e.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f8f8f8&clientId=u8cef0106-e778-4&from=paste&height=819&id=gMqQE&originHeight=603&originWidth=288&originalType=binary&ratio=2&rotation=0&showTitle=false&size=28559&status=done&style=none&taskId=u59e78420-5a3d-4eac-9f29-ccebcca58ab&title=&width=391)

:::info
总结
   使用静态模版，利用插槽技术，替换真实数据
   提交代码
:::

# 提货信息-上传组件HmUpload基本封装
> **basic模块**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701595297435-09c0222e-ea91-4368-a756-fefa9d070329.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fbfbfb&clientId=u8cef0106-e778-4&from=paste&height=462&id=LXaQp&originHeight=924&originWidth=850&originalType=binary&ratio=2&rotation=0&showTitle=false&size=51291&status=done&style=none&taskId=u1bd8df31-4c0a-47d5-b7a4-e2deeab408d&title=&width=425)
:::info
分析
    需要上传组件进行图片的上传，我们需要封装一个公共的组件HmUpload
    先完成基本的布局
:::

1. 新建components下的HmUpload.ets文件， 完成最基本布局

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701595782954-3f57f0e6-152e-4f94-8940-fab72676155d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fbfbfb&clientId=u8cef0106-e778-4&from=paste&height=187&id=DOofS&originHeight=374&originWidth=830&originalType=binary&ratio=2&rotation=0&showTitle=false&size=18330&status=done&style=none&taskId=u0e7b3dcc-f6a5-4cd6-a232-7b27dacd916&title=&width=415)
```typescript
@Component
export struct HmUpload {
  title: string = ""
  build() {
    Column() {
      Text(this.title).fontSize(14).fontColor($r("app.color.text_secondary")).margin({
        top: 16,
        bottom: 16
      })
      Row() {
        Image($r("app.media.ic_add_img")).width(30).height(30)
      }
      .width(95)
      .height(95)
      .backgroundColor('#F2F2F2')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }.alignItems(HorizontalAlign.Start).width('100%')
  }
}

```

2. 在components/index.ets导出
```typescript
export * from './HmUpload'
```
> **Entry模块**

3. 在TaskDetail中使用
```typescript
 // 提货信息内容
  @Builder
  getPickUpContent() {
    HmUpload({ title: '请拍照上传回单凭证' })
    HmUpload({ title: '请拍照上传货品照片' })
  }
  build() {
    Column() {
      HmNavBar({ title: '任务详情' })
      Scroll(this.scroller) {
        Column() {
          HmToggleCard({ title: '基本信息' }) {
            this.getBaseContent()
          }

          HmToggleCard({ title: '车辆司机信息' }) {
            this.getDriverContent()
          }

          HmToggleCard({ title: '运输路线' }) {
            this.getTransLineContent()
          }

          HmToggleCard({ title: '提货信息' }) {
            this.getPickUpContent()
          }
        }.padding({
          bottom: 120
        })
      }
    }.backgroundColor($r('app.color.background_page')).height('100%')
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701597953780-9cf90d56-57d3-4b1d-921f-8387c08df912.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_14%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f7f7&clientId=u945aad58-02cf-4&from=paste&height=432&id=Xgu76&originHeight=329&originWidth=308&originalType=binary&ratio=2&rotation=0&showTitle=false&size=10022&status=done&style=none&taskId=u1d439671-64b8-4ee5-bda4-7e6b9e9e8e7&title=&width=404)
:::info
总结
   先封装HmUpload的基本结构，后续再去实现上传
    提交代码
:::

# 任务详情-底部提货按钮结构
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701598051975-8beff512-3dc4-4c0c-8bdb-c7e788e71e33.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f4eeed&clientId=u945aad58-02cf-4&from=paste&height=161&id=FVADk&originHeight=272&originWidth=718&originalType=binary&ratio=2&rotation=0&showTitle=false&size=21362&status=done&style=none&taskId=u8a3759e1-a804-4069-8709-d1d9898a40b&title=&width=426)
:::info
实现上传组件前，先把底部的提交结构实现
:::

1. 从静态页面中拷贝结构
```typescript
  // 底部按钮结构
  @Builder
  getBottomBtn() {
    //已完成不显示任何按钮
    Row() {
      Button("延迟收货", { type: ButtonType.Capsule })
        .backgroundColor($r('app.color.btn_gray'))
        .fontColor($r('app.color.text_primary'))
        .fontSize(16)
        .height(50)
        .width(125)
      Button("提货", { type: ButtonType.Capsule })
        .backgroundColor($r('app.color.primary_disabled'))
        .fontColor($r('app.color.white'))
        .height(50)
        .flexGrow(1)
        .margin({ left: 13 })
    }
    .width('100%')
    .padding({ left: 15, right: 15 })
    .height(70).
     justifyContent(FlexAlign.SpaceBetween).
    alignItems(VerticalAlign.Center)
    .backgroundColor($r('app.color.white'))
  }
```

2. 放置在Scroll组件的同级，因为我们希望底部按钮是不滚动的
```typescript
build() {
    Column() {
      HmNavBar({ title: '任务详情' })
      Scroll(this.scroller) {
        Column() {
          HmToggleCard({ title: '基本信息' }) {
            this.getBaseContent()
          }

          HmToggleCard({ title: '车辆司机信息' }) {
            this.getDriverContent()
          }

          HmToggleCard({ title: '运输路线' }) {
            this.getTransLineContent()
          }

          HmToggleCard({ title: '提货信息' }) {
            this.getPickUpContent()
          }
        }.padding({
          bottom: 20
        })
        .layoutWeight(1)
        
      }
      this.getBottomBtn() // 底部按钮结构
    }.backgroundColor($r('app.color.background_page')).height('100%')
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701598705183-716f70ea-17c7-49d2-b3f3-7ecdf2a5f3c4.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_14%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f0efef&clientId=ud3736757-6d1b-4&from=paste&height=319&id=MCl37&originHeight=637&originWidth=320&originalType=binary&ratio=2&rotation=0&showTitle=false&size=34139&status=done&style=none&taskId=u3f41f3e1-5b39-4b0f-96f2-576ea64f9ea&title=&width=160)

:::info
总结
   提交代码
:::
# 添加骨架屏判断
```typescript
 build() {
    Column () {
      if(this.taskDetailData.id) {
        HmNavBar({ title: '任务详情' })
        Scroll(this.scroller) {
          Column() {
            HmToggleCard({ title: '基本信息' }) {
              this.getBaseContent()
            }
            HmToggleCard({ title: '车辆司机信息' }) {
              this.getDriverContent()
            }
            HmToggleCard({ title: '运输路线' }) {
              this.getTransLineContent()
            }
            HmToggleCard({ title: '提货信息' }) {
              this.getPickUpContent()
            }
          }
        }
        .padding({
          bottom: 20
        })
        .layoutWeight(1)
        this.getBottomBtn() // 底部按钮结构
      }else {
        HmSkeleton({ count: 4, showAvatar: false })
      }

    }.backgroundColor($r('app.color.background_page')).height('100%')
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713238421599-fc46a2d0-b001-4ec4-8571-f3811bef2e2d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ada89d&clientId=u29b53ccd-93e0-4&from=paste&height=721&id=kJXCs&originHeight=721&originWidth=328&originalType=binary&ratio=1&rotation=0&showTitle=false&size=19470&status=done&style=none&taskId=u70fdfa26-239d-4890-8d2f-3e07540ab63&title=&width=328)
> 提交代码

# 在其他项目上新建一个工具
:::info
因为模拟器不让拖动图片到相册目录，所以我们只能自己手动的将线上的图片下载到相册
:::

- 在pages/Index.ets中实现

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1708441095494-81ffd97d-d6aa-476a-ae0c-d287491497c8.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_25%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23dbd4c3&clientId=ub4b1f1b1-df07-4&from=paste&height=902&id=zTrA8&originHeight=1804&originWidth=882&originalType=binary&ratio=1&rotation=0&showTitle=false&size=531804&status=done&style=none&taskId=u2f910b90-5800-4e6e-a185-dd9eb76b92c&title=&width=441)

- 点击按钮拷贝图片

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1708441160962-f2f35277-acb7-4a09-a180-01a53f84a143.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23464e46&clientId=ub4b1f1b1-df07-4&from=paste&height=608&id=Z7lfa&originHeight=934&originWidth=832&originalType=binary&ratio=1&rotation=0&showTitle=false&size=346782&status=done&style=none&taskId=u49178f9b-7d06-45df-973b-1d06ddf89f0&title=&width=542)

:::success
项目仓库地址： [https://gitee.com/shuiruohanyu/copy_image](https://gitee.com/shuiruohanyu/copy_image)
:::
# 上传功能-唤出相册- 拿到选择图片
> **basic模块**

1. 点击上传区域，弹出图片选择器
```typescript
// 弹出相册选择器
  selectImage () {
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.select({
      MIMEType: picker.PhotoViewMIMETypes.IMAGE_TYPE,
      maxSelectNumber: 3
    })
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701599446271-a2615d3b-fdc5-4550-9343-4946ddb47ee4.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_18%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232f2d2d&clientId=ub009f38e-ad51-4&from=paste&height=237&id=evQca&originHeight=301&originWidth=621&originalType=binary&ratio=2&rotation=0&showTitle=false&size=34222&status=done&style=none&taskId=u34dca9b6-22bd-45a4-9602-d02dc668fd1&title=&width=489.5)

2. 将图片选择数量设置为可选

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701599503804-fce3724a-1049-409e-ad88-b9b7cbadd6db.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23332f2f&clientId=ub009f38e-ad51-4&from=paste&height=252&id=G6Uhh&originHeight=350&originWidth=716&originalType=binary&ratio=2&rotation=0&showTitle=false&size=37090&status=done&style=none&taskId=u6607102f-d4c2-4bcb-aae6-838f29fd343&title=&width=516)
此时可以在使用HmUpload时，自由传入maxNumber属性来控制数量

3. 获取选择后的图片列表

接收返回的选择图片列表
```typescript
// 弹出相册选择器
   async selectImage () {
    let photoPicker = new picker.PhotoViewPicker();
    const result = await photoPicker.select({
      MIMEType: picker.PhotoViewMIMETypes.IMAGE_TYPE,
      maxSelectNumber: this.maxNumber
    })
     AlertDialog.show({
       message: JSON.stringify(result.photoUris)
     })
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701600058734-e1fb7277-5399-4987-821c-18cd76db4c6c.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e1e1e1&clientId=ub009f38e-ad51-4&from=paste&height=215&id=KKVi6&originHeight=155&originWidth=292&originalType=binary&ratio=2&rotation=0&showTitle=false&size=9832&status=done&style=none&taskId=u1c98c250-a37b-4b0a-8ef1-dbc8ecf63e7&title=&width=405)

:::info
 总结
   1. 通过file.picker的图片选择器选择图片，得到了一些临时路径
   2. 临时路径要传到我们自己的服务器-待实现
   3. 提交代码
:::

# 拿到图片先将图片显示到预览区

- 声明一个数组来管理选择的图片
```typescript
  @State
  imageList: ImageList[] = [] 
```

- 将选择的图片赋值给状态
```typescript
   // 循环数组
    if (result.photoUris?.length) {
      this.imageList = result.photoUris.map(url => {
        return { url } as ImageList
      })
    }
```

- 循环渲染图片
```typescript
 // 渲染图片
      Grid() {
        ForEach(this.imageList, (item: ImageList) => {
          GridItem() {
            Image(item.url)
              .width(95)
              .height(95)
              .borderRadius(4)
          }
        })
        if(this.imageList.length < this.maxNumber) {
          GridItem() {
            Row() {
              Image($r("app.media.ic_add_img")).width(30).height(30)
            }
            .width(95)
            .height(95)
            .backgroundColor($r("app.color.upload_panel"))
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .onClick(() => {
              this.selectImage()
            })
          }
        }
      }
      .height(Math.ceil(this.maxNumber / 3 ) * 105)
      .columnsTemplate("1fr 1fr 1fr")
      .columnsGap(10)
```

- 发现问题
:::success
当选择了两张之后，再选一张，发现只剩最后一次选的一张图片了，这是因为我们之前用的直接替换，
随意这里我们对图片的选择的图片张数做一下限制
:::
```typescript
  const photoPicker = new picker.PhotoViewPicker()
    const result = await photoPicker.select({
      MIMEType: picker.PhotoViewMIMETypes.IMAGE_TYPE,
      maxSelectNumber: this.maxNumber - this.imageList.length
    })
```

- 然后进行追加
```typescript
 // 循环数组
    if (result.photoUris?.length) {
      this.imageList = this.imageList.concat(result.photoUris.map(url => {
        return { url } as ImageListModel
      }))
    }
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1708487837079-3504fcdd-d387-4685-a7e4-890841d33abe.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23efece5&clientId=ud46875f4-6c05-4&from=paste&height=195&id=LdKyn&originHeight=195&originWidth=326&originalType=binary&ratio=1&rotation=0&showTitle=false&size=25190&status=done&style=none&taskId=u976c1dc2-23a3-4550-a8ac-ba5551102e9&title=&width=326)
:::success
提交代码
:::

# 封装图片预览HmPreview
> **basic模块**

:::info
分析，当我们上传的图片时，我们希望可以去放大预览该图片
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701659049216-14f4218f-16e7-4575-b5b9-e8bf17e07f5d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_10%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23efebe8&clientId=u92cda727-c2b6-4&from=paste&height=228&id=fqLBY&originHeight=307&originWidth=354&originalType=binary&ratio=2&rotation=0&showTitle=false&size=25522&status=done&style=none&taskId=u57138bc0-76ba-4ea7-a2ed-0ab9e2ba197&title=&width=263)
并且图片还支持多张一起， 比如上传了三张，点第二张可以预览，左右滑可以切到第一张和第三张
:::

1. 新建components/HmPreview.ets文件
```typescript
@CustomDialog
@Component
struct HmPreview {
  controller: CustomDialogController
  // 支持多张图片预览  给多张地址 给一个需要预览的索引
  urls: string[] = [] // 多张地址
  selectIndex:number = 0 // 当前索引
  build() {
    Column() {
       Swiper() {
         ForEach(this.urls, (url: string) => {
           Image(url)
             .width("100%") // 只给宽度 不给高度 让自己撑开
             .onClick(() => {
               this.controller.close()
             })
         })
       }
      .indicator(false) // 去掉点的显示
      .index(this.selectIndex) // 当前要看的是第几张图片

    }
    .justifyContent(FlexAlign.Center)
    .width("100%")
    .height("100%")
    .backgroundColor($r("app.color.black"))
  }
}
export { HmPreview }
```
在components/index.ets导出
```typescript
export * from './HmPreview'
```

- 在HmUpload中引入，并初始化dialogController
```typescript
import { HmPreview } from './HmPreview'

preview = new CustomDialogController({
    builder: HmPreview({
      urls: this.imageList.map(item => item.url),
      selectIndex: this.index
    }),
    customStyle: true, // 自定义样式
  })
```

- 在HmUpload中声明index属性
```typescript

index: number = -1
```

- 切换点击图片时，切换索引, 打开弹层
```typescript
 ForEach(this.imageList, (item: ImageListModel, index) => {
          GridItem() {
            Image(item.url)
              .width(95)
              .height(95)
              .onClick(() => {
                this.index = index
                this.preview.open()
              })
          }
        })
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701660525432-1ca90ff2-dbe2-4798-900b-22e71ce51334.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_12%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%231e1d1a&clientId=u92cda727-c2b6-4&from=paste&height=398&id=YzYTI&originHeight=795&originWidth=416&originalType=binary&ratio=2&rotation=0&showTitle=false&size=59762&status=done&style=none&taskId=u8093d2c0-0bb1-4bcb-9ed9-fb63f431ee7&title=&width=208)

:::info
提交代码
:::
# 接收父组件传入
:::success
因为图片的来源有可能是已经有的图片，所以我们需要外部传入该图片列表
:::

- 将State修饰符变成Prop修饰符
```typescript
  @Prop
  imageList: ImageList[] = []
```
> **entry模块**

- 在提货详情的页面中进行传入
```typescript
 @Builder
  getPickUpContent() {
    HmUpload({ title: '请拍照上传货品凭证',
      imageList: this.taskDetailData.cargoPickUpPictureList || []
    })
    HmUpload({ title: '请拍照上传货品照片',
      imageList: this.taskDetailData.cargoPictureList || []
    })
  }
```
:::success
当图片地址发生变化时，通知父组件更新
:::
> **basic模块**

- 在HmUpload中定义一个外部传入的函数
```typescript
  onImageListChange: (list: ImageListModel[]) => void = () => {} 
```

- 在selectImage方法中选择完毕图片之后调用该方法
```typescript
 // 循环数组
    if (result.photoUris?.length) {
      this.imageList = this.imageList.concat(result.photoUris.map(url => {
        return { url } as ImageListModel
      }))
      this.onImageListChange(this.imageList)
    }
```

- 父组件传入函数更新对应的字段
> **entry模块**

```typescript
 // 专门负责提货信息的结构
  @Builder
  getPickUpContent() {
    HmUpload({ title: '请拍照上传货品凭证',
      imageList: this.taskDetailData.cargoPickUpPictureList || [],
      onImageListChange: (list: ImageListModel[]) => {
        this.taskDetailData.cargoPickUpPictureList = list
      }
    })
    HmUpload({ title: '请拍照上传货品照片',
      imageList: this.taskDetailData.cargoPictureList || [],
      onImageListChange: (list: ImageListModel[]) => {
        this.taskDetailData.cargoPictureList = list
      }
    })
  }
```

- 根据提货图片存在判断是否可点击按钮
```typescript
 // 获取提货的状态
  getPickUpState() {
    return this.taskDetailData.cargoPickUpPictureList?.length > 0 &&
    this.taskDetailData.cargoPictureList?.length > 0
  }
```

- 设置状态
```typescript
  Button("提货", { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.primary'))
          .fontColor($r('app.color.white'))
          .height(50)
          .flexGrow(1)
          .margin({ left: 13 })
          .enabled(this.getPickUpState())
```
:::success
提交代码
:::
# 沙箱文件拷贝
:::info
官网上传案例-[链接](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-request-0000001428061972-V3#ZH-CN_TOPIC_0000001574248669__requestuploadfile9)

1. 上传文件我们需要使用官方的uploadFile方法
:::
:::success
我们需要在点击提货按钮时，将所有的图片进行上传， 并且监听上传进度，显示在页面上
:::

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701600470467-01e53c0b-079d-4f88-abf3-a2a32305d620.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_49%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f6f6f6&clientId=ub009f38e-ad51-4&from=paste&height=490&id=d6vV8&originHeight=980&originWidth=1716&originalType=binary&ratio=2&rotation=0&showTitle=false&size=147565&status=done&style=none&taskId=u09941929-5d3d-4cf5-9869-69bf5d91deb&title=&width=858)
:::info
第一个参数 context可以直接使用 getContext(this)获得
第二个参数的config参数为
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701600527471-2af23ee8-160a-4ad3-86b0-faa467cb3280.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_46%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f7f7&clientId=ub009f38e-ad51-4&from=paste&height=409&id=UzSMB&originHeight=818&originWidth=1624&originalType=binary&ratio=2&rotation=0&showTitle=false&size=108657&status=done&style=none&taskId=u6fdd0710-a0da-4698-8d3b-21a6b3d891d&title=&width=812)
其中File的参数为
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701600562959-fbfe266e-2b5f-4736-9526-a3e74b24c1fc.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_47%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f7f7&clientId=ub009f38e-ad51-4&from=paste&height=494&id=nsc8n&originHeight=988&originWidth=1638&originalType=binary&ratio=2&rotation=0&showTitle=false&size=131008&status=done&style=none&taskId=u6948f3fa-0098-4034-9c23-3a02c17b31d&title=&width=819)
:::

> 综上分析，我们需要得到File中的uri这个属性，uri属性仅支持“internal”协议类型

但是我们通过弹窗发现，前面所得到的图片路径为
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701600653731-42e538d7-66d7-452a-857b-b5c9b5b4bc7e.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_19%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fbfbfb&clientId=ub009f38e-ad51-4&from=paste&height=129&id=m1tHK&originHeight=220&originWidth=654&originalType=binary&ratio=2&rotation=0&showTitle=false&size=43434&status=done&style=none&taskId=ud606d283-4eb3-4fdb-bbb4-f919d70aa8a&title=&width=384)

:::info
格式不匹配 ！！！
  需要转化
怎么转？
我们需要将选择的图片列表 一个个的拷贝到cache目录下，得到cache目录后新的目标路径
[应用沙箱文件官网介绍](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/app-sandbox-directory-0000001491863498-V3)
:::
> **basic模块**

- 在HmUpload中导出一个上传方法
```typescript
export const UploadFile = (list: ImageListModel[]) => {}
```
```typescript
import fs from '@ohos.file.fs';
import { util } from '@kit.ArkTS';
// 上传方法
export const UploadFile = (list: ImageListModel[]) => {
  // 因为上传文件只能从沙箱文件中拷贝所以 我们需要把传过来的所有的图片拷贝到沙箱
  const saveDir = getContext().cacheDir // 存储的目录
  const fileParams: request.File[] = [] // 要提交的参数
  list.forEach(item => {
    const file = fs.openSync(item.url, fs.OpenMode.READ_ONLY) // 读取相册的文件
    // 将文件拷贝到沙箱目录
     // 相册的地址
    const uniqueName = util.generateRandomUUID() + ".jpg"
    fs.copyFileSync(file.fd, saveDir + "/" + uniqueName) // 将相册文件拷贝到沙箱
    // 需要生成参数
    fileParams.push({
      filename: uniqueName, // 文件名称
      name: 'file', // 接口的参数名称
      type: 'jpg', // 文件后缀
      uri: `internal://cache/${uniqueName}` // 应该是文件放到cache目录下 如果是cache协议 它会自动找这个文件
    })
    fs.closeSync(file.fd)
  })
  AlertDialog.show({ message: JSON.stringify(fileParams) })

}
```


- 得到对应的路径

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1714052997764-c43a1f32-27ae-4b3a-bc83-fe19e7daf237.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d2cbc9&clientId=u12fb068a-12c7-4&from=paste&height=392&id=hSDx3&originHeight=392&originWidth=449&originalType=binary&ratio=1&rotation=0&showTitle=false&size=84511&status=done&style=none&taskId=ubd1a95ea-c34e-4c70-892f-a7a03ba8a5a&title=&width=449)
> 总结
> - 文件上传必须先把文件拷贝到沙箱文件中
> - 沙箱文件最终要上传时需要需要internal://cache目录 + 自己的文件路径
> 
    提交代码

# 封装上传文件的api
:::info
现在上传组件已经准备好了参数，我们封住一个统一的上传api
:::
在api下新建upload.ets
```typescript
import request from '@ohos.request'
import { BASE_URL, TOKEN_KEY } from '../constants'
import { ImageListModel } from '../models'
import { ResponseData } from '../utils'

// 返回一个列表 ImageListModel[]
export const uploadImageAPI = async (context: Context, files: request.File[]) => {
  let config: request.UploadConfig = {
    url: BASE_URL + '/files/imageUpload', // 拼接上传完整地址
    method: 'POST',
    header: {
      Authorization: AppStorage.get(TOKEN_KEY) || "", // 应用中的token
      "Content-Type": "multipart/form-data" // 上传文件的参数类型
      // application/json  { name: '张三', age: 18 }
      // application/x-www-form-urlencoded 拼接   name=张三&age=18
      // text/xhtml 结构
      // multipart/form-data  专门传文件的结构
    },
    files,
    data: [] // 用不上
  }
  return new Promise<ImageListModel[]>(async (resolve, reject) => {
    try {
      let arr: ImageListModel[] = []
      const task = await request.uploadFile(context, config) // 成功执行并不意味着 上传成功 只是任务创建成功
      task.on("fail", () => {
        // 上传失败
        AlertDialog.show({
          message: "上传失败"
        })
        reject(new Error("上传失败"))
      })
      // 每上传成功一次就会进来
      task.on("headerReceive", (headers: object) => {
        if (headers["body"]) {
          const result = JSON.parse(headers["body"]) as ResponseData<string>
          if (result.code === 200) {
            arr.push({
              url: result.data as string
            })
          }
        }
      })
      task.on("complete", () => {
        // 上传完成
        // 也不能拿到上传成功的地址
        // 走到这里认为 要返回的结构已经ok了
        resolve(arr)
      })

    }catch(error) {
      AlertDialog.show({
        message: error.message // 提示错误消息
      })
      reject(error)
    }
  })

}
```

- 在api/index.ets中导出
```typescript
export * from './upload'
```

- 在HmUpload组件的UploadFile方法中调用
```typescript
export const UploadFile = async (list: ImageListModel[]) => {
  const saveDir = getContext().cacheDir // 存储的目录
  const fileParams: request.File[] = [] // 要提交的参数
  list.forEach(item => {
    const file = fs.openSync(item.url, fs.OpenMode.READ_ONLY) // 读取相册的文件
    // 将文件拷贝到沙箱目录
    // 相册的地址
    const uniqueName = util.generateRandomUUID() + ".jpg"

    const targetFolder = saveDir + "/" + uniqueName

    fs.copyFileSync(file.fd, targetFolder) // 将相册文件拷贝到沙箱
    // 需要生成参数
    fileParams.push({
      filename: uniqueName, // 文件名称
      name: 'file', // 接口的参数名称
      type: 'jpg', // 文件后缀
      uri: `internal://cache/${uniqueName}` // 应该是文件放到cache目录下 如果是cache协议 它会自动找这个文件
    })
    fs.closeSync(file.fd)
  })

  return await uploadImageAPI(getContext(), fileParams)
}
```

:::info
    提交代码
:::
# 提货时上传
> **entry模块**

1. 拷贝接口类型-[接口文档](https://apifox.com/apidoc/shared-4b036830-59b1-4526-b00a-61df2b3d4ae1/api-71297181)
- 新建一个pickup提货的ets类型声明文件- models/pickup.ets
```typescript
import { ImageListModel } from '@hm/basic'
export interface PickUpParamsModel {
  /** 提货凭证照片数组 */
  cargoPickUpPictureList: ImageListModel[];
  /** 提货照片数组 */
  cargoPictureList: ImageListModel[];
  /** 司机作业id */
  id: string;
}
```

- 导出统一的文件
```typescript
export * from './pickup'
```

- 封装提货接口
```typescript
import { PickUpParamsModel } from '../models'

// 提货
export const pickUpAPI = (data: PickUpParamsModel) => {
  return Request.post<null>("/driver/tasks/takeDelivery", data)
}
```

3. 提货点击事件-调用api
```typescript
// 去提货
  async onPickUp() {
    const cargoPickUpPictureList = await UploadFile(this.taskDetailData.cargoPickUpPictureList) // 传入提货凭证
    const cargoPictureList = await UploadFile(this.taskDetailData.cargoPictureList) // 货品照片
    // 提货操作
    await pickUpAPI({
      id: this.taskDetailData.id,
      cargoPickUpPictureList,
      cargoPictureList
    })
    // 只需要重新获取数据
    // 重新获取数据
    this.getTaskDetail(this.taskDetailData.id) // 重新拉取数据

    this.scroller.scrollEdge(Edge.Top)
    // 滚动到顶部
    promptAction.showToast({ message: '提货成功' })

  }
```
点击事件
```typescript
 Button("提货")
 ....
.onClick(() => {
       this.onPickUp()
   })
```

:::info
总结
    提交代码
:::
# 实现删除图片
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701605894854-6dcb7dc3-8fa4-42ee-9f7e-fcb2775761ba.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_28%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ccb4a3&clientId=ub009f38e-ad51-4&from=paste&height=212&id=lZCoQ&originHeight=424&originWidth=994&originalType=binary&ratio=2&rotation=0&showTitle=false&size=207180&status=done&style=none&taskId=u909f1e05-4c68-46f7-968d-1e32a334048&title=&width=497)

1. 在图片中放入右上角的图标
```typescript
 ForEach(this.imageList, (item: ImageList, index: number) => {
          GridItem() {
            Stack({ alignContent: Alignment.TopEnd }) {
              Image(item.url)
                .width(95)
                .height(95)
                .borderRadius(4)
                .onClick(() => {
                  this.index = index
                  this.preview.open()
                })
              Image($r('app.media.ic_btn_delete')).width(30).height(30)
            }.margin({ right: 15, bottom: 10 })
          }
        })
```

2. 注册点击事件-处理数据更新
```typescript
 Image($r('app.media.ic_btn_delete')).width(30).height(30)
                .onClick(() => {
                  this.imageList.splice(index, 1) // 移除索引
                  this.onImageListChange(this.imageList) // 通知父组件更新
                })
```
:::info
测试并提交代码
:::
# 加载进度遮罩
> **basic模块**

- 封装一个HmLoading的组件，用过弹层
```typescript
@CustomDialog
@Component
@Preview
export struct HmLoading {
  controller: CustomDialogController
  title: string = '数据处理中..'

  build() {
    Row({ space: 6 }) {
      Text(this.title)
        .fontSize(16)
        .fontColor($r("app.color.text_primary"))
      LoadingProgress()
        .width(30)
        .height(30)
        .color($r("app.color.primary"))
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor("rgba(0,0,0,0.1)")
  }
}
```

- 在TaskDetail中定义loading弹出层的对象
```typescript
 loading = new CustomDialogController({
    builder: HmLoading(),
    customStyle: true
  })
```

- 加载前后打开和关闭
```typescript
 async getTaskDetail(id: string) {
    this.loading.open()
    this.taskDetailData = await getTaskDetailAPI(id)
    this.loading.close()
  }
```

- 提货前后打开和关闭弹窗
```typescript
 async toPickUp () {
    this.loading.open()
    const cargoPictureList = await UploadFile(this.taskDetailData.cargoPictureList)
    const cargoPickUpPictureList = await UploadFile(this.taskDetailData.cargoPickUpPictureList)
    await pickUpAPI({
      id: this.taskDetailData.id,
      cargoPickUpPictureList: cargoPictureList,
      cargoPictureList: cargoPickUpPictureList
    })
    this.getTaskDetail(this.taskDetailData.id) // 重新加载数据
    this.scroller.scrollEdge(Edge.Top)
    this.loading.close()
    promptAction.showToast({ message: '提货成功' })

  }
```
:::success
提交代码
:::

# 交货列表加载
> 分析：
>    一个任务，如果已经提货，那么下一步应该就是司机去送货，完成交货，上一节我们完成了提货， 那么完成的这个任务应该在在途里面，所以我来先把在途的数据进行查询一下

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701610992301-18b1799b-3c4a-4e89-94a9-3c0479442d1a.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f5f4f4&clientId=u6fb748c5-2d8a-4&from=paste&height=362&id=hj6wA&originHeight=1444&originWidth=850&originalType=binary&ratio=2&rotation=0&showTitle=false&size=66089&status=done&style=none&taskId=uab0d4577-57d0-4ac7-8166-07945001966&title=&width=213)

> - 在途和待提货的区别就是查询的状态不同，刚刚好，我们前面定义了枚举，所以这里可以直接复用前面提货的TaskList的组件

> **entry模块**

```typescript
build() {
    Stack({ alignContent: Alignment.Top }) {
      Tabs({ barPosition: BarPosition.Start, index: $$this.currentIndex, controller: this.tabController }) {
        ForEach(this.tabsData, (item: TabClass) => {
          TabContent(){
              if(item.name === "waiting") {
                TaskList()
              }
              else if(item.name === 'line') {
                TaskList({ params: {
                  page: 1,
                  pageSize: 5,
                  status: TaskTypeEnum.Line
                } as TaskListParamsModel })
              }
              else {
                Text(item.title)
              }
          }
        })
      }.backgroundColor($r('app.color.background_page')).animationDuration(300)
      Row ({ space: 30 }) {
        ForEach(this.tabsData, (item: TabClass) => {
          this.getTabBar(item)
        })
      }
      .padding({
        left: 40,
        right: 40
      })
      .width('100%')
      .height(50)
      .backgroundColor($r("app.color.white"))

    }
  }
```
> 因为我们TaskList默认是查的提货的数据-所以不用传参数了，传了和原来的参数也是一样的

```typescript
import { getTaskListAPI } from '../../../api/task'
import { TaskInfoItemModel, TaskListParamsModel, TaskTypeEnum } from '../../../models'
import TaskItemCard from './TaskItem'
import HmList from '@hm/basic/src/main/ets/components/HmList'

@Preview
@Component
struct TaskList {
  params: TaskListParamsModel = {
    page: 1, // 表示查询第几页的数据 ++
    pageSize: 10, // 表示每页查几条数据
    status: TaskTypeEnum.Waiting,
  } as TaskListParamsModel
  @State taskList: TaskInfoItemModel[] = []
  @State finished: boolean = false // 服务器上没有更多数据了
  onLoad = async (isRefresh?: boolean) => {

    const data = await getTaskListAPI(this.params) // page: 1   2

    const items = data.items || []  // date.items有可能为null

    if (isRefresh) {
      this.taskList = items // 刷新要覆盖数据
    } else {
      this.taskList.push(...items) // 无限滚动 要拼接数据
    }
    this.params.page++ // 2 3

    if (this.params.page > data.pages) {
      this.finished = true // 服务器上没有更多数据了
    }
  } // 防抖或者节流
  onRefresh = async () => {
    this.params.page = 1 // 重置数据
    this.finished = false // 重置数据
    await this.onLoad(true) // 再次发请求, 覆盖旧数据
  }

  @Builder
  renderItem(item: object) {
    TaskItemCard({ taskItem: item as TaskInfoItemModel })
  }

  build() {
    HmList({
      finished: this.finished,
      dataSource: this.taskList,
      onLoad: this.onLoad,
      onRefresh: this.onRefresh,
      finishedText: '我是有底线的',
      loadingText: '疯狂加载中',
      renderItem: this.renderItem
    })

  }
}

export default TaskList

```

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704265917512-67408b40-388e-4eb6-af01-ac8762b8ecdf.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f3f3f3&clientId=ubf2c7d68-b49a-4&from=paste&height=618&id=Mzv2s&originHeight=618&originWidth=290&originalType=binary&ratio=1&rotation=0&showTitle=false&size=20004&status=done&style=none&taskId=u1aaf4249-ea21-4167-8a5e-bf21a29c1b7&title=&width=290)
> 发现List只有一条数据时，List的内容是位于容器的中间位置，可以给TaskList中的HmList再加一层容器，
> 设置高度为100%

```typescript
build() {
    HmList({
      onLoad: async () => {
        await this.getTaskList(true)
      },
      onRefresh: async () => {
        await this.onRefresh()
      },
      dataSource: $taskListData,
      renderItem: this.renderItem,
      finished: this.allPage < this.queryParams.page,
      finishText: '没啦没啦',
      loadingText: '拼命加载中'
    })
      .height('100%')
  }
```

- 实现效果

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704266039929-e862df41-f2bc-43d2-a8ea-17e901f353ca.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23efefef&clientId=ubf2c7d68-b49a-4&from=paste&height=318&id=VBNko&originHeight=633&originWidth=291&originalType=binary&ratio=1&rotation=0&showTitle=false&size=21406&status=done&style=none&taskId=u6e575fe8-1fa5-4ad0-8446-efd12f8460d&title=&width=146)

> 接下来，根据状态去调整按钮的显示和文本内容
> - 当任务的状态为待提货并且可提货时，按钮显示提货并且可用
> - 当任务的状态为待交货时，按钮显示提货并且可用
> - 当任务的状态为待回车登记时，按钮显示回车登记并且可用

- 给之前的任务状态枚举再加一个属性
```typescript
export enum TaskTypeEnum {
  Waiting = 1, // 待提货
  Line = 2, // 在途待交货
  Delivered = 4, // 已交货待回车登记
  Finish = 6 // 已完成
}
```

- 在TaskItemCard组件中根据状态获取按钮的文本及可用状态
> 如果enablePickup为true 表示可提货
> 如果status 为 2 表示为待交货 显示交货
> 如果status 为 4表示 待回车登记

```typescript
 // 获取按钮可用性
  getBtnEnable() {
    const value = this.taskItem.status
    if (this.taskItem.enablePickUp) {
      return true
    }
    switch (value) {
      case TaskTypeEnum.Line
      case TaskTypeEnum.Delivered:
        return true
      default:
      return false
    }
  }

  // 获取按钮显示文本
  getBtnText() {
    const value = this.taskItem.status
    switch (value) {
      case TaskTypeEnum.Waiting:
        return "提货"
      case TaskTypeEnum.Line:
        return "交货"
      case TaskTypeEnum.Delivered:
        return "回车登记"
      default:
        return ""
    }
  }

```

- 按钮显示文本
```typescript
 Button(this.getBtnText(), { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.primary') )
          .fontColor($r("app.color.white"))
          .fontSize(14)
          .height(32)
          .enabled(this.getBtnEnable())
          .onClick(() => {
            this.toPickUp()
          })
```
> ⚠️： 这里的去提货的逻辑不用发生任何变化，因为交货的业务也是到详情页去提货，完成可以复用一摸一样的逻辑


![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713324051027-a805e320-10c0-4e1a-a292-6da10e0b1e1f.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23edecec&clientId=ua7118074-96bf-4&from=paste&height=715&id=q2s6t&originHeight=715&originWidth=340&originalType=binary&ratio=1&rotation=0&showTitle=false&size=54215&status=done&style=none&taskId=u9e4b575f-8e09-4b75-951d-f4862b06907&title=&width=340)

> 提交代码


# 交货详情内容控制

1. 根据状态显示不同的按钮

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701609909805-69380036-450f-49ac-893c-e5f97d834e59.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_38%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fefefe&clientId=ua1b71c61-fd9b-4&from=paste&height=175&id=FUH4B&originHeight=350&originWidth=1346&originalType=binary&ratio=2&rotation=0&showTitle=false&size=61992&status=done&style=none&taskId=u9b034f15-9cab-4a50-b4a6-bf4197a958e&title=&width=673)
:::info
当一个任务提完货后，status应该是Line(在途)，如果是Waiting(待提货)的话显示提货按钮，如果是Line（在途），显示交货按钮
:::

1. 提货

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701609991873-5a214cc8-50ec-4526-9690-46aad9168a0e.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eac8c6&clientId=ua1b71c61-fd9b-4&from=paste&height=150&id=vyiEQ&originHeight=115&originWidth=296&originalType=binary&ratio=2&rotation=0&showTitle=false&size=6443&status=done&style=none&taskId=u7095bd7e-0e84-4188-b257-847043554f5&title=&width=387)

2. 交货

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701609983858-74a27296-d8eb-4cff-98cd-4e94a2d2a66a.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_23%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f3d7d3&clientId=ua1b71c61-fd9b-4&from=paste&height=170&id=RxOyH&originHeight=340&originWidth=802&originalType=binary&ratio=2&rotation=0&showTitle=false&size=27839&status=done&style=none&taskId=u6021f992-16ae-4b04-8f65-72900a53501&title=&width=401)

```typescript
 // 底部按钮结构
  @Builder
  getBottomBtn() {
    //已完成不显示任何按钮
    Row() {
      if(this.taskDetailData.status === TaskTypeEnum.Waiting) {
        Button("延迟收货", { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.btn_gray'))
          .fontColor($r('app.color.text_primary'))
          .fontSize(16)
          .height(50)
          .width(125)
        Button("提货", { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.primary'))
          .fontColor($r('app.color.white'))
          .height(50)
          .flexGrow(1)
          .margin({ left: 13 })
          .enabled(this.getPickUpState())
          .onClick(() => {
            this.onPickUp()
          })
      }
      else if(this.taskDetailData.status === TaskTypeEnum.Line) {
        Button("上报异常", { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.btn_gray'))
          .fontColor($r('app.color.text_primary'))
          .fontSize(16)
          .height(50)
          .width(125)
        Button("交货", { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.primary'))
          .fontColor($r('app.color.white'))
          .height(50)
          .flexGrow(1)
          .margin({ left: 13 })

      }

    }
    .width('100%')
    .padding({ left: 15, right: 15 })
    .height(70)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .backgroundColor($r('app.color.white'))
  }

```

2. 交货时，**隐藏提货上传组件**，显示交货上传组件

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701614315347-d64a6ec4-48de-459c-892f-09d743349c5c.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f6f6&clientId=u6fb748c5-2d8a-4&from=paste&height=258&id=VgNqx&originHeight=344&originWidth=297&originalType=binary&ratio=2&rotation=0&showTitle=false&size=11541&status=done&style=none&taskId=u32e9399b-46e1-4111-8386-ac394492c17&title=&width=223)

- 实现一个Builder函数来放置交货的上传
```typescript
// 专门负责交货信息的结构
  @Builder
  getDeliverContent() {
    HmUpload({
      title: '请拍照上传交货货品凭证',
      imageList: this.taskDetailData.deliverPictureList || [],
      onImageListChange: (list: ImageListModel[]) => {
        this.taskDetailData.deliverPictureList = list
      }
    })
    HmUpload({
      title: '请拍照上传交货货品照片',
      imageList: this.taskDetailData.certificatePictureList || [],
      onImageListChange: (list: ImageListModel[]) => {
        this.taskDetailData.certificatePictureList = list
      }
    })
  }
```
```typescript
 // 提货时显示提货照片
          if(this.taskDetailData.status === TaskTypeEnum.Waiting) {
            HmToggleCard({ title: '提货信息' }) {
              this.getPickUpContent()
            }
          }
          // 交货时显示交货照片
          if(this.taskDetailData.status === TaskTypeEnum.Line) {
            HmToggleCard({ title: '交货信息' }) {
              this.getDeliverContent()
            }
          }
```

:::info
提交代码
:::
# 交货状态控制
```typescript
// 获取交货状态
  getDeliverState () {
    return this.taskDetailData.deliverPictureList?.length > 0 &&
      this.taskDetailData.certificatePictureList?.length > 0
  }
```
```typescript
        Button("交货", { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.primary') )
          .fontColor($r('app.color.white'))
          .height(50)
          .flexGrow(1)
          .margin({ left: 13 })
          .enabled(this.getDeliverState())
          
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701614485346-c0706ba0-ff96-447a-9685-e74ade414678.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e4d9d6&clientId=u6fb748c5-2d8a-4&from=paste&height=380&id=pfBF6&originHeight=388&originWidth=326&originalType=binary&ratio=2&rotation=0&showTitle=false&size=31405&status=done&style=none&taskId=u135aea17-4167-405e-909e-5505be6d15c&title=&width=319)

:::info
提交代码
:::
# 交货
> **Entry模块**

:::info
标准流程

1. 定义类型封装api
2. 引入api
3. 注册事件-调用api重新加载
:::

1. 定义请求参数类型
```typescript

import { ImageListModel } from '@hm/basic'
export interface DeliverParamsTypeModel {
  /** 交付凭证列表 */
  certificatePictureList: ImageListModel[];
  /** 交付图片列表 */
  deliverPictureList: ImageListModel[];
  /** 司机作业id */
  id: string;
}

```

- 在models/index.ets统一导出
```typescript
export * from './deliver'
```

2. 封装API
```typescript
// 交货
export const deliverAPI = (data: DeliverParamsTypeModel) => {
  return Request.post("/driver/tasks/deliver", data)
}
```

3. 调用
```typescript
 async onDeliver() {
    this.loading.open()
    await deliverAPI({
      certificatePictureList: this.taskDetailData.certificatePictureList,
      deliverPictureList: this.taskDetailData.deliverPictureList,
      id: this.taskDetailData.id
    })
    this.loading.close()

    promptAction.showToast({ message: '交货成功' })
    this.getTaskDetail()
  }

```
```typescript
       Button("交付", { type: ButtonType.Capsule })
          .backgroundColor(this.getDeliverState() ? $r('app.color.primary') : $r('app.color.primary_disabled'))
          .fontColor($r('app.color.white'))
          .height(50)
          .flexGrow(1)
          .enabled(this.getDeliverState())
          .margin({ left: 13 })
          .onClick(() => {
            this.onDeliver()
        })
```
:::info
提交
:::

# 底部显示回车登记按钮
:::warning
在已经交货的情况下，显示**提货信息**-**交货信息**- 底部的**回车登记按钮，全部显示**
:::

```typescript
        // 回车时也要显示提货照片
          if(this.taskDetailData.status === TaskTypeEnum.Waiting || this.taskDetailData.status === TaskTypeEnum.Delivered) {
            HmToggleCard({ title: '提货信息' }) {
              this.getPickUpContent()
            }
          }
          // 回车时也要显示交货照片
          if(this.taskDetailData.status === TaskTypeEnum.Line || this.taskDetailData.status === TaskTypeEnum.Delivered) {
            HmToggleCard({ title: '交货信息' }) {
              this.getDeliverContent()
            }
          }
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701615691893-ddb2a2e1-7057-4f16-b7e1-1339f171080d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f1f1ef&clientId=u6fb748c5-2d8a-4&from=paste&height=443&id=eXDr1&originHeight=413&originWidth=330&originalType=binary&ratio=2&rotation=0&showTitle=false&size=30310&status=done&style=none&taskId=ubefe3f6a-4ec1-4af9-9158-99d4ba410a4&title=&width=354)

- 显示底部回车登记按钮
```typescript
  else if(this.taskDetailData.status === TaskTypeEnum.Delivered) {
        Row() {
          // 已交付显示回车登记
          Button("回车登记", { type: ButtonType.Capsule })
            .backgroundColor($r('app.color.primary'))
            .fontColor($r('app.color.white'))
            .height(50)
            .width('80%')
        }
        .width('100%').justifyContent(FlexAlign.Center)
}
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701615858983-62587b83-f874-42b3-8bb7-af5e4234a8f7.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_14%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f0d9d8&clientId=u6fb748c5-2d8a-4&from=paste&height=401&id=zpFBS&originHeight=209&originWidth=313&originalType=binary&ratio=2&rotation=0&showTitle=false&size=10145&status=done&style=none&taskId=ucf4b2596-f4b4-4f02-ae50-ff0be1a0a59&title=&width=600.5)

:::info
提交代码
:::

# 回车登记模式下-上传组件只读
:::info
因为货已经交了，所以回车登记模式下，此时只可以看，不能再传图片了
:::
> **basic模块**

1. 给HmUpload一个属性来控制是否可上传和删除
```typescript
@Prop
canUpload:boolean = true
```

2. 通过该属性来控制上传部分的显示和隐藏

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1708505083927-9f523b1d-0ffc-4d05-ad85-a9dadd5bd082.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_69%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232d2d2d&clientId=udc0b2774-2601-4&from=paste&height=1292&id=lQNUi&originHeight=1292&originWidth=2412&originalType=binary&ratio=1&rotation=0&showTitle=false&size=173816&status=done&style=none&taskId=u31f9963a-e47d-41fb-9e7c-00c99b65049&title=&width=2412)

3. 在TaskDetail中传入该属性
```typescript

  // 专门负责提货信息的结构
  @Builder
  getPickUpContent() {
    HmUpload({
      title: '请拍照上传货品凭证',
      canUpload: this.taskDetailData.status !== TaskTypeEnum.Delivered,
      imageList: this.taskDetailData.cargoPickUpPictureList || [],
      onImageListChange: (list: ImageList[]) => {
        this.taskDetailData.cargoPickUpPictureList = list
      }
    })
    HmUpload({
      title: '请拍照上传货品照片',
      canUpload: this.taskDetailData.status !== TaskTypeEnum.Delivered,
      imageList: this.taskDetailData.cargoPictureList || [],
      onImageListChange: (list: ImageList[]) => {
        this.taskDetailData.cargoPictureList = list
      }
    })
  }

   // 专门负责交货信息的结构
  @Builder
  getDeliverContent() {
    HmUpload({
      title: '请拍照上传交货货品凭证',
      canUpload: this.taskDetailData.status !== TaskTypeEnum.Delivered,
      imageList: this.taskDetailData.deliverPictureList || [],
      onImageListChange: (list: ImageList[]) => {
        this.taskDetailData.deliverPictureList = list
      }
    })
    HmUpload({
      title: '请拍照上传交货货品照片',
      canUpload: this.taskDetailData.status !== TaskTypeEnum.Delivered,
      imageList: this.taskDetailData.certificatePictureList || [],
      onImageListChange: (list: ImageList[]) => {
        this.taskDetailData.certificatePictureList = list
      }
    })
  }

```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701616423542-157b008d-e6a8-437b-843f-c02c01f64109.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_14%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e8e2df&clientId=u6fb748c5-2d8a-4&from=paste&height=484&id=sfnjZ&originHeight=645&originWidth=312&originalType=binary&ratio=2&rotation=0&showTitle=false&size=44074&status=done&style=none&taskId=u3fc47895-b7ad-4625-a1b9-43a0daeafa5&title=&width=234)
:::info
提交代码
:::

# 回车登记页面
> 

- 新建回车登记页面 pages/CardRecord/Record

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704349670008-df293801-8564-44e8-84bf-dcf882580742.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_10%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f2f1&clientId=u00131124-981e-4&from=paste&height=415&id=ufvGr&originHeight=828&originWidth=363&originalType=binary&ratio=1&rotation=0&showTitle=false&size=41890&status=done&style=none&taskId=u3b3c6db4-628b-404f-a125-8c498c9c68b&title=&width=182)
```typescript
import { HmNavBar, HmCard, HmCardItem } from '@hm/basic'
@Entry
@Component
struct CarRecord {
  build() {
    Column() {
      HmNavBar({ title: '回车登记' })
      Scroll() {
        Column() {
          HmCard(){
            HmCardItem({
              leftText: '出车时间',
              rightText: '2022.05.04 13:00'
            })
            HmCardItem({
              leftText: '回车时间',
              rightText: '请选择',
              showBottomBorder: false
            })
          }
        }
        .height('100%')
      }
      .layoutWeight(1)
      // 底部内容
      Row() {
        Button("交车",{ type: ButtonType.Capsule })
          .backgroundColor($r('app.color.primary'))
          .width(207)
          .height(50)
      }
      .backgroundColor($r('app.color.white'))
      .height(70)
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
    }
    .backgroundColor($r('app.color.background_page'))
    .height('100%')
  }
}
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713327770236-100186c7-f209-4fba-a718-06312874b24b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_16%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23efeae9&clientId=u7cdae76e-5bdc-4&from=paste&height=589&id=i3z51&originHeight=1178&originWidth=548&originalType=binary&ratio=1&rotation=0&showTitle=false&size=41474&status=done&style=none&taskId=u8ee07c93-2e83-4e84-87e7-b740e49fe24&title=&width=274)

- TaskDetail页面跳转到回车登记
```typescript
     Button("回车登记", { type: ButtonType.Capsule })
      .backgroundColor($r('app.color.primary'))
      .fontColor($r('app.color.white'))
      .height(50)
      .width('80%')
      .onClick(() => {
        router.pushUrl({
          url: 'pages/CarRecord/CarRecord',
          params: {
            id: this.taskDetailData.id
          }
        })
      })
```

- 在CarRecord接收参数id，并且获取任务的详情，赋值出车时间
```typescript
  @State taskDetailData: TaskDetailInfoModel = {} as TaskDetailInfoModel

  async aboutToAppear() {
    await this.getTaskDetail()
  }

  async getTaskDetail() {
    const params = router.getParams() as CommonRouterParams
    if (params.id) {
      const result = await getTaskDetailAPI(params.id)
      this.taskDetailData = result
    }
  }
```

- 赋值出车时间
```diff
HmCardItem({
  leftText: '出车时间',
-  rightText: '2022.05.04 13:00'
+  rightText: this.taskDetailData.actualDepartureTime
})
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704352395267-bb5e84fd-db3d-4f77-b5b6-239e1c7e06bb.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_14%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ebebeb&clientId=u00131124-981e-4&from=paste&height=360&id=mw6MG&originHeight=237&originWidth=320&originalType=binary&ratio=1&rotation=0&showTitle=false&size=7589&status=done&style=none&taskId=u0892755a-db6c-413e-a161-35e26b5faf2&title=&width=486)
:::info
提交代码
:::
# 使用官方的时间弹窗选择器来选择时间

- 使用官方的选择时间弹窗
```typescript
        HmCardItem({ leftText: '回车时间',
            rightText:  "请选择", 
            showBottomBorder: false,
            onRightClick: () => {
              DatePickerDialog.show({
                showTime: true, // 展示日期的同时, 是否显示时间
                useMilitaryTime: true, // 是否显示为24小时制
                onDateAccept: (value: Date) => {
                   AlertDialog.show({ message: value.toString(), alignment: DialogAlignment.Center })
                }
              })

            }

          })
```

- 下包`ohpm i dayjs`
```javascript
import dayjs from 'dayjs'
```

- 回车时间绑定对应的字段
```diff
 HmCardItem({
    leftText: '回车时间',
    rightText: "请选择",
    showBottomBorder: false,
    onRightClick: () => {
      DatePickerDialog.show({
        showTime: true,
        useMilitaryTime: true,
        onDateAccept: (value: Date) => {
          // 结束时间
-          AlertDialog.show({ message: value.toString(), alignment: DialogAlignment.Center })
+          AlertDialog.show({ message: dayjs(value).format('YYYY-MM-DD HH:mm'), alignment: DialogAlignment.Center })
        }
      })

    }

  })
```

- 


![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1714211449151-dd587dd7-5ab4-4639-ba53-9a5ec7173cf4.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d2d1d1&clientId=u2509cc4d-fefa-4&from=paste&height=770&id=BWPjs&originHeight=770&originWidth=386&originalType=binary&ratio=1&rotation=0&showTitle=false&size=67444&status=done&style=none&taskId=u6ff5c28f-a17b-4836-8740-1c049e10610&title=&width=386)
# 封装选择组件-HmCheckBox
> **basic模块**

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704352368499-d1145faf-77f9-47bf-be0d-51e36aa81496.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_16%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23faf9f9&clientId=u00131124-981e-4&from=paste&height=109&id=xXqxx&originHeight=71&originWidth=348&originalType=binary&ratio=1&rotation=0&showTitle=false&size=5925&status=done&style=none&taskId=ub6fb1ffe-e29d-4f4f-9c78-d1664aaab58&title=&width=532)
> 分析
> - 可以控制显示文本
> - 右侧的是否文本可以控制
> - 值改变时通知外部组件
> - 这个组件通用性不是那么大，简单封装一下

- 在components下新建HmCheckBox.ets - **直接复制**
```typescript
@Preview
@Component
struct HmCheckBox {
  title: string = "测试"
  confirmText: string = "是"
  cancelText: string = '否'
  @Prop
  value: boolean = true // 决定选中左侧还是右侧\
  checkChange: (value: boolean) => void = () => {}
  build() {
   Row () {
     Row () {
      Text(this.title)
        .fontSize(14)
        .fontColor($r("app.color.text_primary"))

       // 右侧内容
       Row ({ space: 10 }) {
         Row () {
           Image(this.value ? $r("app.media.ic_radio_true") : $r("app.media.ic_radio_false"))
             .width(32)
             .aspectRatio(1)
           Text(this.confirmText)
         }
         .onClick(() => {
           this.value = true
           this.checkChange(this.value)
         })
         Row () {
           Image(!this.value ? $r("app.media.ic_radio_true") : $r("app.media.ic_radio_false"))
             .width(32)
             .aspectRatio(1)
           Text(this.cancelText)
         }
         .onClick(() => {
           this.value = false
           this.checkChange(this.value)
         })
       }
     }
     .width("100%")
     .borderRadius(10)
     .height(60)
     .padding({
       left: 15,
       right: 15
     })
     .justifyContent(FlexAlign.SpaceBetween)
     .backgroundColor($r("app.color.white"))

   }
    .width("100%")
    .padding({
      left: 15,
      right: 15
    })
    .margin({
      top: 15
    })
  }
}
export { HmCheckBox }
```

- 在components/index.ets中导出
```typescript
export * from './HmCheckBox'
```

- 在回车登记中放置三个组件
```diff
     Scroll() {
      Column() {
        HmCard() {
          HmCardItem({
            leftText: '出车时间',
            rightText: this.taskDetailData.actualDepartureTime
          })
          HmCardItem({
            leftText: '回车时间',
            rightText: '请选择',
            showBottomBorder: false
          })
        }

+       HmCheckBox({ value: false, title: '车辆违章' })
+       HmCheckBox({ value: false, title: '车辆故障' })
+       HmCheckBox({ value: false, title: '车辆事故' })
      }
      .height('100%')
    }
    .layoutWeight(1)
```
> **entry模块**

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704354100746-79c7c2a0-ab1f-451e-943b-db760e78ba7b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_21%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f0f0f0&clientId=u00131124-981e-4&from=paste&height=463&id=prKF9&originHeight=926&originWidth=738&originalType=binary&ratio=1&rotation=0&showTitle=false&size=82889&status=done&style=none&taskId=uad44d25a-a4ef-4993-819e-3596384f405&title=&width=369)
> 提交代码


# 回车登记提交
> 1. 定义提交数据类型
> 2. 绑定数据到数据
> 3. 提交回车登记

> **entry模块**

- 声明回车登记类型
```typescript
import { ImageListModel } from '@hm/basic'
export interface CarRecordTypeModel {
  /** 事故说明，类型为“其他”时填写 */
  accidentDescription: string | null;
  /** 事故图片列表 */
  accidentImagesList: ImageListModel[] | null;
  /** 事故类型，1-直行事故，2-追尾事故，3-超车事故，4-左转弯事故，5-右转弯事故，6-弯道事故，7-坡道事故，8-会车事故，9-其他, */
  accidentType: string | null;
  /** 违章说明，类型为“其他”时填写 */
  breakRulesDescription: string | null;
  /** 违章类型，1-闯红灯，2-无证驾驶，3-超载，4-酒后驾驶，5-超速行驶，6-其他,可用 */
  breakRulesType: string | null;
  /** 扣分数据 */
  deductPoints: number | null;
  /** 回车时间，回车时间，格式yyyy-MM-dd HH:mm:ss，比如：2023-07-18 17:00:00 */
  endTime: string;
  /** 故障说明，类型为“其他”时填写 */
  faultDescription: string | null;
  /** 故障图片列表 */
  faultImagesList: ImageListModel[] | null;
  /** 故障类型，1-发动机启动困难，2-不着车，3-漏油，4-漏水，5-照明失灵，6-有异响，7-排烟异常，8-温度异常，9-其他,可用 */
  faultType: string | null;
  /** 运输任务id */
  id: string;
  /** 是否出现事故 */
  isAccident: boolean | null;
  /** 车辆是否可用 */
  isAvailable: boolean | null;
  /** 车辆是否违章 */
  isBreakRules: boolean | null;
  /** 车辆是否故障 */
  isFault: boolean | null;
  /** 罚款金额 */
  penaltyAmount: string | null;
  /** 出车时间，出车时间，格式yyyy-MM-dd HH:mm:ss，比如：2023-07-18 17:00:00 */
  startTime: string;
}

```

- 在models/index.ets中导出
```typescript
export * from './car_record'
```

- 在CarRecord中定义数据
```typescript
@State
carRecord: CarRecordTypeModel = {} as CarRecordTypeModel
```

- 绑定车辆违章-车辆故障-车辆事故的属性
```diff
    HmCardItem({
        leftText: '回车时间',
-        rightText:  '请选择',
+        rightText: this.carRecord.endTime ||  '请选择',
        showBottomBorder: false,
        onRightClick: () => {
          DatePickerDialog.show({
            showTime: true,
            useMilitaryTime: true,
            onDateAccept: (value: Date) => {
+              this.carRecord.endTime = dayjs(value).format('YYYY-MM-DD HH:mm')
            }
          })
        }
      })

     //  ... 省略其余代码...


      HmCheckBox({ value: !!this.carRecord.isBreakRules, title: '车辆违章',
+       checkChange: (value) => {
+         this.carRecord.isBreakRules = value
+       } 
       })
      HmCheckBox({ value: !!this.carRecord.isFault, title: '车辆故障',
+        checkChange: (value) => {
+          this.carRecord.isFault = value
+        } 
      })
      HmCheckBox({ value: !!this.carRecord.isAccident, title: '车辆事故',
+        checkChange: (value) => {
+          this.carRecord.isAccident = value
+        }
     })
```

- 封装交车api
```typescript
/** 交车API */
export const carRecordAPI = (data: CarRecordTypeModel) => {
  return Request.post("/driver/tasks/truckRegistration", data)
}
```

- 点击交车调用接口

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704366282832-5aa2f363-c340-4c2a-a801-31dcf4277af4.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fefefe&clientId=u40f8c6be-7008-4&from=paste&height=172&id=wzZ5E&originHeight=172&originWidth=442&originalType=binary&ratio=1&rotation=0&showTitle=false&size=23100&status=done&style=none&taskId=u3c806ed7-0697-452c-9eff-1e612d0e8e5&title=&width=442)
> 有三个字段是必须要传的，id来自任务详情中的transportTaskId，startTime来自任务详情中的actualDepartureTime，entTime是我们自己选择的时间

- 提交
```typescript
// 检查再提交
  async onCarRecord() {
    if (!this.carRecord.endTime) {
      promptAction.showToast({ message: '请选择回车时间' })
      return
    }
    this.carRecord.startTime = this.taskDetailData.actualDepartureTime
    // 运输任务id
    this.carRecord.id = this.taskDetailData.transportTaskId // 注意注意再注意
    await carRecordAPI(this.carRecord)
    promptAction.showToast({ message: '回车登记成功' })
    router.clear() // 清空页面栈
    router.replaceUrl({ url: 'pages/Index/Index' })
  }
```

> 同学们到现在，我们已经将神领物流中的 提货-交货-回车登记业务跑通，剩下的将完成 对整个项目的一些核心点的优化

# 实现延迟收货业务-基本布局
> **entry模块**


![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701660614637-bbf6ae16-e3f2-4689-b4b1-764834d62960.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f6f6&clientId=u92cda727-c2b6-4&from=paste&height=306&id=hLhFw&originHeight=1222&originWidth=840&originalType=binary&ratio=2&rotation=0&showTitle=false&size=82081&status=done&style=none&taskId=u0ded7aa5-13bf-4c80-a315-66732f8d27d&title=&width=210)

1. 新建pages/Delay/Delay.ets -(Page)
- **复制静态**-快速布局
```typescript
import { HmNavBar, HmCard, HmCardItem } from '@hm/basic'
import dayjs from "dayjs";


@Entry
@Component
struct Delay {
  build() {
    Column() {
      HmNavBar({ title: '延迟提货' })
      HmCard() {
        HmCardItem({ leftText: '原定时间', rightText: '', showRightIcon: false })
        HmCardItem({
          leftText: '延迟时间',
          rightText: '',
          onRightClick: () => {
            DatePickerDialog.show({
              useMilitaryTime: true,
              showTime: true,
              onDateAccept: (value) => {
                AlertDialog.show({
                  message: dayjs(value).format('YYYY-MM-DD HH:mm'),
                  alignment: DialogAlignment.Center
                })
              }
            })
          }
        })
        TextArea({ placeholder: '请输入延迟提货原因' })
          .backgroundColor($r('app.color.background_page'))
          .margin({ top: 20 })
          .borderRadius(8)
          .height(130)
          .placeholderColor($r('app.color.text_secondary'))
          .fontSize(14)
        Text('0/50')
          .margin({ top: -30 })
          .textAlign(TextAlign.End)
          .width('100%')
          .padding({ right: 15 })
          .fontColor($r('app.color.text_secondary'))
        Row() {
          Button("提交")
            .height(50)
            .width(207)
            .backgroundColor($r('app.color.primary_disabled'))
        }
        .justifyContent(FlexAlign.Center).padding({
          top: 20,
          bottom: 20
        })

      }
    }
    .height('100%').backgroundColor($r('app.color.background_page'))
  }
}
```
:::info
提交代码
:::
# 延迟收货-接收参数-显示
:::info
TaskDeail中点击延迟收货跳转到延迟收货，传入参数
:::
 1. 点击延迟收货，跳转，传入参数
> 这里偷个懒直接把要的参数id和时间传递过去，利用原来封装的公共路由参数

> **basic模块**

```typescript
export interface CommonRouterParamsModel {
  id?: string = ''
  oldTime?: string 
}
```
> **entry模块**

```typescript
       Button("延迟收货", { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.btn_gray'))
          .fontColor($r('app.color.text_primary'))
          .fontSize(16)
          .height(50)
          .width(125)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Delay/Delay',
              params: {
                id: this.taskDetailData.id,
                oldTime: this.taskDetailData.planDepartureTime
              }
            })
          })
```

2. 在延迟收货接收该参数
- 定义延迟提货提交类型参数
```typescript
export interface DelayParamsTypeModel {
  /** 延迟原因 */
  delayReason: string;
  /** 延迟时间，格式：yyyy-MM-dd HH:mm */
  delayTime: string;
  /** 司机作业单id */
  id: string;
}
```

- 在models/index.ets中导出
```typescript
export * from './delay'
```

- 接收赋值id和原有时间
```typescript
  @State
  delayForm: DelayParamsTypeModel = {} as DelayParamsTypeModel

  @State oldTime: string = ""

  aboutToAppear() {
    const params = router.getParams() as CommonRouterParams
    if(params.id && params.oldTime) {
      this.delayForm.id = params.id
      this.oldTime = params.oldTime
    }
  }
```

- 赋值原有时间
```typescript
 HmCardItem({ 
   leftText: '原定时间',
   rightText: this.oldTime,
   showRightIcon: false 
 })

```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701662297687-9decfa20-e673-41d8-9c75-016fe70743b3.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_16%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f6f4f4&clientId=u92cda727-c2b6-4&from=paste&height=589&id=H2rvz&originHeight=514&originWidth=350&originalType=binary&ratio=2&rotation=0&showTitle=false&size=14064&status=done&style=none&taskId=u3932e5d2-250a-4f3d-af53-041e9e3d2db&title=&width=401)
:::info
提交代码
:::
# 延迟收货-日期选择

- 右侧点击弹出
```diff
        HmCardItem({
          leftText: '延迟时间', 
+         rightText: this.delayForm.delayTime || '',
          onRightClick: () => {
            DatePickerDialog.show({
              useMilitaryTime: true,
              showTime: true,
              onDateAccept: (value) => {
+               this.delayForm.delayTime =dayjs(value).format('YYYY-MM-DD HH:mm')
              }
            })
          }
        })
```

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1714222427221-d82c816a-3d83-4ea1-bcf8-b03751d9c27d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d5d4d3&clientId=uc56764d3-272b-4&from=paste&height=361&id=u1e325f3f&originHeight=721&originWidth=336&originalType=binary&ratio=1&rotation=0&showTitle=false&size=54461&status=done&style=none&taskId=ua72c1f1f-e367-4435-86fa-ee1f540f061&title=&width=168)
:::info
提交代码
:::

# 延迟收货-字数控制

1. 声明状态
```typescript
  @State 
  maxSizeNumber:number = 50

```

2. 双向绑定原因字段
3. 监听onChange事件
:::warning
$$不支持嵌套对象里面的属性绑定
:::
```diff
 TextArea({ 
   placeholder: '请输入延迟提货原因', 
+   text: this.delayForm.delayReason, 
 })
+ .maxLength(this.maxSizeNumber)
+ .onChange((value) => {
+    this.delayForm.delayReason = value
+ })

```

4. 设置显示文本
```diff
-     Text('0/50')
+     Text(`${this.delayForm.delayReason?.length || 0}/${this.maxSizeNumber}`)
        .margin({ top: -30 })
        .textAlign(TextAlign.End)
        .width('100%')
        .padding({ right: 15 })
        .fontColor($r('app.color.text_secondary'))
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701668671672-0dc3b7b1-bf8d-47b0-b0bf-b1bbd7928f15.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f8f6f6&clientId=u92cda727-c2b6-4&from=paste&height=355&id=uLQIa&originHeight=339&originWidth=337&originalType=binary&ratio=2&rotation=0&showTitle=false&size=12554&status=done&style=none&taskId=u1543ec0b-0e35-4cfe-bce7-28e79e51546&title=&width=352.5)

:::info
提交代码
:::
# 控制按钮状态及颜色

1. 封装方法检查必填项
```typescript
getBtnEnable() {
    !!this.delayForm.delayReason && !!this.delayForm.delayTime
}
```

2. 控制按钮及颜色
```typescript
 Button("提交")
    .height(50)
    .width(207)
    .backgroundColor($r('app.color.primary'))
    .enabled(this.getBtnEnable())
    .onClick(() => {

    })
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701669045976-5f99c4f3-c703-45eb-bcdd-8e31277e5b84.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_12%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f3ebea&clientId=u92cda727-c2b6-4&from=paste&height=502&id=JRnWP&originHeight=418&originWidth=408&originalType=binary&ratio=2&rotation=0&showTitle=false&size=23812&status=done&style=none&taskId=u77c52b2a-ad5a-42c6-a30b-41b043f49ca&title=&width=490)
:::info
提交代码
:::

# 提交延迟收货

1. 封装api
```typescript
// 延迟收货
export const delayAPI = (data: DelayParamsTypeModel) => {
  return Request.put("/driver/tasks/delay", data)
}
```

2. 调用api，返回页面
```typescript
  async onDelay() {
    await delayAPI(this.delayForm)
    promptAction.showToast({ message: '延迟收货成功' })
    router.back()
  }
```
:::info
提交代码
:::

# 上报异常页面基础布局

> **entry模块**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701670367850-6ba1e29c-1222-4ef3-b0f9-aeffc9db18b9.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e6e5e5&clientId=u2d890d5a-d5cb-4&from=paste&height=406&id=CWzBp&originHeight=810&originWidth=377&originalType=binary&ratio=2&rotation=0&showTitle=false&size=35240&status=done&style=none&taskId=u984a3d3a-dca4-429c-bb07-96afda3a006&title=&width=189)

:::info
:::
# 上报异常页面选择时间
> entry模块

- 点击上报异常进入-TaskDetail
```typescript
      Button("上报异常", { type: ButtonType.Capsule })
          .backgroundColor($r('app.color.btn_gray'))
          .fontColor($r('app.color.text_primary'))
          .fontSize(16)
          .height(50)
          .width(125)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Exception/ExceptionReport',
              params: {
                id: this.taskDetailData.transportTaskId
              }
            })
          })
```

- 声明数据类型-新建models/exception.ets
```typescript
import { ImageListModel } from '@hm/basic'
export interface ExceptionParamsTypeModel {
  /** 异常描述，200字以内 */
  exceptionDescribe: string | null;
  /** 异常图片 */
  exceptionImagesList: ImageListModel[] | null;
  /** 上报异常位置 */
  exceptionPlace: string;
  /** 异常时间，精确到分钟 */
  exceptionTime: string;
  /** 异常类型(传中文)，发动机启动困难，不着车，漏油，漏水，照明失灵，有异响，排烟异常，温度异常，其他 */
  exceptionType: string;
  /** 运输任务id */
  transportTaskId: string;
}

```

- 在models/index.ets中导出
```typescript
export * from './exception'
```
新建上报异常页面-**复制静态**-pages/ExceptionReport/ExceptionReport.ets
```tsx
import { CommonRouterParams, HmCard, HmCardItem, HmNavBar, HmUpload } from '@hm/basic'
import dayjs from 'dayjs'
import { ExceptionParamsTypeModel } from '../../models'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct ExceptionReport {
  @State
  exceptionForm: ExceptionParamsTypeModel = {} as ExceptionParamsTypeModel

  aboutToAppear() {
    const params = router.getParams() as CommonRouterParams
    if (params.id) {
      this.exceptionForm.transportTaskId = params.id
    }
  }

  build() {
    Column() {
      HmNavBar({ title: '上报异常' })
      Scroll() {
        Column() {
          HmCard() {
            HmCardItem({
              leftText: '异常时间', rightText: this.exceptionForm.exceptionTime || '请选择',
              onRightClick: () => {
                DatePickerDialog.show({
                  showTime: true,
                  useMilitaryTime: true,
                  onDateAccept: (value) => {
                    this.exceptionForm.exceptionTime = dayjs(value).format('YYYY-MM-DD HH:mm')
                  }
                })
              }
            })
            HmCardItem({ leftText: '上报位置', rightText: '请选择' })
            HmCardItem({ leftText: '异常类型', rightText: '请选择' })
            HmCardItem({
              leftText: '异常描述',
              rightText: '',
              showRightIcon: false,
              showBottomBorder: false
            })
            TextArea({
              placeholder: '请输入异常描述'
            }).height(130).borderRadius(8).placeholderColor($r('app.color.text_secondary')).fontSize(14)
            Text(`0/50`)
              .margin({
                top: -30
              })
              .textAlign(TextAlign.End)
              .width('100%')
              .padding({ right: 15 })
              .fontColor($r('app.color.text_secondary'))
            Row().height(20)

          }

          HmCard() {
            HmUpload({
              title: '上传图片(最多6张)',
              imageList: []
            , canUpload: true
            })
            Row().height(20)
          }
        }
      }.padding({
        bottom: 80
      })
      .layoutWeight(1)


      Row() {
        Button("提交").height(50).width(207).backgroundColor($r('app.color.primary_disabled'))
      }
      .position({
        y: '100%'
      })
      .height(70)
      .translate({
        y: -70
      })
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r('app.color.white'))
    }
    .height('100%').backgroundColor($r('app.color.background_page'))
  }
}
```



# 封装HmSelectCard组件
> **basic模块**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701672242689-e48b2952-d3b2-4e69-afdf-07463fcef2c5.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f4eeed&clientId=u5dc85341-3f7a-4&from=paste&height=578&id=QuGMV&originHeight=1156&originWidth=846&originalType=binary&ratio=2&rotation=0&showTitle=false&size=111681&status=done&style=none&taskId=u91aa4bb7-cdf1-4a59-ac88-9236afb0b64&title=&width=423)
> - 顶部内容可以设置标题，可以设置关闭按钮显示隐藏
> - 可以设置顶部按钮显示隐藏，可以设置底部按钮的文本和颜色
> - 可以自定义传入的结构
> - 支持自定义Dialog的形式弹出

- 在components下新建HmSelectCard.ets组件

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704424502064-9cedf5c3-6a55-4938-a087-ad0db1ae56ac.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_22%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fcfdf7&clientId=ube93b924-6fc5-4&from=paste&height=328&id=MAKVz&originHeight=328&originWidth=780&originalType=binary&ratio=1&rotation=0&showTitle=false&size=30701&status=done&style=none&taskId=uf3f5798a-66a0-446c-8d71-e2cf61d8a09&title=&width=780)
> 粘贴静态结构

```typescript
@Preview
@CustomDialog
@Component
struct HmSelectCard {
  controller: CustomDialogController
  build() {
    Column() {
      Row() {
        Text("请选择").fontSize(16).fontColor($r('app.color.text_primary'))
        Image($r("app.media.ic_btn_close")).width(13).height(13)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .height(60)
      .borderRadius({
        topLeft: 16,
        topRight: 16
      })
      // 渲染内容

      Row() {
        Button('确定', { type: ButtonType.Capsule }).width(200).backgroundColor($r('app.color.primary')).height(45)
      }.width('100%').justifyContent(FlexAlign.Center)
    }.backgroundColor($r('app.color.white')).justifyContent(FlexAlign.SpaceBetween).padding({
      left: 21.36,
      right: 21.36
    })
  }
}

export { HmSelectCard }
```

-  定义开放属性，用于设置组件的内容
```typescript
 title: string = "请选择" // 显示标题
  showClose: boolean = true // 显示关闭按钮
  showButton: boolean = true // 显示底部按钮
  buttonText: string = "确定" // 底部按钮文本
  confirm: () => void = () => {}
  @BuilderParam
  cardContent: () => void
```

- 控制内容显示
```typescript
@Preview
@CustomDialog
@Component
struct HmSelectCard {
  controller: CustomDialogController
  title: string = "请选择" // 显示标题
  showClose: boolean = true // 显示关闭按钮
  showButton: boolean = true // 显示底部按钮
  buttonText: string = "确定" // 底部按钮文本
  confirm: () => void = () => {}
  @BuilderParam
  cardContent: () => void
  build() {
    Column() {
      Row() {
        Text(this.title).fontSize(16).fontColor($r('app.color.text_primary'))
        if (this.showClose) {
          Image($r("app.media.ic_btn_close")).width(13).height(13)
            .onClick(() => {
              this.controller.close()
            })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .height(60)
      .borderRadius({
        topLeft: 16,
        topRight: 16
      })

      // 渲染内容
      if(this.cardContent) {
        this.cardContent()
      }
      if (this.showButton) {
        Row() {
          Button(this.buttonText, { type: ButtonType.Capsule })
            .width(200)
            .backgroundColor($r('app.color.primary'))
            .height(45)
            .onClick(() => {
              this.confirm()
            })
        }.width('100%').justifyContent(FlexAlign.Center)
      }
    }.backgroundColor($r('app.color.white')).justifyContent(FlexAlign.SpaceBetween).padding({
      left: 21.36,
      right: 21.36
    })
  }
}

export { HmSelectCard }
```
在components/index.ets导出
```typescript
export * from './HmSelectCard'
```
> **entry模块**

在上报异常中使用
```typescript
// 异常类型弹层
  typeDialog: CustomDialogController = new CustomDialogController({
    builder: HmSelectCard({ cardContent: () =>  { this.getCardContent } }),
    autoCancel: false,
    customStyle: true,
    alignment: DialogAlignment.Bottom
  })
  @Builder
  getCardContent () {}
```
> - 这里必须得使用箭头函数来给cardContent赋值，否则在当前组件中无法正确使用this

点击右侧内容打开
```typescript
  HmCardItem({ leftText: '异常类型', rightText: '请选择', onRightClick: () => {
          this.typeDialog.open()
        } })
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701673186835-86ad1aa1-dc1d-4d38-9b32-b45a7a52ffa9.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23bebab9&clientId=u5dc85341-3f7a-4&from=paste&height=711&id=yV1Ur&originHeight=806&originWidth=380&originalType=binary&ratio=2&rotation=0&showTitle=false&size=36135&status=done&style=none&taskId=u97d6252e-e5f6-4059-bf16-4126c5c437c&title=&width=335)

:::info
提交
:::

# 渲染异常内容数据
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701673255467-f8e53ddd-9c93-43e2-8e80-95c44657838b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fbfbfb&clientId=u5dc85341-3f7a-4&from=paste&height=359&id=AeaQe&originHeight=718&originWidth=708&originalType=binary&ratio=2&rotation=0&showTitle=false&size=65361&status=done&style=none&taskId=u3a2ed395-1abd-4df4-931f-a0bb09abf16&title=&width=354)

- 定义循环项
```typescript
  @State 
  exceptErrorList: string[] = ["发动机启动困难", "不着车、漏油", "照明失灵", "有异常响动", "排烟异常、温度异常", "其他问题"]

```

- 使用一个轻量Builder来实现单个的渲染
```typescript
 // 单个的渲染选项
  @Builder
  getSingleItem() {
    Row() {
      Text("发动机漏油").fontSize(14).fontWeight(400).fontColor($r('app.color.text_primary'))
      Row() {
        Image($r("app.media.ic_check_true")).width(32).height(32)
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .border({
      width: {
        bottom: 1
      },
      color: $r('app.color.background_divider')
    })
    .width('100%')
    .height(60)
  }

```

- 根据数据动态生成N个的选项
```typescript
  @Builder
  getCardContent() {
    ForEach(this.exceptErrorList, () => {
        this.getSingleItem()
    })
  }
```

- 定义一个class用来给Builder传递参数
```typescript
class ExceptionItemClass {
  name: string = ""
  index: number = 0
}
```

- 给Builder传递class参数
```typescript
 @Builder
  getSingleItem(item: string, index: number, showBorder: boolean) {
    Row() {
      Text(item)
        .fontSize(14)
        .fontColor($r("app.color.text_primary"))
      Image(this.selectIndex === index ? $r("app.media.ic_check_true") : $r("app.media.ic_check_false"))
        .width(32)
        .height(32)
    }
    .onClick(() => {
      this.selectIndex = index // 赋值索引
    })
    .height(60)
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
    .border({
      color: $r("app.color.background_divider"),
      width: {
        bottom: showBorder ? 1 : 0
      }
    })
  }

  // 传入HmSelectCard组件
  @Builder
  getCardContent() {
    ForEach(this.exceptionList, (item: string, index: number) => {
      this.getSingleItem(item, index, index !== this.exceptionList.length - 1)
    })
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704441150311-16295932-1fc1-46f1-ab14-18f51d2c1500.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e6e2e1&clientId=u99e48d76-e6c1-4&from=paste&height=1484&id=Ryqku&originHeight=1484&originWidth=710&originalType=binary&ratio=1&rotation=0&showTitle=false&size=155192&status=done&style=none&taskId=u5646a331-9778-4331-a5dd-127736d2754&title=&width=710)

- 定义一个状态索引，根据该索引判断当前选项是否被选中
```typescript
@State
selectIndex: number = 0
```
```typescript
 @Builder
  getSingleItem(item: string, index: number, showBorder: boolean) {
    Row() {
      Text(item)
        .fontSize(14)
        .fontColor($r("app.color.text_primary"))
      Image(this.selectIndex === index ? $r("app.media.ic_check_true") : $r("app.media.ic_check_false"))
        .width(32)
        .height(32)
    }
    .onClick(() => {
      this.selectIndex = index // 赋值索引
    })
    .height(60)
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
    .border({
      color: $r("app.color.background_divider"),
      width: {
        bottom: showBorder ? 1 : 0
      }
    })
  }

  // 传入HmSelectCard组件
  @Builder
  getCardContent() {
    ForEach(this.exceptionList, (item: string, index: number) => {
      this.getSingleItem(item, index, index !== this.exceptionList.length - 1)
    })
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704441422038-2b78e54b-5740-44f9-b45d-04f328e86186.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_21%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eee6e5&clientId=u99e48d76-e6c1-4&from=paste&height=944&id=Ec3Pw&originHeight=944&originWidth=724&originalType=binary&ratio=1&rotation=0&showTitle=false&size=98652&status=done&style=none&taskId=uc667bb39-cecc-43e2-8a4f-cdf67ee4cb6&title=&width=724)
:::info
提交代码
:::
# 选择类型

- 点击确定时，将选择的类型赋值给当前的类型属性
```typescript
 // 选择类型的弹层
  selectTypeDialog: CustomDialogController = new CustomDialogController({
    builder: HmSelectCard({
      cardContent: () => {
        // 必须调用一个builder的函数
        this.getCardContent()
      },
      confirm: () => {
        if (this.selectIndex > -1) {
          this.exceptionForm.exceptionType = this.exceptionList[this.selectIndex]
        }
        this.selectTypeDialog.close()
      }
    }),
    customStyle: true,
    alignment: DialogAlignment.Bottom
  })
```

- 绑定数据到CardItem组件
```typescript
HmCardItem({ leftText: '异常类型', rightText: this.exceptionForm.exceptionType || '请选择', showBottomBorder: false,
          onRightClick: () => {
            this.typeDialog.open()
          }
        })
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701674018743-0253e699-a3c7-4a07-b1eb-ff9cdc31ba76.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d8d2d2&clientId=u5dc85341-3f7a-4&from=paste&height=637&id=CRXHc&originHeight=741&originWidth=401&originalType=binary&ratio=2&rotation=0&showTitle=false&size=50696&status=done&style=none&taskId=u6c5a1781-0c80-4e89-a73c-33aac0f4fdb&title=&width=344.5)
:::info
提交代码
:::
# ·上报异常-跳转当前位置页面
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701674089843-de1d3844-99a1-4c7f-906a-a54d39402a03.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e6e4e4&clientId=u5dc85341-3f7a-4&from=paste&height=566&id=B5ft5&originHeight=754&originWidth=386&originalType=binary&ratio=2&rotation=0&showTitle=false&size=31151&status=done&style=none&taskId=uc64858cf-c21c-46d7-bcde-376178c5473&title=&width=290)![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701674110717-6e2698ab-f7b9-4154-90f7-838599f3da87.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_19%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f0f0f0&clientId=u5dc85341-3f7a-4&from=paste&height=570&id=TYuqu&originHeight=1284&originWidth=658&originalType=binary&ratio=2&rotation=0&showTitle=false&size=269614&status=done&style=none&taskId=u39d0e022-bdb9-422b-982b-3e17408e4c2&title=&width=291.9930725097656)

:::info
需要在点击上报位置时，跳转到选择位置页面
:::

1. 点击上报位置跳转到选择位置
```typescript
  HmCardItem({ 
    leftText: '上报位置', 
    rightText:  '请选择',
    onRightClick: () => {
     router.pushUrl({
       url: 'pages/SelectLocation/SelectLocation'
     })}
  })
```

2. 新建pages/SelectLocation/SelectLocation页面
```typescript
import { HmNavBar, HmCard, HmCardItem } from '@hm/basic'
import { MapComponent } from '@hms.core.map.MapComponent'

@Entry
@Component
struct SelectLocation {
  build() {
    Column() {
      HmNavBar({ title: '当前位置' })
      Stack({ alignContent: Alignment.Bottom }) {
        //  地图区域
        MapComponent({
          mapOptions: {
            position: {
              target: {
                latitude: 39.9,
                longitude: 116.4
              },
              zoom: 10
            }
          },
          mapCallback: () => {}
        })
          .width('100%')
          .height('100%')
        Column() {
          HmCard() {
            HmCardItem({ leftText: '回龙观街道', rightText: '100m以内' })
            HmCardItem({ leftText: '金燕龙科研楼', rightText: '100m以内' })
            HmCardItem({ leftText: '春野画室', rightText: '100m以内' })
            HmCardItem({ leftText: '光滑时代(金艳龙科研楼店)', rightText: '100m以内' })
          }
        }
        .padding({
          bottom: 60
        })
      }
    }
    .height('100%').backgroundColor($r('app.color.background_page'))
  }
}
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713344278367-f58bcbdf-5cca-413d-b2a8-6cc6d2838135.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_10%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ececec&clientId=u62c8fa71-88a4-4&from=paste&height=359&id=APqE9&originHeight=718&originWidth=360&originalType=binary&ratio=1&rotation=0&showTitle=false&size=62228&status=done&style=none&taskId=u49285f21-cbab-45bf-84fd-bb0ecf7f74b&title=&width=180)

:::info
提交代码
:::

# 配置地图
官网文档: [https://developer.huawei.com/consumer/cn/doc/app/agc-help-harmonyos-releaseapp-0000001126380068](https://developer.huawei.com/consumer/cn/doc/app/agc-help-harmonyos-releaseapp-0000001126380068)
> 按照微信案例中的签名规则配置如下签名
> p12
> p7b
> cer
> csr
> ![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713344691421-0b46c45c-6117-41a8-8cb8-f8094913ec3b.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%234e4d4b&clientId=u62c8fa71-88a4-4&from=paste&height=195&id=aQyUi&originHeight=195&originWidth=244&originalType=binary&ratio=1&rotation=0&showTitle=false&size=9236&status=done&style=none&taskId=u7340cdad-bf37-4116-b5f6-470b92b559b&title=&width=244)
> - 在agc中开启地图使用
> 
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713344712926-d326de8f-09e5-4c62-a0c5-a3dc6cfae74c.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_29%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23fcfcfc&clientId=u62c8fa71-88a4-4&from=paste&height=662&id=Fwlr6&originHeight=662&originWidth=1000&originalType=binary&ratio=1&rotation=0&showTitle=false&size=59145&status=done&style=none&taskId=ufda2613f-db9b-4d65-bc47-69c285dbb75&title=&width=1000)
> - 在module.json5中配置client_id
> 
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713344728179-1d9e5304-13d0-4943-bc0c-7a13e0864b8f.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_28%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f9f8f8&clientId=u62c8fa71-88a4-4&from=paste&height=450&id=p1eGO&originHeight=450&originWidth=998&originalType=binary&ratio=1&rotation=0&showTitle=false&size=64162&status=done&style=none&taskId=u190d587e-69ba-42d3-9935-72d62ca9642&title=&width=998)
> ![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713344805383-32d72dbe-9dde-47cf-a2c1-b986e5fa3b85.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_37%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%232c2c2b&clientId=u62c8fa71-88a4-4&from=paste&height=574&id=MGUAw&originHeight=574&originWidth=1292&originalType=binary&ratio=1&rotation=0&showTitle=false&size=28533&status=done&style=none&taskId=u1e6ee10f-741e-445c-a9cd-f96221e79a8&title=&width=1292)
> - 添加公钥指纹
> 
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713344794689-6e8a2b92-fa40-4eb3-a5cb-7a714a145eb7.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_27%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f9f8f8&clientId=u62c8fa71-88a4-4&from=paste&height=324&id=ltICh&originHeight=324&originWidth=950&originalType=binary&ratio=1&rotation=0&showTitle=false&size=45622&status=done&style=none&taskId=u30cc7ef3-0c46-45c0-b874-e1319b68d24&title=&width=950)
> - 配置手动签名
> 
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713344911272-d5d8d83d-91be-4079-8b92-ff14b60c7b44.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_56%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%233e4146&clientId=u62c8fa71-88a4-4&from=paste&height=1222&id=evrET&originHeight=1222&originWidth=1960&originalType=binary&ratio=1&rotation=0&showTitle=false&size=181736&status=done&style=none&taskId=u3ae03362-37ec-4e1f-805f-f0ce75d2a6c&title=&width=1960)

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713345128801-32f86a0d-ec33-4205-ab24-016787ae863d.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ecedde&clientId=u62c8fa71-88a4-4&from=paste&height=721&id=BRJOS&originHeight=721&originWidth=336&originalType=binary&ratio=1&rotation=0&showTitle=false&size=157775&status=done&style=none&taskId=ud95850f7-7f97-4237-b4b8-b41e90081e2&title=&width=336)
# 获取当前位置的经纬度
[官方位置文档](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-geolocationmanager-0000001427745092-V3)

- 引入经纬度管理
```typescript
import geoLocationManager from '@ohos.geoLocationManager';

```

- 初始化时获取经纬度
```typescript
aboutToAppear() {
    this.getLocation()
}
async getLocation () {
    try {
      const result = await geoLocationManager.getCurrentLocation()
      AlertDialog.show({
        message: JSON.stringify(result)
      })
    }catch (error) {
      AlertDialog.show({
        message: error.message
      })
    }

  }
```
:::info
没反应？？？？
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713345247702-4f94ab56-f0b5-4a59-828d-329da48b8d65.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23c0c4b9&clientId=u62c8fa71-88a4-4&from=paste&height=717&id=Mejhs&originHeight=717&originWidth=334&originalType=binary&ratio=1&rotation=0&showTitle=false&size=133627&status=done&style=none&taskId=u56b99ee9-352f-49d9-a2d3-ea9df988e24&title=&width=334)

- 获取用户的地理位置**必须经过用户同意**-需要在初始化UIAbility的时候就发起请求
- 并且需要在module.json5中配置地址位置的权限
:::

- module.json5
```json
 {
        "name": "ohos.permission.LOCATION",
        "reason": "$string:LOCATION_REASON",
        "usedScene": {
          "abilities": ["EntryAbility"],
          "when": "always"
        }
      },
      {
        "name": "ohos.permission.APPROXIMATELY_LOCATION",
        "reason": "$string:LOCATION_REASON",
        "usedScene": {
          "abilities": ["EntryAbility"],
          "when": "always"
        }
      },
```

- 在string.json中填写原因
```typescript
 {
      "name": "LOCATION_REASON",
      "value": "申请地理位置"
    }
```

- src/main/ets/entryability/EntryAbility.ts
```typescript
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'


 async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    // 创建管理访问控制模块的实例
    let manger = abilityAccessCtrl.createAtManager()
    // 向用户申请访问授权
    await manger.requestPermissionsFromUser(this.context,
      [
        'ohos.permission.LOCATION',
        'ohos.permission.APPROXIMATELY_LOCATION',
      ])
  }
```


![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701676053427-6913b515-7be5-4a40-b721-4cfbf28d53ab.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23cbcaca&clientId=u5dc85341-3f7a-4&from=paste&height=711&id=JbMxB&originHeight=674&originWidth=375&originalType=binary&ratio=2&rotation=0&showTitle=false&size=45466&status=done&style=none&taskId=uf808f0bb-d64c-4cfe-adc8-7a7d62c79f8&title=&width=395.5)

> 因为模拟器没有真实的位置，想要给一个真实的地址的话可以在模拟器位置心里填入一个经纬度如图
> ![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713345525043-76c58fd5-5a87-4f73-acb0-3301c2cf0542.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ebebeb&clientId=u62c8fa71-88a4-4&from=paste&height=1010&id=aKZwv&originHeight=1010&originWidth=844&originalType=binary&ratio=1&rotation=0&showTitle=false&size=203022&status=done&style=none&taskId=ua22d8a64-d9f6-4d59-a34d-89384e9e8e6&title=&width=844)
> [高德地图坐标拾取器](https://www.bejson.com/other/gaodegetmap/map.html)
> ![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704512369582-5731bbff-1005-4f6d-8722-b186dac79346.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_29%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f5f3f1&clientId=u4f8dc29d-dbc4-4&from=paste&height=506&id=of6AS&originHeight=506&originWidth=1003&originalType=binary&ratio=1&rotation=0&showTitle=false&size=135094&status=done&style=none&taskId=ubb54cf7d-0b21-4c00-87e6-227faacf7ce&title=&width=1003)
> 填入
> ![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704512414789-03a1955e-f616-438a-8ac4-d8fb517b4f54.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_10%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f9f5f5&clientId=u4f8dc29d-dbc4-4&from=paste&height=379&id=fTpCp&originHeight=379&originWidth=367&originalType=binary&ratio=1&rotation=0&showTitle=false&size=18104&status=done&style=none&taskId=u71fad6d1-40ae-47c3-a036-947f3766284&title=&width=367)
> 测试
> ![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1704512438537-1fb3dd93-762e-49ff-9544-21c734ef38e0.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_13%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e1e1e1&clientId=u4f8dc29d-dbc4-4&from=paste&height=179&id=DrXpX&originHeight=179&originWidth=292&originalType=binary&ratio=1&rotation=0&showTitle=false&size=17551&status=done&style=none&taskId=u62ada8cc-c7a0-44a7-bbd4-297c53b3ae0&title=&width=292)

:::info
提交代码
:::

# ~~转化经纬度坐标~~

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713345625048-a26131bd-77af-4db4-a3ec-68f77a721285.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_24%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f3f3&clientId=u62c8fa71-88a4-4&from=paste&height=354&id=CAnnZ&originHeight=354&originWidth=850&originalType=binary&ratio=1&rotation=0&showTitle=false&size=76621&status=done&style=none&taskId=uaa0b8065-950e-464f-9579-19cbb3d3554&title=&width=850)
> 我们需要将GCJ02转成WGS84

您可以通过[map](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/harmonyos-package-summary-0000001697669005)命名空间下的[convertCoordinate](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/harmonyos-package-summary-0000001697669005#section12255142816237)方法进行坐标转换：

- 转化代码
```typescript
import { map, mapCommon } from '@kit.MapKit';
let wgs84Position: mapCommon.LatLng = { 
  latitude: 30, 
  longitude: 118 
};
let gcj02Posion: mapCommon.LatLng = await map.convertCoordinate(mapCommon.CoordinateType.WGS84, mapCommon.CoordinateType.GCJ02,wgs84Position);
```

> **突发！！！**
> **目前获取的地理定位华为改为了GCJ02, 如果我们是显示在花瓣地图上，我们不需要再转化了**
> **高德地图的定位其实需要逆向转化。**


# 获取controller之后设置当前位置

- 声明一个controller
```typescript
mapController: map.MapComponentController = new map.MapComponentController()

```

- 回调赋值controller
```typescript
        MapComponent({
          mapOptions: {
            position: {
              target: {
                latitude: 39.9,
                longitude: 116.4
              },
              zoom: 10
            }
          },
          mapCallback: (err, controller) => {
            if(!err) {
              this.mapController = controller
              this.getLocation()
            }
          }
        })
```

- 获取位置转化坐标-调整照相机位置
```typescript
async getLocation() {
    try {
      const rightPostion = await geoLocationManager.getCurrentLocation()

      //  通过控制器移动焦点到用户的经纬度位置
      this.mapController.moveCamera(map.newCameraPosition({
        target: {
          longitude: rightPostion.longitude,
          latitude: rightPostion.latitude
        },
        zoom: 16 // 缩放级别
      }))

      // 添加一个标记
       this.mapController.addPointAnnotation({
         position: {
           longitude: rightPostion.longitude,
           latitude: rightPostion.latitude
         },
         titles: [{
           content: '您当前的位置'
         }],
       })
    } catch (error) {
      AlertDialog.show({
        message: error.message
      })
    }

  }
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713349942850-d8bd192a-54b9-44d3-89bf-efa67dae4f3c.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23c2d1bf&clientId=u62c8fa71-88a4-4&from=paste&height=721&id=ISYFP&originHeight=721&originWidth=333&originalType=binary&ratio=1&rotation=0&showTitle=false&size=85250&status=done&style=none&taskId=u0e9ddb71-0ac0-46c6-808c-407cdbf8b5b&title=&width=333)
# 根据坐标点搜索周围地址

- 声明一个class
```typescript
class SiteClass {
  name: string = ""
  distance: number = 0
}
```

- 获取方法
```typescript
// site  是@kit.MapKit提供的一个模块

const res = await site.nearbySearch({
    location: {
      longitude: rightResult.longitude,
      latitude: rightResult.latitude
    },
    pageSize: 4,
    pageIndex: 1,
    radius: 50
  })
  this.list = res.sites?.slice(0,4) as SiteClass[] // 只拿4条数据
```

- 声明状态变量
```typescript
  @State
  list: SiteClass[] = []
```

- 赋值变量
```typescript
 const res = await site.nearbySearch({
      location: {
        longitude: rightResult.longitude,
        latitude: rightResult.latitude
      },
      pageSize: 4,
      pageIndex: 1,
      radius: 50
    })
    this.list = res.sites as SiteClass[] // 只拿4条数据
```

- 循环地址
```typescript
       ForEach(this.list, (item: SiteClass) => {
          HmCardItem({ leftText: item.name, rightText: `${item.distance}m` })
            .onClick(() => {
              router.back({
                url: "pages/ExceptionReport/ExceptionReport",
                params: {
                  location: item.name
                }
              })
            })
        })
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1714396799612-1b75ce91-af39-4cf4-a48e-c5c380675fa3.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23c3b9a8&clientId=u56ffab43-7d8e-4&from=paste&height=721&id=u8b5e9b50&originHeight=721&originWidth=332&originalType=binary&ratio=1&rotation=0&showTitle=false&size=114467&status=done&style=none&taskId=u26ddc612-11bc-4070-a72a-5c3afbec742&title=&width=332)

# 点击返回地址

- 点击周围地址，返回地址参数
```typescript
              HmCardItem({ leftText: item.name, rightText: `${item.distance}m` })
                .onClick(() => {
                  router.back({
                    url: "pages/ExceptionReport/ExceptionReport",
                    params: {
                      location: item.name
                    }
                  })
                })
```

4. 在上报异常中获取数据
> **basic模块**

- 在公共路由参数中再添加一个address字段
```typescript
export interface CommonRouterParams {
  id?: string 
  oldTime?: string  
  location?: string 
}
```
> **entry模块**

```diff
- aboutToAppear
+ onPageShow(): void {
    const params = router.getParams() as CommonRouterParams
+    if (params &&  params.location) {
+      this.exceptionForm.exceptionPlace = params.location
+    }

    if (params && params.id) {
      this.exceptionForm.transportTaskId = params.id
    }
  }

```

5. 显示位置到CardItem组件上
```typescript
 HmCardItem({ 
   leftText: '上报位置', 
   rightText: this.exceptionForm.exceptionPlace || '请选择', 
   onRightClick: () => {
   router.pushUrl({
     url: 'pages/SelectLocation/SelectLocation'
   })
 }})
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701683468533-c929cb6c-a0fc-4c89-ac95-8e51e4d5fcc1.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23efeded&clientId=u0074d1d9-ad34-4&from=paste&height=408&id=c2or5&originHeight=813&originWidth=389&originalType=binary&ratio=2&rotation=0&showTitle=false&size=48945&status=done&style=none&taskId=ub47a19e1-efa8-4477-a910-9e54f95a0ea&title=&width=195)

:::info
提交代码
:::

# 处理异常图片的赋值-控制按钮

- 上传图片的赋值
```typescript
      HmUpload({
        title: '上传图片(最多6张)',
        maxNumber: 6,
        canUpload: true,
        imageList: this.exceptionForm.exceptionImagesList || [],
        onImageListChange: (list: ImageList[]) => {
          this.exceptionForm.exceptionImagesList = []
        }
      })
```

- 处理描述的双向绑定
```typescript
  maxNumber: number = 50
```
```typescript
   TextArea({
          placeholder: '请输入异常描述',
          text: this.exceptionForm.exceptionDescribe!
    })
     .height(130).borderRadius(8).placeholderColor($r('app.color.text_secondary')).fontSize(14).onChange((value) => {
            this.exceptionForm.exceptionDescribe = value
        }).maxLength(this.maxNumber)
        Text(`${this.exceptionForm.exceptionDescribe?.length || 0}/${this.maxNumber}`)
          .margin({
            top: -30
          })
          .textAlign(TextAlign.End)
          .width('100%')
          .padding({ right: 15 })
          .fontColor($r('app.color.text_secondary'))
```

- 处理按钮状态
```typescript

  getBtnEnable () {
    return !!(this.exceptionForm.exceptionDescribe &&
    this.exceptionForm.exceptionPlace &&
    this.exceptionForm.exceptionTime &&
    this.exceptionForm.exceptionType &&
    this.exceptionForm.exceptionDescribe)
  }
```

- 绑定按钮
```typescript
   Row() {
        Button("提交")
          .height(50)
          .width(207)
          .backgroundColor( $r('app.color.primary') )
          .enabled(this.getBtnEnable())
      }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701684376365-55e3f4ec-41d0-472b-b4f9-009da8a751c0.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eae5e4&clientId=u0074d1d9-ad34-4&from=paste&height=595&id=rgPWi&originHeight=793&originWidth=377&originalType=binary&ratio=2&rotation=0&showTitle=false&size=38662&status=done&style=none&taskId=u0dfd2be7-bca6-4b55-be03-65bb05ed4b7&title=&width=283)

:::info
提交代码
:::

# 上报异常提交

1. 封装api
```typescript
// 上报异常
export const exceptionReportAPI = (data: ExceptionParamsTypeModel) => {
  return Request.post("/driver/tasks/reportException", data)
}
```

2. 按钮点击提交-返回上一个页面
```typescript
async btnReport () {
    await exceptionReportAPI(this.exceptionForm)
    promptAction.showToast({
      message: '上报异常成功'
    })
    router.back()
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701685091041-f6efbb7c-14c2-4bb3-ab8b-c8d58988a173.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_10%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e6e5e5&clientId=u0074d1d9-ad34-4&from=paste&height=687&id=Rxgcf&originHeight=810&originWidth=365&originalType=binary&ratio=2&rotation=0&showTitle=false&size=61759&status=done&style=none&taskId=ua85b6442-3c06-420c-94df-850611f5b1d&title=&width=309.5)

:::info

- 提交代码
:::
# 根据上报异常数据进行显示
> entry模块

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701685342582-2667e5cc-9880-42bd-a7a1-fe2d8cb44db6.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f5f5f5&clientId=u0142e485-cd11-4&from=paste&height=182&id=ZQKPA&originHeight=222&originWidth=373&originalType=binary&ratio=2&rotation=0&showTitle=false&size=16105&status=done&style=none&taskId=u019c1002-7196-40f9-b61c-8a862539102&title=&width=306.5)
:::info
如果任务详情中，有上报异常数据，则显示控制
:::

- **直接拷贝**现成的结构
```typescript
  // 获取异常信息
  @Builder
  getExceptionContent() {
    ForEach(this.taskDetailData.exceptionList, (item: ExceptionListModel) => {
      Row() {
        Column() {
          Row() {
            Text("上报时间").fontSize(14).fontColor($r('app.color.text_primary'))
            Text(item.exceptionTime).margin({ left: 20 }).fontColor($r('app.color.text_secondary'))
          }.height(50).alignItems(VerticalAlign.Center).width('100%')

          Row() {
            Text("异常类型").fontSize(14).fontColor($r('app.color.text_primary'))
            Text(item.exceptionType).margin({ left: 20 }).fontColor($r('app.color.text_secondary'))
          }.height(50).alignItems(VerticalAlign.Center).width('100%')

          Row() {
            Text("处理结果").fontSize(14).fontColor($r('app.color.text_primary'))
            Text("继续运输").margin({ left: 20 }).fontColor($r('app.color.text_secondary'))
          }.height(50).alignItems(VerticalAlign.Center).width('100%')
        }
        // 跳转到详情
        Image($r("app.media.ic_btn_more")).width(24).height(24)
      }
      .width('100%')
      .padding({ left: 15, right: 15 })
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)

    })
  }
```

- 放置到任务详情的内容区
```typescript
        // 💥💥 初始数据为空 记得加可选链
        if (this.taskDetailData.exceptionList?.length > 0) {
           HmToggleCard({ title: '异常信息' }) {
             this.getExceptionContent()
           }
         }
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701685674346-ff41294c-7c79-4583-a8e8-fbdcffd5b36f.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_12%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f2f2f2&clientId=u0142e485-cd11-4&from=paste&height=209&id=lvTiq&originHeight=235&originWidth=408&originalType=binary&ratio=2&rotation=0&showTitle=false&size=20306&status=done&style=none&taskId=uc0a10c5a-a3eb-49df-af18-dbb3832ebd6&title=&width=363)
:::info
提交代码
:::

# 上报完异常-回到详情加载异常信息
> **entry模块**

1. 在上报异常页面传递一个标记，表示已经加了一条数据
```typescript
 async btnReport() {
    await exceptionReport(this.exceptionForm)
    promptAction.showToast({
      message: '上报异常成功'
    })
    router.back({
      url: 'pages/TaskDetail/TaskDetail',
      params: {
        addExcept: true
      }
    })
  }
```
> 在路由的公共参数添加一个属性add_except的属性

> **basic模块**

```typescript
export interface CommonRouterParams {
  id?: string
  oldTime?: string
  location?: string
  addExcept?: boolean
}
```

2. 在TaskDetail的onPageShow中判断此字段，然后重新加载数据，
> 注意！！！！**只重新赋值异常的信息部分，否则之前上传的图片会被干掉，因为只有异常发生了变化，所以不能执行原来的获取执行逻辑**

```typescript
  async onPageShow() {
    const params = router.getParams()  as CommonRouterParams
    if(params &&  params.addExcept) {
      const result =  await getTaskDetailAPI(this.taskDetailData.id)
      this.taskDetailData.exceptionList = result.exceptionList
    }
  }
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701686062442-2bfae9f8-d547-4de0-99d5-5d105f69fd54.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_10%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f7f7&clientId=u0142e485-cd11-4&from=paste&height=374&id=UeYBZ&originHeight=352&originWidth=357&originalType=binary&ratio=2&rotation=0&showTitle=false&size=21344&status=done&style=none&taskId=ub0e4150f-83bb-4213-b176-382c84260f8&title=&width=379.5)
:::info
提交代码
:::

# 回显上报异常组件
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701686202306-e50a6691-e97c-4540-af22-8ed4a3018c2c.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f5f4f4&clientId=u0142e485-cd11-4&from=paste&height=309&id=dFrZI&originHeight=356&originWidth=400&originalType=binary&ratio=2&rotation=0&showTitle=false&size=32346&status=done&style=none&taskId=u8c3965d5-7036-472e-b948-f7e92a41077&title=&width=347)
> 需求
>    点击右侧的箭头-需要回到异常详情页去显示内容
> 
> **   因为没有查询异常详情的接口，我们可以把点击当前行的整行数据传到详情页**

> **basic模块**

- 在公共路由参数添加一个新的参数
```typescript

export class CommonRouterParams {
  id?: string = ''
  oldTime?: string = ''
  address?: string = ''
  addExcept?: boolean = false
  formData?: object
}
```
> **entry模块**

1. 新建pages/Exception/ExceptionDetail.ets
> 这里做过多操作已经无意，直接拷贝下方结构即可

- **直接拷贝结构**
```typescript
import { HmNavBar, HmCardItem, HmCard, CommonRouterParams, ImageListModel } from '@hm/basic'
import router from '@ohos.router'
import {  ExceptionListModel } from '../../models'

@Entry
@Component
struct ExceptDetail {
  @State submitForm: ExceptionListModel = {} as ExceptionListModel
  aboutToAppear() {
    const params = router.getParams() as CommonRouterParams
    if (params && params.formData) {
      // 检查formData
      this.submitForm = params.formData as ExceptionListModel
    }
  }
  @Builder
  getCardChildren() {
    HmCardItem({ leftText: '异常时间', rightText: this.submitForm.exceptionTime, showRightIcon: false, })
    HmCardItem({ leftText: '上报位置', rightText: this.submitForm.exceptionPlace, showRightIcon: false, })
    HmCardItem({ leftText: '异常类型', rightText: this.submitForm.exceptionType, showRightIcon: false })
    HmCardItem({ leftText: '异常描述', showBottomBorder: false, showRightIcon: false, rightText: '' })
    Row() {
      Text(this.submitForm.exceptionDescribe).fontSize(14).fontColor($r('app.color.text_primary'))
    }.padding(15).justifyContent(FlexAlign.Start).width('100%')
  }
  @Builder
  getUpload() {
    if (this.submitForm.exceptionImagesList?.length) {
      Text("异常图片").width('100%').padding(10)
      Flex({ wrap: FlexWrap.Wrap, direction: FlexDirection.Row }) {
        ForEach(this.submitForm.exceptionImagesList, (item: ImageListModel) => {
          Image(item.url)
            .width(95)
            .height(95)
            .borderRadius(4)
            .margin({ right: 15 })
        })
      }
      .width('100%').margin({ top: 16.5, bottom: 16.5 })
    }
  }

  build() {
    Column() {
      HmNavBar({ title: '异常详情' })
      HmCard() {
        this.getCardChildren()
      }
      HmCard() {
        this.getUpload()
      }
    }.height('100%').backgroundColor($r('app.color.background_page'))
  }
}

export default ExceptDetail
```

2. 点击TaskDetail的右侧箭头跳转-传递formData
```typescript

        // 跳转到详情
        Image($r("app.media.ic_btn_more")).width(24).height(24)
        .onClick(() => {
          router.pushUrl({
            url: "pages/ExceptionReport/ExceptionDetail",
            params: {
              formData: item
            }
          })
        })
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701686692422-7de3c868-79ea-4c20-8fb1-a86680df6567.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23ececec&clientId=u0142e485-cd11-4&from=paste&height=797&id=kYECb&originHeight=775&originWidth=375&originalType=binary&ratio=2&rotation=0&showTitle=false&size=30458&status=done&style=none&taskId=u63e28bd3-1f2a-4abc-88d6-8ecc3c66d31&title=&width=385.5)

:::info
提交代码
:::

# 导航功能

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701686777951-487e2aab-8075-4998-858d-95fad7844d60.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_11%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f4f3f3&clientId=u0142e485-cd11-4&from=paste&height=376&id=z4r1Z&originHeight=323&originWidth=399&originalType=binary&ratio=2&rotation=0&showTitle=false&size=36576&status=done&style=none&taskId=u8acd70cb-b596-42e0-bcfd-cc96321d7c0&title=&width=464.5)
:::info
只在在途的状态下显示导航
:::
```typescript
  // 在途情况下 才显示导航
      if (this.taskDetailData.status === TaskTypeEnum.Line) {
        Column() {
          Image($r("app.media.ic_navigation")).width(22).height(22)
          Text("开始导航").fontSize(14).margin({ top: 10, bottom: 10 })
        }.justifyContent(FlexAlign.SpaceBetween)
        .margin({
          top: 20
        })
      }

```

- 点击开始导航
```typescript
 // 获取基础信息
  // 开始导航
  async beginNav() {
    try {
      let context = getContext(this) as common.UIAbilityContext
      context.startAbility({
        action: 'ohos.want.action.viewData',
        entities: ['entity.system.browsable'],
        uri: encodeURI('https://gaode.com/search?query=' + this.taskDetailData.endAddress)
      })
    } catch (error) {
      AlertDialog.show({
        message: JSON.stringify(error)
      })
    }

  }
```
> 目前高德地图的导航调用方式无法得知，无法打开导航路线，只能用浏览器唤起打开高德页面，传入我们的地址


:::info
提交代码
:::

# 打电话功能
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701690588898-4212ba8d-5df8-40cb-b5bc-21597c87aadc.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_12%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f4f3f3&clientId=uf9aa94c4-54a5-4&from=paste&height=406&id=Gv4T3&originHeight=448&originWidth=408&originalType=binary&ratio=2&rotation=0&showTitle=false&size=47529&status=done&style=none&taskId=u419c0d8a-550c-48c5-9fb6-ac573dca9c7&title=&width=370)

1. 导入使用包
```typescript
import call from '@ohos.telephony.call'

```

- 给之前的builder类型添加一个图标点击事件
```typescript
interface BaseBuilderClass {
  title: string
  value: string 
  icon?: ResourceStr 
  iconClick?: () => void 
}
```

2. 点击图标打电话
```typescript
@Builder
  getBaseContentItem(item: BaseBuilderClass) {
    Row() {
      Text(item.title).fontSize(14).fontColor($r('app.color.text_secondary'))
        .lineHeight(20)
      Row() {
        Text(item.value).fontSize(14).fontColor($r('app.color.text_secondary'))
        if (item.icon) {
          Image(item.icon).width(24).height(24)
            .onClick(() => {
             item.iconClick && item.iconClick()
            })
        }
      }
    }.justifyContent(FlexAlign.SpaceBetween).width('100%').margin({
      top: 14
    })
  }
```
```typescript
 this.getBaseContentItem({
      title: '联系电话',
      value: this.taskDetailData.startHandoverPhone,
      icon: $r('app.media.ic_phone'),
      iconClick: () => {
        call.makeCall(this.taskDetailData.startHandoverPhone);
      }
    })
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701690974685-387e7b4f-979d-4d3c-bbce-12ccaee67ce4.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_10%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f2f2f2&clientId=uf9aa94c4-54a5-4&from=paste&height=406&id=in1qY&originHeight=809&originWidth=361&originalType=binary&ratio=2&rotation=0&showTitle=false&size=38192&status=done&style=none&taskId=u21d92556-e17c-4cd9-9282-89a1b25cf4d&title=&width=181)

:::info
提交代码
:::

# 已完成任务列表加入搜索条件结构
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701691185508-67d94646-d823-4055-9cde-a226d86c873f.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_22%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f5f5&clientId=uf9aa94c4-54a5-4&from=paste&height=143&id=frcsl&originHeight=246&originWidth=756&originalType=binary&ratio=2&rotation=0&showTitle=false&size=31591&status=done&style=none&taskId=u0c0a7758-7259-41f7-abdc-595dbf994e5&title=&width=439)

- 在TaskTabs中复用TaskList
```typescript
else if(item.name === "finish") {
  TaskList({ 
    queryParams: {
      page: 1,
      pageSize: 5,
      status: TaskTypeEnum.Finish
    } as TaskListParamsModel 
  })
  }
```

- 在TaskList中新增搜索条件
```typescript

// 添加装饰器
 @Prop
  queryParams: TaskListParamsModel = {
    page: 1, // 表示查询第几页的数据 ++
    pageSize: 10, // 表示每页查几条数据
    status: TaskTypeEnum.Waiting,
  } as TaskListParamsModel

// 搜索条件builder
  @Builder
  getSearchForm() {
    Column() {
      Row() {
        Search({ placeholder: '请输入任务编号' }).backgroundColor($r('app.color.background_page')).height(32)
      }
      .justifyContent(FlexAlign.Center)
      .padding({ left: 15, right: 15, bottom: 5 })

      Row() {
        // 完成搜索页需要测试点击之后键盘和弹层同时弹出的情况
        Button(this.queryParams.startTime || '开始时间')
          .fontSize(14)
          .width(106)
          .height(32)
          .padding({ left: 0, right: 0 })
          .fontColor('#999')
          .backgroundColor($r('app.color.background_page'))
          .onClick(() => {
            DatePickerDialog.show({
              selected: new Date(),
              onDateAccept: (value) => {
                this.queryParams.startTime = dayjs(value).format('YYYY-MM-DD')
              }
            })
          })

        Text("至")
        Button(this.queryParams.endTime || '结束时间')
          .fontSize(14)
          .width(110)
          .height(32)
          .padding({ left: 0, right: 0 })
          .fontColor('#999')
          .backgroundColor($r('app.color.background_page'))
          .onClick(() => {
            DatePickerDialog.show({
              selected: new Date(),
              onDateAccept: (value) => {
                this.queryParams.endTime = dayjs(value).format('YYYY-MM-DD')
              }
            })
          })

        Button("筛选")
          .backgroundColor($r('app.color.primary'))
          .height(32)
          .width(60)
      }.width('100%').alignItems(VerticalAlign.Center).justifyContent(FlexAlign.SpaceAround)
    }
    .backgroundColor($r('app.color.white'))
    .padding(15)
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }
```

- TaskList中显示搜索表单
```typescript
build() {
    Column() {
      if(this.queryParams.status === TaskTypeEnum.Finish) {
        this.getSearchForm()
      }
      HmList({
        onLoad: async () => {
          await this.getTaskList(true)
        },
        onRefresh: async () => {
          await this.onRefresh()
        },
        dataSource: $taskListData,
        renderItem: this.renderItem,
        finished: this.allPage < this.queryParams.page,
        finishText: '没啦没啦',
        loadingText: '拼命加载中'
      })
        .layoutWeight(1)
      
    }
    .height('100%')
  }
```

- TaskItem-在已完成状态，不显示按钮
```typescript
 if (this.taskItem.status !== TaskTypeEnum.Finish) {
    Button(this.getBtnText(), { type: ButtonType.Capsule })
      .backgroundColor($r('app.color.primary'))
      .fontColor($r("app.color.white"))
      .fontSize(14)
      .height(32)
      .enabled(this.getBtnEnable())
      .onClick(() => {
        this.toPickUp()
      })
  }

```

- 点击卡片，当已完成时，可以进去查看详情
```typescript
 .onClick(() => {
      if (this.taskItem.status === TaskTypeEnum.Finish) {
        router.pushUrl({
          url: 'pages/TaskDetail/TaskDetail',
          params: {
            id: this.taskItem.id
          }
        })
      }
    })
```

- TaskDetail中当已完成时，可以展示图片

![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713415293423-4415df8b-f2db-4933-904a-6224d7a253f7.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_56%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23333030&clientId=ue77cb9b9-b44d-4&from=paste&height=1198&id=xxYIV&originHeight=1198&originWidth=1954&originalType=binary&ratio=1&rotation=0&showTitle=false&size=146902&status=done&style=none&taskId=uf6121820-d710-4881-b93f-5a84615ba6b&title=&width=1954)

- 当已完成时，不显示底部内容
```typescript
 if(this.taskDetailData.status !== TaskTypeEnum.Finish) {
          this.getBottomBtn() // 底部按钮结构
        }
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713415330954-15835ce0-ea06-428d-a371-4c75d61b3417.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23eceae7&clientId=ue77cb9b9-b44d-4&from=paste&height=721&id=DdyVv&originHeight=721&originWidth=331&originalType=binary&ratio=1&rotation=0&showTitle=false&size=66347&status=done&style=none&taskId=u9b165948-3535-40bc-9333-50262d0c4b4&title=&width=331)
:::info
提交代码
:::
# 已完成搜索-选择日期
> **entry模块**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701695105816-b9f89d2f-9bc8-4a91-b646-ceeb16bccb97.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_21%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d9d9d9&clientId=ub391cf5a-8671-4&from=paste&height=341&id=p9kgd&originHeight=1364&originWidth=724&originalType=binary&ratio=2&rotation=0&showTitle=false&size=163691&status=done&style=none&taskId=ubb07e70c-6519-4ba3-bc25-2ae10ea86d2&title=&width=181)

- 加入loading进度条
```typescript
  loading: CustomDialogController = new CustomDialogController({
    builder: HmLoading({
      title: '搜索查询中'
    }),
    customStyle: true,
    autoCancel: false,
    alignment: DialogAlignment.Center
  })
```

> 控制能否点击，点击事件，查询数据

```typescript
         Button("筛选")
          .backgroundColor( $r('app.color.primary'))
          .height(32)
          .width(60)
          .enabled(!!(this.queryParams.startTime && this.queryParams.endTime))
          .onClick(async() => {
            this.loading.open()
            this.allPage = 1
            this.queryParams.page = 1
            await this.getTaskList(false)
            this.loading.close()
          })
```

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701696251207-bd025c98-56ed-4e5f-91df-cf8eb8439fdb.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f4f3f3&clientId=u713764cc-6d14-4&from=paste&height=688&id=Q4WFR&originHeight=1376&originWidth=716&originalType=binary&ratio=2&rotation=0&showTitle=false&size=78217&status=done&style=none&taskId=u9db12efe-afea-4f3c-9374-86a080731a1&title=&width=358)

:::info
提交代码
:::

# 清空状态控制
> 目前我们发现一个问题，选择完开始时间和结束时间，没有办法取消了，所以我们定义一个状态来控制下

- 定义一个状态
```typescript
  @State
  reset: boolean = false // 用于控制重置状态
```

- 如果查询完一次之后，将状态设置为true
```typescript
   Button(this.reset ? "重置" : "筛选")
          .backgroundColor(this.getSearchEnable() ? $r('app.color.primary') : $r('app.color.primary_disabled'))
          .height(32)
          .width(60)
          .enabled(this.getSearchEnable())
          .onClick(async() => {
            if(this.reset){
              this.queryParams.startTime = ''
              this.queryParams.endTime = ''
            }
            
            this.reset = !this.reset
            this.loading.open()
            this.allPage = 1
            this.queryParams.page = 1
            await this.getTaskList(false)
            this.loading.close()
          })
```
# 输入单号搜索
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701696638507-3bbe1745-e3fd-4921-b953-0591d9e55868.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_20%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f7f6f6&clientId=u713764cc-6d14-4&from=paste&height=376&id=jlmTT&originHeight=752&originWidth=694&originalType=binary&ratio=2&rotation=0&showTitle=false&size=67549&status=done&style=none&taskId=u2463bde5-cb5d-47d2-ac86-88d2cfc8971&title=&width=347)
> 输入单号不影响分页及其他，只覆盖数据，不影响下拉刷新的逻辑
> - 注意参数传递不是id， 是transportTaskId。任务编号显示的是id
> - 如果有值，那么意味着即使查也只能查出一条，那么不能触发上拉加载
> - 有值情况下，如果已经有开始时间和结束时间，要清空，
> - 如果有没有值，要清空查询参数中的transportTaskId

```typescript
 Search({ placeholder: '请输入任务编号', value: this.queryParams.transportTaskId || '' }).backgroundColor($r('app.color.background_page')).height(32)
         .onSubmit(async value => {
            this.loading.open()
            this.queryParams.page = 1
            if(value) {
              this.queryParams.startTime = ''
              this.queryParams.endTime = ''
              this.reset = false
              this.allPage = 0 // 有值意味着只有一条 因为是根据单号传的，所以不让它继续往后查 否则会重复
              this.queryParams.transportTaskId =  value 
            }else {
              this.allPage = 1 // 没值意味着查不到 重新加载
              this.queryParams.transportTaskId = ""
            }
            const result = await getTaskList(this.queryParams)
            this.taskListData = result.items || []
            this.loading.close()
          })
```
> - 这里逻辑捋一捋


整体代码

```typescript
import { HmList, HmLoading } from '@hm/basic/Index'
import { getTaskList } from '../../../api'
import { TaskInfoItem, TaskInfoItemModel, TaskListParams, TaskListParamsModel, TaskTypeEnum } from '../../../models'
import TaskItemCard from './TaskItemCard'
import { promptAction } from '@kit.ArkUI'

// 待提货
@Component
struct TaskList {
  loading: CustomDialogController = new CustomDialogController({
    builder: HmLoading(),
    customStyle: true
  })
  @State
  queryParams: TaskListParamsModel = new TaskListParamsModel(
    {
      status: TaskTypeEnum.Waiting, // 待提货的类型
      page: 1, // 第几页
      pageSize: 5 // 每页几条数据
    } as TaskListParams
  )
  @State
  taskListData: TaskInfoItem[] = []
  @State
  allPage: number = 1 // 默认只有一页
  @State
  reset: boolean = false // 用来控制重置状态

  async getTaskList(append: boolean) {
    const result = await getTaskList(this.queryParams)
    // 追加数据
    // this.taskListData = this.taskListData.concat(result.items) // 拿到返回的数组
    if (append) {
      this.taskListData.push(...result.items || []) // 延展运算符的写法
    } else {
      this.taskListData = result.items // 直接赋值
    }

    this.allPage = result.pages // 总页数
    this.queryParams.page++ // 下次请求的页码
  }

  @Builder
  renderItem(item: object) {
    TaskItemCard({ taskItem: item as TaskInfoItemModel })
  }

  // 下拉刷新函数
  async onRefresh() {
    // 重新请求第一页数据
    this.queryParams.page = 1 // 重置第一页
    await this.getTaskList(false) // 直接赋值
  }

  // 补零函数
  addZero(value: number) {
    return value.toString().padStart(2, "0")
  }

  // 获取筛选按钮是否可用
  getSearchEnable() {
    return !!(this.queryParams.startTime && this.queryParams.endTime)
  }

  @Builder
  getSearchForm() {
    Column() {
      Row() {
        Search({ placeholder: '请输入任务编号', value: this.queryParams.transportTaskId || "" })
          .backgroundColor($r('app.color.background_page'))
          .height(32)
          .onSubmit(async (value) => {
            // 点击键盘的右下角的提交
            // 4042715413936324752
            this.loading.open()
            this.allPage = 1 // 总页数为1
            this.queryParams.page = 1 // 查第一页
            if (value) {
              // 有单号的情况 如果有只有一条记录
              // 后台业务缺陷- 按道理来说 如果传单号的了 应该开始时间和结束时间自动忽略
              this.queryParams.startTime = ""
              this.queryParams.endTime = ""
              this.queryParams.transportTaskId = value
            } else {
              // 没有单号的情况下恢复之前的查询
              this.queryParams.transportTaskId = ""
            }
            await this.getTaskList(false) // 不追加数据
            this.loading.close()
          })
      }
      .justifyContent(FlexAlign.Center)
      .padding({ left: 15, right: 15, bottom: 5 })

      Row() {
        // 完成搜索页需要测试点击之后键盘和弹层同时弹出的情况
        Button(this.queryParams.startTime || '开始时间')
          .fontSize(14)
          .width(106)
          .height(32)
          .padding({ left: 0, right: 0 })
          .fontColor('#999')
          .backgroundColor($r('app.color.background_page'))
          .onClick(() => {
            DatePickerDialog.show({
              selected: new Date(),
              onDateAccept: (value) => {
                this.queryParams.startTime =
                  `${value.getFullYear()}-${this.addZero(value.getMonth() + 1)}-${this.addZero(value.getDate())}`
              }
            })
          })

        Text("至")
        Button(this.queryParams.endTime || '结束时间')
          .fontSize(14)
          .width(110)
          .height(32)
          .padding({ left: 0, right: 0 })
          .fontColor('#999')
          .backgroundColor($r('app.color.background_page'))
          .onClick(() => {
            DatePickerDialog.show({
              selected: new Date(),
              onDateAccept: (value) => {
                this.queryParams.endTime =
                  `${value.getFullYear()}-${this.addZero(value.getMonth() + 1)}-${this.addZero(value.getDate())}`
              }
            })
          })
        Button(this.reset ? "重置" : "筛选")
          .backgroundColor($r('app.color.primary'))
          .height(32)
          .width(60)
          .enabled(this.getSearchEnable())
          .onClick(async () => {
            if (this.reset) {
              // 表示现在需要重置 将开始时间和结束时间清空
              this.queryParams.startTime = ""
              this.queryParams.endTime = ""
            }
            this.reset = !this.reset // 状态取反

            this.loading.open()
            // 搜索
            // 处理总页数 处理第几页
            this.allPage = 1 // 默认有一页
            this.queryParams.page = 1
            // 获取数据
            await this.getTaskList(false) // true是追加 false是不追加

            this.loading.close()

          })
      }.width('100%').alignItems(VerticalAlign.Center).justifyContent(FlexAlign.SpaceAround)
    }
    .backgroundColor($r('app.color.white'))
    .padding(15)
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }

  build() {
    Column() {
      // 是否显示搜索条件
      if (this.queryParams.status === TaskTypeEnum.Finish) {
        // 显示搜索条件
        this.getSearchForm()
      }
      HmList({
        dataSource: this.taskListData, // 数据源
        finished: this.allPage < this.queryParams.page, // 是否还有下一页
        // 上拉加载的函数
        onLoad: async () => {
          // 上拉加载
          await this.getTaskList(true) // 追加逻辑
        },
        onRefresh: async () => {
          // 下拉刷新
          await this.onRefresh()
        },
        renderItem: (item: object) => {
          // 如果需要的是builderParams的参数 可以用普通函数包裹一个Builder的函数
          this.renderItem(item)
        },
        loadingText: '拼命加载中',
        finishText: '没啦没啦'
      }).height("100%")
    }

  }
}

export default TaskList
```

:::info

- 提交代码
:::

# 多线程处理图片压缩
> 性能优化
> - 资源-图片不要全用原图
> - 请求-尽可能延后-最好不要把所有请求都放在入口处
> - 组件-尽可能采用拆分组件-延展组件- 低开门-高入户
> - 设计-多层架构-高内聚低耦合-公用har-包共用hsp
> - 多任务处理-多线程-耗时任务-IO操作-文件压缩-解压缩-裁剪-位移
> - 主线程-子线程处理耗时任务（[诸多限制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/multi-thread-safety-V5)）


> 1. **建立多线程 子线程**
> 2. **将主线程拿到的图片给到子线程**
> 3. **子线程进行图片的压缩**
> 4. **压缩完成 将完成的图片信息回传给主线程**
> 5. **子线程自动关闭销毁**
> 6. **主线程继续上传操作**

- 新建一个UploadWorker
```typescript
import { ImageList } from '@hm/basic/Index';
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, util, worker } from '@kit.ArkTS';
import { fileIo } from '@kit.CoreFileKit';
import { image } from '@kit.ImageKit';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

export class PostParams {
  files: ImageList[] = []
  filePath: string = "" // 沙箱目录
}

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = async (e: MessageEvents) => {
  // 处理耗时任务e
  const params = e.data as PostParams
  // 进行图片压缩
  if (params && params.files) {
     // 拿到原图
    // 对原图进行压缩
    // 需要将原图压缩成新的图片 存到一个位置
    const imagePackerAPI = image.createImagePacker() // 创建图片压缩API
    let packOpts: image.PackingOption = { format: "image/jpeg", quality: 20 };
    let arr: ImageList[] = []
    while (params.files.length) {
      const obj = params.files.pop() // 每次取一条
      const sourceFile = fileIo.openSync(obj?.url, fileIo.OpenMode.READ_ONLY) // 打开来源文件
      // 对来源文件进行压缩
      const newFileName = params.filePath + "/" + util.generateRandomUUID() + ".jpg"
      const targetFile = fileIo.openSync(newFileName, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE)
      // 目标文件的fd
      await imagePackerAPI.packToFile(image.createImageSource(sourceFile.fd), targetFile.fd, packOpts)
      fileIo.closeSync(sourceFile.fd) // 关闭来源文件
      fileIo.closeSync(targetFile.fd) // 关闭目标文件
      arr.push({
        url: newFileName
      })
    }
    // 图片压缩完毕 将图片传出去
    // 这里不需要序列化
    workerPort.postMessage({ files: arr }) // 子线程往主线程发消息
    workerPort.close() // 结束子线程

  }


}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = (e: MessageEvents) => {
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = (e: ErrorEvent) => {
}
```

- 提货交货时处理图片压缩
```typescript

  // 交货
  async onDeliver() {
    this.loading.open()
    // 建立子线程
    const imageCompress1 = new worker.ThreadWorker("entry/ets/workers/UploadWorker.ets") // 子线程1
    const imageCompress2 = new worker.ThreadWorker("entry/ets/workers/UploadWorker.ets") // 子线程2
    let certificatePictureList: ImageList[] = []
    let deliverPictureList: ImageList[] = []

    // 用来检查是否全部都压缩完毕
    const checkFile = async () => {
      if (certificatePictureList.length && deliverPictureList.length) {
        // 此时此刻才可以进行下一步操作
        const result = await Promise.all([UploadFile(certificatePictureList), UploadFile(deliverPictureList)])
        await deliver(new DeliverParamsTypeModel({
          id: this.taskDetailData.id,
          certificatePictureList: result[0],
          deliverPictureList: result[1]
        }))
        this.getTaskDetail(this.taskDetailData.id) // 重新拉取数据
        this.scroller.scrollEdge(Edge.Top)
        promptAction.showToast({ message: '交货成功' })
        this.loading.close()
      }
    }
    
    imageCompress1.onmessage = (e: MessageEvents) => {
      const params = e.data as PostParams
      certificatePictureList = params.files // 已经压缩完毕的图片
      checkFile() // 检查是否都完成了
    }
    imageCompress2.onmessage = (e: MessageEvents) => {
      const params = e.data as PostParams
      deliverPictureList = params.files // 已经压缩完毕的图片
      checkFile()
    }
    imageCompress1.postMessage({
      files: [...this.taskDetailData.certificatePictureList],
      filePath: getContext().filesDir
    }) // 给子线程发消息
    imageCompress2.postMessage({
      files: [...this.taskDetailData.deliverPictureList],
      filePath: getContext().filesDir
    }) // 给子线程发消息
    
   
    // this.loading.open()
    // const certificatePictureList = await UploadFile(this.taskDetailData.certificatePictureList) // 传入提货凭证
    // const deliverPictureList = await UploadFile(this.taskDetailData.deliverPictureList) // 货品照片
    // // 交货操作
    // await deliver(new DeliverParamsTypeModel({
    //   id: this.taskDetailData.id,
    //   certificatePictureList,
    //   deliverPictureList
    // }))
    // // 只需要重新获取数据
    // // 重新获取数据
    // this.getTaskDetail(this.taskDetailData.id) // 重新拉取数据
    //
    // this.scroller.scrollEdge(Edge.Top)
    // this.loading.close()
    // // 滚动到顶部
    // promptAction.showToast({ message: '交货成功' })

  }
```
# ~~集成消息模块~~
:::info
消息模块内容较为简单
   同学们将老师提供的模块导入到项目中结成即可，也可以自己尝试自己去编写
:::
> **entry模块**

1. 新建models/message.ts
```typescript
export interface MessageQueryType {
  /** 消息类型，200：司机端公告，201：司机端系统通知 */
  contentType: number;
  page: number;
  pageSize: number;
}


export interface MessageData {
  /** 总条目数 */
  counts: number;
  items: MessageItem[];
  /** 页码 */
  page: number;
  /** 总页数 */
  pages: number;
  /** 页尺寸 */
  pageSize: number;
}

/** 数据列表 */
export interface MessageItem {
  /** 1：用户端，2：司机端，3：快递员端，4：后台管理系统 */
  bussinessType: number;
  /** 消息内容 */
  content: string;
  /** 消息类型，300：快递员端公告，301：寄件相关消息，302：签收相关消息，303：快件取消消息，200：司机端公告，201：司机端系统通知 */
  contentType: number;
  /** 创建时间 */
  created: string;
  /** 创建者 */
  createUser: number;
  /** 主键 */
  id: number;
  /** 消息是否已读，0：未读，1：已读 */
  isRead: number;
  /** 读时间 */
  readTime: string;
  /** 相关id */
  relevantId: number;
  /** 消息标题 */
  title: string;
  /** 更新时间 */
  updated: string;
  /** 更新者 */
  updateUser: number;
  /** 消息接受者 */
  userId: number;
}
interface  DetailType {
  id: string
  content: string
  created: string
}

export class MessageQueryTypeModel implements MessageQueryType {
  contentType: number = 0
  page: number = 0
  pageSize: number = 0

  constructor(model: MessageQueryType) {
    this.contentType = model.contentType
    this.page = model.page
    this.pageSize = model.pageSize
  }
}
export class MessageDataModel implements MessageData {
  counts: number = 0
  items: MessageItem[] = []
  page: number = 0
  pages: number = 0
  pageSize: number = 0

  constructor(model: MessageData) {
    this.counts = model.counts
    this.items = model.items
    this.page = model.page
    this.pages = model.pages
    this.pageSize = model.pageSize
  }
}
export class MessageItemModel implements MessageItem {
  bussinessType: number = 0
  content: string = ''
  contentType: number = 0
  created: string = ''
  createUser: number = 0
  id: number = 0
  isRead: number = 0
  readTime: string = ''
  relevantId: number = 0
  title: string = ''
  updated: string = ''
  updateUser: number = 0
  userId: number = 0

  constructor(model: MessageItem) {
    this.bussinessType = model.bussinessType
    this.content = model.content
    this.contentType = model.contentType
    this.created = model.created
    this.createUser = model.createUser
    this.id = model.id
    this.isRead = model.isRead
    this.readTime = model.readTime
    this.relevantId = model.relevantId
    this.title = model.title
    this.updated = model.updated
    this.updateUser = model.updateUser
    this.userId = model.userId
  }
}
export class DetailTypeModel implements DetailType {
  id: string = ''
  content: string = ''
  created: string = ''

  constructor(model: DetailType) {
    this.id = model.id
    this.content = model.content
    this.created = model.created
  }
}

```

- 在models/index.ts中导出
```typescript
export * from './message'
```

- 新建api/message.ets
```typescript
import { Request } from '@hm/basic'
import {  MessageQueryTypeModel, MessageDataModel } from '../models'

// 获取信息
export const getMessage = (params: MessageQueryTypeModel) => {
  return Request.get<MessageDataModel>("/driver/messages/page", params)
}

// 标记已读
export const readMessage = (id: string) => {
  return Request.put<null>(`/driver/messages/${id}`)
}

// 全部已读
export const readAllMessage = (contentType: string) => {
  return Request.put<null>(`/driver/messages/readAll/${contentType}`)
}
```

- 在api/index.ets导出
```typescript
export * from './message'
```

- 在pages/Index下新建Message/Message.ets组件
```typescript
import { HmNavBar, TabClass } from '@hm/basic'
import MessageTemplate from './MessageTemplate'
@Component
struct Message {
  @State currentTabName: string = 'information'
  @State tabBarData: TabClass[] = [{
    title: '公告',
    name: 'information'
  }, {
    title: '任务通知',
    name: 'notice'
  }]
  @Builder
  TabBuilder(item: TabClass) {
    Column() {
      Text(item.title)
        .fontSize(16)
        .fontColor(this.currentTabName === item.name ? $r('app.color.text_primary') : $r('app.color.text_secondary'))
        .fontWeight(this.currentTabName === item.name ? 500 : 400)
        .lineHeight(50)
        .height(50)
      Divider()
        .strokeWidth(4)
        .color($r('app.color.primary'))
        .opacity(this.currentTabName === item.name ? 1 : 0)
        .width(this.currentTabName === item.name ? 23 : 0)
        .animation({
          duration: 300,
          curve: Curve.EaseOut,
          iterations: 1,
          playMode: PlayMode.Normal
        })
    }
  }

  build() {
    Column() {
      HmNavBar({ title: '消息', showBackIcon: false })
      Tabs({
        barPosition: BarPosition.Start,
        controller: new TabsController()
      }) {
        ForEach(this.tabBarData, (item: TabClass) => {
          TabContent() {
            Flex() {
              MessageTemplate({ type: item.name || '' })
            }.height('100%').backgroundColor($r('app.color.background_page'))
          }.tabBar(this.TabBuilder(item))
        })
      }.animationDuration(300).onChange((index) => {
        this.currentTabName = index === 0 ? 'information' : 'notice'
      })
    }.width('100%').height('100%')
  }
}

export default Message
```

- 在Message.ets旁新建MessageTemplate.ets
```typescript
import { getMessage, readAllMessage, readMessage } from '../../../api'
import { MessageQueryTypeModel, MessageItemModel } from '../../../models'
import router from '@ohos.router';
import { HmList } from '../../../components'
import promptAction from '@ohos.promptAction';

@Component
struct MessageTemplate {
  @Prop
  type: string
  @State
  queryParams: MessageQueryTypeModel = new MessageQueryTypeModel({
    page: 1,
    pageSize: 10,
    contentType: this.type === "information" ? 200 : 201
  })
  @State
  allPage: number = 1
  @State
  messageList: MessageItemModel[] = []

  async getMessage(append: boolean) {
    if (this.allPage < this.queryParams.page) {
      return
    }
    const result = await getMessage(this.queryParams)
    if (append) {
      this.messageList = this.messageList.concat(result.items)   // 追加数据
    } else {
      this.messageList = result.items // 覆盖数据
    }
    this.queryParams.page++
    this.allPage = result.pages
  }
  async refreshData() {
    this.allPage = 1 // 只要下拉就默认有一页
    this.queryParams.page = 1
    await this.getMessage(false)
    promptAction.showToast({ message: '刷新成功' })
  }

  @Builder
  renderItem(item: object) {
    if(this.type === "information") {
      this.renderInformationItem(item as MessageItemModel)
    }
    if(this.type === "notice") {
      this.renderNoticeItem(item as MessageItemModel)
    }
  }
  // 读取
  readSuccess() {
    this.messageList = this.messageList.map(item => {
      item.isRead = 1
      return item
    })
  }
  @Builder
  renderInformationItem (item: MessageItemModel) {
    Row() {
      Row() {
        if (item.isRead === 0) {
          Text("").width(8).height(8).backgroundColor($r('app.color.primary')).borderRadius(4)
        }
        Text(item.content)
          .fontSize(14)
          .fontColor($r("app.color.text_primary"))
          .margin({ left: 6 })
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
      }.width(230)

      Text(item.created).fontSize(12).fontColor($r("app.color.text_secondary"))
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .padding({ left: 22, right: 22 })
    .height(60)
    .backgroundColor($r('app.color.white'))
    .border({ width: { bottom: 1 }, color: $r("app.color.background_page") })
    .width('100%')
    .onClick(() => {
      // 先更改数据状态
      item.isRead = 1
      this.messageList = [...this.messageList]
      router.pushUrl({
        url: 'pages/Index/Message/MessageDetail',
        params: {
          content: item.content,
          created: item.created,
          id: item.id
        }
      })
    })
  }
  @Builder
  renderNoticeItem(message: MessageItemModel) {
    Column() {
      Row() {
        Text("您有新的运输任务")
        if (message.isRead === 0) {
          Text("")
            .width(8)
            .height(8)
            .backgroundColor($r('app.color.primary'))
            .borderRadius(4)
            .margin({ left: 10 })
        }
      }

      Divider().color($r('app.color.background_page')).margin({ top: 13 })
      Text(message.content.replace(new RegExp("/\/n/") , ""))
        .margin({ top: 11, bottom: 22.5 })
        .fontSize(13)
        .fontColor($r('app.color.text_secondary'))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .lineHeight(22)
      Row() {
        Text(message.updated).fontSize(12).fontColor($r('app.color.text_secondary'))
        Button("查看详情", { type: ButtonType.Capsule })
          .fontColor($r('app.color.primary'))
          .border({ width: 1, color: $r('app.color.primary') })
          .height(24)
          .width(76)
          .backgroundColor('#fff')
          .onClick(() => {
            readMessage(message.id + "")
            // 跳转到任务详情
            router.pushUrl({
              url: 'pages/TaskDetail/TaskDetail',
              params: {
                id: message.relevantId
              }
            })
          })
      }.justifyContent(FlexAlign.SpaceBetween).alignItems(VerticalAlign.Center).width('100%')
    }
    .width('100%')
    .backgroundColor($r('app.color.white'))
    .borderRadius(10)
    .padding(16)
    .margin({ bottom: 15 })
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column() {
      Row() {
        Image($r("app.media.ic_yidu")).width(16).height(16)
        Text("全部已读").fontSize(14).fontColor($r('app.color.text_secondary')).margin({
          left: 9
        }).onClick(async () => {
          this.queryParams.contentType && await readAllMessage(this.queryParams.contentType.toString())
          promptAction.showToast({ message: '全部已读' })
          this.readSuccess && this.readSuccess()
        })
      }.padding({
        left: 17,
        right: 17,
        top: 14,
        bottom: 14
      }).width('100%')// 全部已读
      // 公告内容
      HmList({
        finished: this.allPage < this.queryParams.page,
        dataSource: $messageList,
        onRefresh: async () => {
          await this.refreshData()
        },
        onLoad: async () => {
          await this.getMessage(true)
        } ,
        renderItem: (item: object) => {
          this.renderItem(item)
        }
      })
    }.height('100%')
  }
}

export default MessageTemplate
```

- 在Index/Index.ets中引入Message
```typescript
import Message from './Message/Message'


build() {
    Tabs({ barPosition: BarPosition.End }){
      ForEach(this.tabsData, (item: TabClass) => {
        TabContent(){
          if(item.name === 'task') {
           TaskTabs()
          }
          else if(item.name === 'message') {
             Message()
          }
          else {
             My()
          }
        }.tabBar(this.getTabBar(item))
      })
    }
    .onChange(index => {
      this.currentName = this.tabsData[index].name
    })
    .animationDuration(300)
  }
```

- 在pages/Index/Message下新建MessageDetail.ets(page)
```typescript
import { HmNavBar } from '@hm/basic'
import router from '@ohos.router';
import { readMessage } from '../../../api/message'
import { DetailTypeModel } from '../../../models'
@Entry
@Component
struct MessageDetail {
  @State detailForm: DetailTypeModel = new DetailTypeModel({
    content: '',
    created: '',
    id: ''
  })

  async aboutToAppear() {
    const params = router.getParams()
    this.detailForm = params as DetailTypeModel
    readMessage(this.detailForm.id)
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      HmNavBar({ title: '详情' })
      Column() {
        Text("系统公告").fontSize(16).fontColor($r('app.color.text_primary')).lineHeight(22)
        Text(this.detailForm.created).fontSize(12).fontColor($r('app.color.text_secondary')).lineHeight(17).margin({
          top: 7,
          bottom: 17
        })
        Text(this.detailForm.content).fontSize(14).lineHeight(22)
      }.alignItems(HorizontalAlign.Start).padding({
        top: 20,
        left: 16,
        right: 16
      })
    }.height('100%').backgroundColor($r('app.color.white'))
  }
}

export default MessageDetail

```

# ~~集成车辆信息~~
> **entry模块**

在models/car.ets中加入车辆信息类型
```typescript
import { ImageList } from '@hm/basic'
/** 响应数据 */
export interface UserCarDataType {
  /** 载重 */
  allowableLoad: string;
  /** 所属机构名称 */
  currentOrganName: string;
  /** 车辆编号 */
  id: string;
  /** 车牌号码 */
  licensePlate: string;
  /** 图片 */
  pictureList: ImageList[];
  /** 车辆类型名称 */
  truckType: string;
}
export class UserCarDataTypeModel implements UserCarDataType {
  allowableLoad: string = ''
  currentOrganName: string = ''
  id: string = ''
  licensePlate: string = ''
  pictureList: ImageList[] = []
  truckType: string = ''

  constructor(model: UserCarDataType) {
    this.allowableLoad = model.allowableLoad
    this.currentOrganName = model.currentOrganName
    this.id = model.id
    this.licensePlate = model.licensePlate
    this.pictureList = model.pictureList
    this.truckType = model.truckType
  }
}

```

- 在models/index.ets统一导出
```typescript
export * from './car'
```
在api/user.ts中加入封装获取车辆信息api
```typescript
// 获取用户车辆信息
export const getUserCarInfo = () => {
  return Request.get<UserCarDataTypeModel>("/driver/users/truck")
}
```
新建pages/Car/Car.ets - Page
```typescript
import { HmNavBar } from '@hm/basic'
import { getUserCarInfo } from '../../api'
import { UserCarDataTypeModel, UserCarDataType, ImageList } from '../../models'
@Entry
@Component
struct Car {
  @State
  userCarInfo: UserCarDataTypeModel = new UserCarDataTypeModel({} as UserCarDataType)
  aboutToAppear() {
    this.getUserCarInfo()
  }
  async getUserCarInfo() {
    this.userCarInfo = await getUserCarInfo()
  }
  @Builder
  getContentItem (item: CarItem) {
    Row() {
      Text(item.leftText).fontSize(14).fontWeight(400).fontColor($r('app.color.text_secondary'))
      Text(item.rightValue).fontSize(14).fontColor($r('app.color.text_primary')).fontWeight(400)
    }.justifyContent(FlexAlign.SpaceBetween).alignItems(VerticalAlign.Center).width('100%').height(40)
  }
  build() {
    Column() {
      HmNavBar({ title: '车辆信息' })
      Swiper(new SwiperController()) {
        ForEach(this.userCarInfo.pictureList, (item: ImageList) => {
          Row() {
            Image(item.url).width('100%').height('100%').objectFit(ImageFit.Cover).
            borderRadius(8)
          }.height(201).padding({ left: 15, right: 15, top: 15  })
        })
      }
      .loop(false)
      .cachedCount(3)
      .indicator(true)
      .curve(Curve.Linear)

      // 信息列表
      Column() {
        this.getContentItem({ leftText: '车辆编号', rightValue: this.userCarInfo.id })
        this.getContentItem({ leftText: '车辆号牌', rightValue: this.userCarInfo.licensePlate })
        this.getContentItem( { leftText: '车型', rightValue: this.userCarInfo.truckType })
        this.getContentItem({ leftText: '所属机构', rightValue: this.userCarInfo.currentOrganName })
        this.getContentItem({ leftText: '载重', rightValue: this.userCarInfo.allowableLoad })
      }
      .padding({
        top: 19.5,
        bottom: 19.5,
        left: 20,
        right: 20
      })
      .backgroundColor($r('app.color.white'))
      .margin(15)
      .borderRadius(8)
    }.height('100%').backgroundColor($r('app.color.background_page')).width('100%')
  }
}


class  CarItem {
  leftText: string = ""
  rightValue: string = ""
}
export default Car
```

- 点击我的-车辆信息跳转过去
```typescript
 HmCardItem({ leftText: '车辆信息', rightText: '', onRightClick: () => {
          router.pushUrl({
            url: 'pages/Car/Car'
          })
        } })
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1701745823912-f508c268-b932-4b57-b04d-9801a50cc3d4.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_10%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23e9e1e0&clientId=ud85d5595-8613-4&from=paste&height=696&id=nrVMf&originHeight=756&originWidth=357&originalType=binary&ratio=2&rotation=0&showTitle=false&size=125065&status=done&style=none&taskId=ub8b5e495-ef0d-4315-a938-dc1197c5b4b&title=&width=328.5)

:::info
提交代码
:::

# ~~集成任务信息~~
:::info
获取任务数据之前已经封装过，直接使用即可
:::

- 新建pages/UserTask/UserTask.ets
```typescript
import { HmNavBar, HmLoading } from '@hm/basic'
import { UserTaskInfoModel, UserTaskInfo, UserTaskInfoParamsModel } from '../../models'
import { getUserTaskInfo } from '../../api'
@Entry
@Component
struct UserTask {
  @State TaskInfo: UserTaskInfoModel = new UserTaskInfoModel({} as UserTaskInfo)
  @State list: string[] = []
  @State queryParams: UserTaskInfoParamsModel = new UserTaskInfoParamsModel({
    year: new Date().getFullYear()+"",
    month: new Date().getMonth() + 1 +""
  })
  @State
  currentDate: Date = new Date()
  layer: CustomDialogController = new CustomDialogController({
    builder: HmLoading(),
    customStyle: true,
    alignment: DialogAlignment.Center
  })
  async aboutToAppear() {
    this.getUserTask()
  }
  async getUserTask () {
    this.layer.open()
    this.TaskInfo = await getUserTaskInfo(this.queryParams)
    this.layer.close()
  }
  build() {
    Column() {
      HmNavBar({ title: '任务数据' })

      // 本月任务
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
        Text("- 本月任务 -").fontSize(14).fontColor($r('app.color.text_secondary')).lineHeight(20)
        Row() {
          Column() {
            Text(this.TaskInfo.taskAmounts+ "").fontSize(18).fontColor($r('app.color.text_primary')).lineHeight(25).margin({
              bottom: 17
            })
            Text("任务总量").fontSize(12).fontColor($r('app.color.text_primary')).lineHeight(17)
          }.justifyContent(FlexAlign.SpaceAround)

          Column() {
            Text(this.TaskInfo.completedAmounts+"")
              .fontSize(18)
              .fontColor($r('app.color.text_primary'))
              .lineHeight(25)
              .margin({ bottom: 17 })
            Text("完成任务量").fontSize(12).fontColor($r('app.color.text_primary')).lineHeight(17)
          }.justifyContent(FlexAlign.SpaceAround)

          Column() {
            Text(this.TaskInfo.transportMileage+"")
              .fontSize(18)
              .fontColor($r('app.color.text_primary'))
              .lineHeight(25)
              .margin({ bottom: 17 })
            Text("运输里程(km)").fontSize(12).fontColor($r('app.color.text_primary')).lineHeight(17)
          }.justifyContent(FlexAlign.SpaceAround)
        }.justifyContent(FlexAlign.SpaceEvenly).width('100%').flexGrow(1)

      }
      .backgroundColor($r('app.color.white'))
      .margin({ left: 14.5, right: 14.5 })
      .height(100).margin({
        top: 20,
        bottom: 20
      })
      Row() {
        Button("切换月份")
          .backgroundColor($r("app.color.primary"))
          .onClick(() => {
            CalendarPickerDialog.show({
              selected: this.currentDate,
              onDateAccept: (value) => {
                this.queryParams.year = value.getFullYear().toString()
                this.queryParams.month = (value.getMonth() + 1).toString()
                this.getUserTask()
              }
            })
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')

    }
    .height('100%').backgroundColor($r('app.color.background_page'))
  }
}
```

- 在我的页面跳转过去
```typescript
 HmCardItem({ leftText: '任务设置', rightText: '',
         onRightClick: () => {
           router.pushUrl({
             url: 'pages/UserTask/UserTask'
           })
         }
  })
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1713429484468-e8344658-8497-4566-8a26-0907648ac164.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23d4d3d2&clientId=ue77cb9b9-b44d-4&from=paste&height=721&id=lqlV2&originHeight=721&originWidth=330&originalType=binary&ratio=1&rotation=0&showTitle=false&size=49524&status=done&style=none&taskId=u840d5e0a-b50f-4618-bd3b-5f8fdb6aa93&title=&width=330)

:::info
提交代码
:::


# 做一个截图效果

- 实现一个转发按钮
```typescript
 Row() {
              Image($r("app.media.share"))
                .width(20)
                .height(20)
                .fillColor($r("app.color.primary"))
                .onClick(async () => {
                  this.snapImg = await componentSnapshot.get("detail")
                  this.showSnap = true
                })
            }
            .width("100%")
            .justifyContent(FlexAlign.End)
            .padding(10)
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1715065024125-8fdc814c-cc4d-46b9-86c2-f54a283e4cdc.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23f0eded&clientId=ud79f1acd-1708-4&from=paste&height=705&id=ue8446de8&originHeight=705&originWidth=341&originalType=binary&ratio=1&rotation=0&showTitle=false&size=73524&status=done&style=none&taskId=u81c10c7b-50e3-4ac8-bb68-8c4a0fb5386&title=&width=341)

- 定义变量
```typescript
 @State
  snapImg: image.PixelMap | null = null
  @State
  showSnap: boolean = false
```

- 使用bindContentCover
```typescript
 .bindContentCover($$this.showSnap, this.getSnapContent(), {
      modalTransition: ModalTransition.NONE
    })
```

- 实现弹出内容
```typescript
@Builder
  getSnapContent () {
    Column() {
      Image(this.snapImg)
        .width("100%")
        .height("100%")
        .objectFit(ImageFit.Auto)
        .borderRadius(6)
    }
    .padding("10%")
    .width("100%")
    .height("100%")
    .backgroundColor("rgba(0,0,0,0.2)")
    .onClick(() => {
      this.showSnap = false
    })
  }
```
![image.png](https://cdn.nlark.com/yuque/0/2024/png/8435673/1715065786189-4954e838-aebb-431d-9ab3-3f1709971fc7.png?x-oss-process=image%2Fwatermark%2Ctype_d3F5LW1pY3JvaGVp%2Csize_15%2Ctext_6buR6ams56iL5bqP5ZGY%2Ccolor_FFFFFF%2Cshadow_50%2Ct_80%2Cg_se%2Cx_10%2Cy_10#averageHue=%23dddbd9&clientId=ud79f1acd-1708-4&from=paste&height=721&id=u94e525aa&originHeight=721&originWidth=330&originalType=binary&ratio=1&rotation=0&showTitle=false&size=70168&status=done&style=none&taskId=u060fd5e0-4c61-44d0-91c0-86f87472528&title=&width=330)
# LazyForEach应用

> LazyForEach从提供的数据源中按需迭代数据，并在每次迭代过程中创建相应的组件。当在滚动容器中使用了LazyForEach，框架会根据滚动容器可视区域按需创建组件，当组件滑出可视区域外时，框架会进行组件销毁回收以降低内存占用。

- 接口描述
```typescript
LazyForEach(
    dataSource: IDataSource,             // 需要进行数据迭代的数据源
    itemGenerator: (item: any, index: number) => void,  // 子组件生成函数
    keyGenerator?: (item: any, index: number) => string // 键值生成函数
): void
```
> 本质上-**LazyForEach和ForEach的用法基本一致，但是ForEach属于全量渲染，而LazyForEach属于只渲染可见区域**

- 限制
> - LazyForEach必须在容器组件内使用，仅有[List](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-list-0000001862607449)、[Grid](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-grid-0000001815927620)、[Swiper](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-swiper-0000001862607461)以及[WaterFlow](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-waterflow-0000001815767844)组件支持数据懒加载（可配置cachedCount属性，即只加载可视部分以及其前后少量数据用于缓冲），其他组件仍然是一次性加载所有的数据。
> - LazyForEach在每次迭代中，必须创建且只允许创建一个子组件。
> - 生成的子组件必须是允许包含在LazyForEach父容器组件中的子组件。
> - 允许LazyForEach包含在if/else条件渲染语句中，也允许LazyForEach中出现if/else条件渲染语句。
> - 键值生成器必须针对每个数据生成唯一的值，如果键值相同，将导致键值相同的UI组件渲染出现问题。
> - **LazyForEach必须使用DataChangeListener对象来进行更新，第一个参数dataSource使用状态变量时，状态变量改变不会触发LazyForEach的UI刷新**。
> - 为了高性能渲染，通过DataChangeListener对象的onDataChange方法来更新UI时，需要生成不同于原来的键值来触发组件刷新。

- 具体案例
> [UI框架-List组件的使用之商品列表（ArkTS）.zip](https://www.yuque.com/attachments/yuque/0/2024/zip/38936526/1718508993808-0c8a7216-670b-4772-bfc5-2ec30b95fc8e.zip?_lake_card=%7B%22src%22%3A%22https%3A%2F%2Fwww.yuque.com%2Fattachments%2Fyuque%2F0%2F2024%2Fzip%2F38936526%2F1718508993808-0c8a7216-670b-4772-bfc5-2ec30b95fc8e.zip%22%2C%22name%22%3A%22UI%E6%A1%86%E6%9E%B6-List%E7%BB%84%E4%BB%B6%E7%9A%84%E4%BD%BF%E7%94%A8%E4%B9%8B%E5%95%86%E5%93%81%E5%88%97%E8%A1%A8%EF%BC%88ArkTS%EF%BC%89.zip%22%2C%22size%22%3A3194139%2C%22ext%22%3A%22zip%22%2C%22source%22%3A%22%22%2C%22status%22%3A%22done%22%2C%22download%22%3Atrue%2C%22taskId%22%3A%22u26bba537-a625-423d-a309-cb612e0070b%22%2C%22taskType%22%3A%22transfer%22%2C%22type%22%3A%22application%2Fzip%22%2C%22mode%22%3A%22title%22%2C%22id%22%3A%22u2ccc4967%22%2C%22card%22%3A%22file%22%7D)

# 吸顶效果

- List吸顶
```typescript
// xxx.ets
@Entry
@Component
struct ListItemGroupExample {
  private timeTable: TimeTable[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    },
    {
      title: '星期二',
      projects: ['物理', '化学', '生物']
    },
    {
      title: '星期三',
      projects: ['历史', '地理', '政治']
    },
    {
      title: '星期四',
      projects: ['美术', '音乐', '体育']
    }
  ]

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .padding(10)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + "节课")
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .padding(5)
  }

  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.timeTable, (item: TimeTable) => {
          ListItemGroup({ header: this.itemHead(item.title), footer: this.itemFoot(item.projects.length) }) {
            ForEach(item.projects, (project: string) => {
              ListItem() {
                Text(project)
                  .width("100%")
                  .height(100)
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .divider({ strokeWidth: 1, color: Color.Blue }) // 每行之间的分界线
        })
      }
      .width('90%')
      .sticky(StickyStyle.Header | StickyStyle.Footer)
      .scrollBar(BarState.Off)
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
  }
}

interface TimeTable {
  title: string;
  projects: string[];
}
```
