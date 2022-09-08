param location string

resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'stbiceptestpp'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Cool'
    allowBlobPublicAccess: false
  }
}

resource queueServices 'Microsoft.Storage/storageAccounts/queueServices@2021-09-01' = {
  name: 'default'
  parent: storage
}
resource scoresQueue 'Microsoft.Storage/storageAccounts/queueServices/queues@2021-09-01' = {
  name: 'scoresonthedoors'
  parent: queueServices
}

var storageAccountConnectionString = 'DefaultEndpointsProtocol=https;AccountName=${storage.name};AccountKey=${listKeys(storage.id, '2019-06-01').keys[0].value};EndpointSuffix=core.windows.net'

output connectionString string = storageAccountConnectionString
