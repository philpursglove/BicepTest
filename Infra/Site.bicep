param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'name'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}


resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: 'name'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: 'webServerFarms.id'
  }
}
