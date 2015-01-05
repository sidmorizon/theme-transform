'use strict';

angular.module('app', [
    # Angular modules
    'ngRoute'
    'ngAnimate'

    # 3rd Party Modules
    'ui.bootstrap'
    'easypiechart'
    'mgo-angular-wizard'
    'textAngular'
    'ui.tree'
    'ngMap'
    'ngTagsInput'

    # Custom modules
    'app.controllers'
    'app.directives'
    'app.services'
    'app.localization'
    'app.nav'
    'app.ui.ctrls'
    'app.ui.directives'
    'app.ui.services'
    'app.ui.map'
    'app.form.validation'
    'app.ui.form.ctrls'
    'app.ui.form.directives'
    'app.tables'
    'app.task'
    'app.chart.ctrls'
    'app.chart.directives'
    'app.page.ctrls'
])


# 配置路由$routeProvider
.config([
    '$routeProvider'
    ($routeProvider) ->

        routes = [
            'dashboard'
            'transform-ui/ui/typography', 'transform-ui/ui/buttons', 'transform-ui/ui/icons', 'transform-ui/ui/grids', 'transform-ui/ui/widgets', 'transform-ui/ui/components', 'transform-ui/ui/timeline', 'transform-ui/ui/nested-lists', 'transform-ui/ui/pricing-tables', 'transform-ui/ui/maps'
            'transform-ui/tables/static', 'transform-ui/tables/dynamic', 'transform-ui/tables/responsive'
            'transform-ui/forms/elements', 'transform-ui/forms/layouts', 'transform-ui/forms/validation', 'transform-ui/forms/wizard'
            'transform-ui/charts/charts', 'transform-ui/charts/flot', 'transform-ui/charts/morris'
            'pages/404', 'pages/500', 'pages/blank', 'pages/forgot-password', 'pages/invoice', 'pages/lock-screen', 'pages/profile', 'pages/signin', 'pages/signup'
            'transform-ui/mail/compose', 'transform-ui/mail/inbox', 'transform-ui/mail/single'
            'transform-ui/tasks/tasks'
        ]

        setRoutes = (route) ->
            url = '/' + route
            config =
                templateUrl: 'views/' + route + '.html'

            $routeProvider.when(url, config)
            return $routeProvider

        routes.forEach( (route) ->
            setRoutes(route)
        )

        $routeProvider
            .when('/', { redirectTo: '/dashboard'} )
            .when('/404', { redirectTo: '/pages/404'} )
            .otherwise( redirectTo: '/404' )
])

# 配置全局http请求$httpProvider
.config([
    '$httpProvider'
    ($httpProvider) ->
      # 注入全局http请求之401、403处理
      $httpProvider.responseInterceptors.push('httpInterceptor');
      # 默认跨域ajax带上cookie身份信息
      $httpProvider.defaults.withCredentials = true;
])

.run([
    '$http'
    'cyApi'
    ($http,cyApi) ->
      $http.get cyApi.getUrl('/forum/_cors_test_/'),{a:1}
  ])
