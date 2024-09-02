import { HmNavBar, HmCard, HmCardItem } from '@hm/basic'
import { MapComponent } from '@hms.core.map.MapComponent'
import { geoLocationManager } from '@kit.LocationKit'
import map from '@hms.core.map.map'
import { site } from '@kit.MapKit'
import { router } from '@kit.ArkUI'
import { AMapPrivacyShowStatus, AMapPrivacyInfoStatus, AMapPrivacyAgreeStatus } from '@amap/amap_lbs_common'
import {
  AMapLocationManagerImpl,
  AMapLocationOption,
  AMapLocationReGeocodeLanguage,
  AMapLocationType,
  IAMapLocationListener
} from '@amap/amap_lbs_location'


/** 获取的附近地标的数据类型 */
interface SiteClass {
  name: string
  distance: number
}

@Entry
@Component
struct SelectLocation {
  // 需求: 获取用户选中的附近地址, 打通异常上报功能


  mapController: map.MapComponentController = new map.MapComponentController()
  @State list: SiteClass[] = []

  async getUserLocation() {

    AMapLocationManagerImpl.setApiKey("49cffd06c520ad01045f1423b7397496");

    let options: AMapLocationOption = {
      priority: geoLocationManager.LocationRequestPriority.FIRST_FIX, //定位优先配置选项
      scenario: geoLocationManager.LocationRequestScenario.UNSET, //定位场景设置
      maxAccuracy: 0, //定位精度 单位：米
      singleLocationTimeout: 3000, //指定单次定位超时时间
      locatingWithReGeocode: false, //定位是否返回逆地理信息
      reGeocodeLanguage: AMapLocationReGeocodeLanguage.Chinese, //逆地址语言类型
      isOffset: false //是否加偏
    }

    let listener: IAMapLocationListener = {
      onLocationChanged: (location) => {
        // todo something
        AlertDialog.show({ message: JSON.stringify(location, null, 2), alignment: DialogAlignment.Center })
      }, onLocationError: (error) => {
        // todo something
      }
    };


    //初始化隐私政策
    AMapLocationManagerImpl.updatePrivacyShow(AMapPrivacyShowStatus.DidShow, AMapPrivacyInfoStatus.DidContain,
      getContext(this))
    AMapLocationManagerImpl.updatePrivacyAgree(AMapPrivacyAgreeStatus.DidAgree, getContext(this))

    //创建AMapLocationManagerImpl
    const locationManger = new AMapLocationManagerImpl(getContext(this));

    locationManger?.setLocationListener(AMapLocationType.Single, listener) //设置定位信息监听
    locationManger?.setLocationOption(AMapLocationType.Single, options) //设置定位配置项
    locationManger?.requestSingleLocation() //开启获取用的地位单次定位


    // 先获取用户的地理位置坐标
    const rightLocation = await geoLocationManager.getCurrentLocation()
    // 创建一个地理位置
    const potion = map.newCameraPosition({
      target: {
        longitude: rightLocation.longitude,
        latitude: rightLocation.latitude
      },
      zoom: 16
    })
    // 移动地图的相机视角
    this.mapController.moveCamera(potion)
    this.mapController.addPointAnnotation({
      position: {
        longitude: rightLocation.longitude,
        latitude: rightLocation.latitude
      },
      titles: [{
        content: '您的位置'
      }]
    })

    const res = await site.nearbySearch({
      pageIndex: 1,
      pageSize: 4,
      location: {
        longitude: rightLocation.longitude,
        latitude: rightLocation.latitude
      },
      radius: 50 // 搜索的距离范围
    })

    this.list = res.sites as SiteClass[]

  }

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
          mapCallback: (err, controller) => {
            if (!err) {
              this.mapController = controller

              this.getUserLocation()
            }

          }
        })
          .width('100%')
          .height('100%')
        Column() {
          HmCard() {
            ForEach(this.list, (item: SiteClass) => {
              HmCardItem({ leftText: item.name, rightText: `${item.distance}m以内` })
                .onClick(() => {
                  router.back({
                    url: 'pages/Exception/ExceptionReport',
                    params: {
                      location: item.name
                    }
                  })
                })
            })

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