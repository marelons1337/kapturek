
window.addEventListener('turbolinks:load', function () {
  const doorNumberSelect = document.getElementById('payment_flat_id')
  const tenantSelect = document.getElementById('payment_tenant_id')

  if (tenantSelect && doorNumberSelect) {
    doorNumberSelect.addEventListener('change', function (event) {
      tenantSelect.length = 1;
      let flatId = event.target.value
      let flatPath = `/flats/${flatId}/get_tenant`
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
})
