# Spring Integration Example

This project shows how to use Spring Boot with Spring Integration to poll USGS earthquake information in 110 lines (both code and configuration). Here is the line count breakdown:

  34 lines of Spring Integration Configuration
  14 lines of Java code
  62 lines of Maven build script

That's pretty impressive. Just 14 lines of Java code and you've got a working application.

## Running the application

After cloning the project, run the following command:

```
mvn spring-boot:bin
```

Below is an example of the running application.

```
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::  (v1.0.0.BUILD-SNAPSHOT)

2014-11-22 03:04:45,092  INFO                                    standalone.Main - Starting Main on 880e0a9b653c with PID 1 (/si-standalone-sample-1.0-SNAPSHOT.jar started by root)
2014-11-22 03:04:45,123  INFO         o.s.c.a.AnnotationConfigApplicationContext - Refreshing org.springframework.context.annotation.AnnotationConfigApplicationContext@6690811b: startup date [Sat Nov 22 03:04:45 UTC 2014]; root of context hierarchy
2014-11-22 03:04:45,155  INFO      o.s.beans.factory.xml.XmlBeanDefinitionReader - Loading XML bean definitions from class path resource [httpgateway.xml]
2014-11-22 03:04:45,314  INFO     o.s.beans.factory.config.PropertiesFactoryBean - Loading properties file from URL [jar:file:/si-standalone-sample-1.0-SNAPSHOT.jar!/lib/spring-integration-core-3.0.1.RELEASE.jar!/META-INF/spring.integration.default.properties]
2014-11-22 03:04:45,319  INFO       o.s.i.config.xml.IntegrationNamespaceHandler - No bean named 'integrationHeaderChannelRegistry' has been explicitly defined. Therefore, a default DefaultHeaderChannelRegistry will be created.
2014-11-22 03:04:45,407  INFO s.i.c.x.DefaultConfiguringBeanFactoryPostProcessor - No bean named 'errorChannel' has been explicitly defined. Therefore, a default PublishSubscribeChannel will be created.
2014-11-22 03:04:45,407  INFO s.i.c.x.DefaultConfiguringBeanFactoryPostProcessor - No bean named 'taskScheduler' has been explicitly defined. Therefore, a default ThreadPoolTaskScheduler will be created.
2014-11-22 03:04:45,498  INFO     o.s.beans.factory.config.PropertiesFactoryBean - Loading properties file from URL [jar:file:/si-standalone-sample-1.0-SNAPSHOT.jar!/lib/spring-integration-core-3.0.1.RELEASE.jar!/META-INF/spring.integration.default.properties]
2014-11-22 03:04:45,574  INFO  o.s.scheduling.concurrent.ThreadPoolTaskScheduler - Initializing ExecutorService  'taskScheduler'
2014-11-22 03:04:45,768  INFO      o.s.context.support.DefaultLifecycleProcessor - Starting beans in phase -2147483648
2014-11-22 03:04:45,769  INFO       o.s.integration.endpoint.EventDrivenConsumer - Adding {logging-channel-adapter:_org.springframework.integration.errorLogger} as a subscriber to the 'errorChannel' channel
2014-11-22 03:04:45,769  INFO    o.s.integration.channel.PublishSubscribeChannel - Channel 'application.errorChannel' has 1 subscriber(s).
2014-11-22 03:04:45,769  INFO       o.s.integration.endpoint.EventDrivenConsumer - started _org.springframework.integration.errorLogger
2014-11-22 03:04:45,769  INFO      o.s.context.support.DefaultLifecycleProcessor - Starting beans in phase 0
2014-11-22 03:04:45,772  INFO         o.s.i.endpoint.SourcePollingChannelAdapter - started org.springframework.integration.config.SourcePollingChannelAdapterFactoryBean#0
2014-11-22 03:04:45,772  INFO       o.s.integration.endpoint.EventDrivenConsumer - Adding {message-handler:quakerHttpGateway} as a subscriber to the 'quakeinfotrigger.channel' channel
2014-11-22 03:04:45,772  INFO              o.s.integration.channel.DirectChannel - Channel 'application.quakeinfotrigger.channel' has 1 subscriber(s).
2014-11-22 03:04:45,772  INFO       o.s.integration.endpoint.EventDrivenConsumer - started quakerHttpGateway
2014-11-22 03:04:45,772  INFO           o.s.integration.endpoint.PollingConsumer - started messageLogger
2014-11-22 03:04:45,776  INFO                                    standalone.Main - Started Main in 0.838 seconds (JVM running for 1.34)
2014-11-22 03:04:46,022 ERROR             o.s.integration.handler.LoggingHandler - [Payload={"type":"FeatureCollection","metadata":{"generated": 1416625470000,"url": "http://earthquake.usgs.gov/earthquakes/feed/geojson/all/hour","title": "USGS All Earthquakes, Past Hour","subTitle": "Real-time, worldwide earthquake list for the past hour", "cacheMaxAge": 60},"features":[{"type":"Feature","properties":{"mag":0.45,"place":"7km S of Idyllwild-Pine Cove, California","time":"1416624191000","updated":"1416624448130","tz":-480,"url":"http://earthquake.usgs.gov/earthquakes/eventpage/ci37063359","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"automatic","tsunami":null,"sig":"3","net":"ci","code":"37063359","ids":",ci37063359,","sources":",ci,","types":",general-link,geoserve,nearby-cities,origin,phase-data,scitech-link,","nst":"22","dmin":"0.04115","rms":"0.21","gap":"68","magnitudeType":"ml"},"geometry":{"type":"Point","coordinates":[-116.7371667,33.6746667,16.1]},"id":"ci37063359"},
{"type":"Feature","properties":{"mag":0.86,"place":"2km SSW of Cobb, California","time":"1416623341350","updated":"1416623436340","tz":-480,"url":"http://earthquake.usgs.gov/earthquakes/eventpage/nc72351586","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"automatic","tsunami":null,"sig":"11","net":"nc","code":"72351586","ids":",nc72351586,","sources":",nc,","types":",general-link,geoserve,nearby-cities,origin,phase-data,","nst":"11","dmin":"0.01699","rms":"0.03","gap":"81","magnitudeType":"md"},"geometry":{"type":"Point","coordinates":[-122.7389984,38.8026657,2.91]},"id":"nc72351586"}]}][Headers={timestamp=1416625486021, id=9a95d5c2-1c5f-e9a0-28e3-fd6bda650c9f, Vary=Accept-Encoding, Date=1416625484000, Content-Length=1510, Expires=1416625544000, http_statusCode=200, Last-Modified=1416625470000, Content-Type=application/json, Connection=keep-alive, Server=Footprint Distributor V4.8, Cache-Control=public, max-age=60}]
```

## Running inside a Docker container

Docker trending in popularity so this project contains a Dockerfile for you to experiment with.

### Create a jar file

```
mvn package
```

### Build the image

```
docker build -t spring-integration .
```

### Run the image

```
SI=$(docker run -d -t spring-integration)
```

## Tail the logs

```
docker logs -f $SI
```
