'use strict';

angular.module('app.services',[])

.factory('cyApi', ->
  host = 'http://localhost:8880'
  return {
    host:host,
    getUrl: (url) ->
      return host+url
  }
)

.factory('httpInterceptor', [
    '$q', '$window', '$location'
    'cyApi'
    ($q, $window, $location, cyApi) ->
      return (promise) ->
        successHandler = (response) ->
          return response
        errorHandler = (response) ->
          if response.config.url.indexOf cyApi.host == 0
            statusCode = response.status
            switch statusCode
            # 401 UNAUTHORIZED
              when 401 then $location.url '/pages/signin'
            # 403 FORBIDDEN
              when 403 then alert '您没有权限！'
            # no response
              when 0 then alert '网络连接失败！'
            # other CODE
              else

          return $q.reject response
        return promise.then successHandler, errorHandler
  ])






