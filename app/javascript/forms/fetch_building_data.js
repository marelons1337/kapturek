window.addEventListener('turbolinks:load', function () {
  const buildingSelect = document.getElementById('tenant_building_id') || document.getElementById('payment_building_id')
  const doorNumberSelect = document.getElementById('tenant_flat_id') || document.getElementById('payment_flat_id')
  const tenantSelect = document.getElementById('payment_tenant_id')

  if (buildingSelect && doorNumberSelect) {
    if (buildingSelect.value == '') {
      doorNumberSelect.length = 1;
      if (tenantSelect) {
        tenantSelect.length = 1;
      }
    }
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
  function appendFlatOptions(data) {
    data.map(function (element) {
      let newOptionElement = document.createElement('option')
      newOptionElement.value = element["id"];
      newOptionElement.innerHTML = element["door_number"];
      doorNumberSelect.appendChild(newOptionElement);
    });
  }
})