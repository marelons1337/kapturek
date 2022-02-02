window.addEventListener('turbolinks:load', function () {
  const buildingSelect = document.getElementById('tenant_building_id') || document.getElementById('payment_building_id')
  const doorNumberSelect = document.getElementById('tenant_flat_id') || document.getElementById('payment_flat_id')
  const tenantSelect = document.getElementById('payment_tenant_id')

  if (buildingSelect && doorNumberSelect) {
    if (document.location.search.includes("flat_id") && document.location.search.includes("building_id")) {
      let strings = document.location.search.split('&')
      var b_id = 0
      var f_id = 0
      strings.forEach(string => {
        if (string.match(/(flat_id=)\d+$/)) {
          f_id = string.match(/(flat_id=)\d+$/)[0].match(/\d+$/)[0]
        }
        if (string.match(/(building_id=)\d+$/)) {
          b_id = string.match(/(building_id=)\d+$/)[0].match(/\d+$/)[0]
        }
      })
      buildingSelect.value = b_id
      doorNumberSelect.value = f_id
    }
    else {
      if (buildingSelect.value == '') {
      doorNumberSelect.length = 1;
      if (tenantSelect) {
        tenantSelect.length = 1;
      }
    }}

    buildingSelect.addEventListener('input', function (event) {
      doorNumberSelect.length = 1;
      if (tenantSelect) {
        tenantSelect.length = 1;
      }
      let buildingId = event.target.value
      let buildingPath = `/buildings/${buildingId}/find_flats`
      if (buildingId) {
        fetch(buildingPath)
        .then(response => response.json())
        .then(data => {
          appendFlatOptions(data)})
        .catch(err => console.log(err))
      }
    })
  }
  if (tenantSelect && doorNumberSelect) {
    doorNumberSelect.addEventListener('change', function (event) {
      tenantSelect.length = 1;
      let flatId = event.target.value
      let flatPath = `/flats/${flatId}/get_tenants`
      if (flatId) {
        fetch(flatPath)
        .then(response => response.json())
        .then(data => {
          appendTenantOptions(data)})
        .catch(err => console.log(err))
      }
    })
  }
  function appendTenantOptions(data) {
    data.map(function (element) {
      let newOptionElement = document.createElement('option')
      newOptionElement.value = element["id"];
      newOptionElement.innerHTML = `${element["name"]} ${element["surname"]}`;
      tenantSelect.appendChild(newOptionElement);
    });
  }
  function appendFlatOptions(data) {
    data.map(function (element) {
      let newOptionElement = document.createElement('option')
      newOptionElement.value = element["id"];
      newOptionElement.innerHTML = element["door_number"];
      doorNumberSelect.appendChild(newOptionElement);
    });
  }
})