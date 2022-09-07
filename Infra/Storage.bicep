param location string

resource storage 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: 'stbiceptest'
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

resource queueServices 'Microsoft.Storage/storageAccounts/queueServices@2022-05-01' = {
  name: 'default'
  parent: storage
}
resource scoresQueue 'Microsoft.Storage/storageAccounts/queueServices/queues@2022-05-01' = {
  name: 'ScoresOnTheDoors'
  parent: queueServices
}
