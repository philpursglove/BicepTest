param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'plan-biceptest'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  location: location
  kind: 'web'
  name: 'appi-biceptest'
  properties: {
    Application_Type: 'web'
  }
}

output appInsightsKey string = appInsights.properties.InstrumentationKey

resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: 'app-biceptest'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }
}

resource symbolicname 'Microsoft.Web/sites/functions@2022-03-01' = {
  name: 'func-biceptest'
  kind: 'functionapp'
}
