param location string

resource storage 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: 'stbiceptest'
  location: location
  kind: 'StorageV2'
  sku: 'Standard_LRS'
  properties: {
    accessTier: 'Cool'
    allowBlobPublicAccess: false
  }
}

resource symbolicname 'Microsoft.Storage/storageAccounts/queueServices/queues@2022-05-01' = {
  name: 'ScoresOnTheDoors'
  parent: storage
}
