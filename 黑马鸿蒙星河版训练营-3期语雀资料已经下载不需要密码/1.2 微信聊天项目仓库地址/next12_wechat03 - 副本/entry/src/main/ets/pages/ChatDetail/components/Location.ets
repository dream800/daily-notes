import { MapComponent, mapCommon, map } from '@kit.MapKit';
import { AsyncCallback } from '@kit.BasicServicesKit';
import { geoLocationManager } from '@kit.LocationKit';

@Component
struct Location {
  @Link
  currentAddress :string
  mapController?: map.MapComponentController
  callback?: AsyncCallback<map.MapComponentController>
  // 相机地图属性
  mapOption: mapCommon.MapOptions = {
    position: {
      target: {
        latitude: 39.9,
        longitude: 116.4
      },
      zoom: 10
    }
  }

  // 获取我的位置图层
  async getLocation() {
    const result = await geoLocationManager.getCurrentLocation()
    // 1.设置我在地图的位置
    this.mapController?.setMyLocation({
      latitude: result.latitude,
      longitude: result.longitude,
      altitude: 0,
      accuracy: 0,
      speed: 0,
      timeStamp: 0,
      direction: 0,
      timeSinceBoot: 0
    })
    //  2.准备一个位置所在的相机
    let cameraUpdate: map.CameraUpdate = map.newCameraPosition({
      target: {
        longitude: result.longitude,
        latitude: result.latitude
      },
      zoom: 12
    })
    //   3.移动相机至地图指定位置
    this.mapController?.moveCamera(cameraUpdate)

    //   4.位置图层渲染
    this.mapController?.addMarker({
      position: {
        longitude: result.longitude,
        latitude: result.latitude
      },
      title: "当前位置：",
      clickable: true
    })
    //   5.根据相机渲染范围图层
    this.mapController?.addCircle({
      radius: 500,
      center: {
        longitude: result.longitude,
        latitude: result.latitude
      },
      fillColor: 0XFF00FFFF
    })
    //   6.通过经纬度获取街道位置
    const res = await geoLocationManager.getAddressesFromLocation({
      latitude:result.latitude,
      longitude:result.longitude
    })
    if(res.length){
      this.currentAddress = res[0].placeName as string
    }
  }

  aboutToAppear(): void {
    // mapController地图初始化完成后会给你这个mapController
    this.callback = async (err, mapController) => {
      if (!err) {
        this.mapController = mapController
        //   允许设置我的位置
        this.mapController.setMyLocationEnabled(true)
        //   允许我能控制
        this.mapController.setMyLocationControlsEnabled(true)
        //  启用我当前所在的图层
        this.getLocation()
      }
    }
  }

  build() {
    Row() {
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
        mapCallback: this.callback
      })
        .width('100%')
        .height('100%')
    }
    .height('100%')
  }
}

export default Location