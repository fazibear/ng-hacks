class HelloController
  constructor: ($scope) ->
    $scope.hello = 'world'

angular
  .module "HelloApp", []
  .controller "HelloController", HelloController
