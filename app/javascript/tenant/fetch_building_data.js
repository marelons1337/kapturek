window.addEventListener('turbolinks:load', function () {
const buildingSelect = document.getElementById('tenant_building_id')
const doorNumberSelect = document.getElementById('tenant_door_number')
var i = 0;
if (buildingSelect != null && doorNumberSelect != null) {
  doorNumberSelect.options.length = 0;
  buildingSelect.addEventListener('change', function (event) {
    if (i==0) {
      buildingSelect.options[0].remove();
    }
    i++;

    doorNumberSelect.options.length = 0;
    let buildingId = event.target.value
    let buildingPath = `/buildings/${buildingId}/find_flats`
    buildingPath = buildingPath.replace("placeholder",buildingId)

    fetch(buildingPath)
    .then(response => response.json())
    .then(data =>
      data.forEach(element => {
        let newOptionElement = document.createElement('option')
        newOptionElement.value = element["id"];
        newOptionElement.innerHTML = element["door_number"];
        doorNumberSelect.appendChild(newOptionElement);
      })
      );
    })
  }
})