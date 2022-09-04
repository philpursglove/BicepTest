targetScope = 'subscription'

var location = 'uksouth'

resource rgbiceptest 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-biceptest'
  location: location
}

module appservice 'AppService.bicep' = {
  name: 'appservice'
  scope: rgbiceptest
  params: {
    location: rgbiceptest.location
  }
}

module storage 'storag.bicep.txt' = {
  name 'storage'
  scope: rgbiceptest
  params: {
    location: rgbiceptest.location
  }
}