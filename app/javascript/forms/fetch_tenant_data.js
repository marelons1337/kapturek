import { element } from "prop-types";

window.addEventListener('turbolinks:load', function () {
  const doorNumberSelect = document.getElementById('payment_door_number')
  const tenantSelect = document.getElementById('payment_tenant_id')
  if (tenantSelect && doorNumberSelect) {
    doorNumberSelect.addEventListener('change', function (event) {
      console.log("if");
      tenantSelect.options.length = 0;
      let flatId = event.target.value
      let flatPath = `/flats/${flatId}/get_tenant`

      fetch(flatPath)
      .then(response => response.json())
      .then(element => {
        console.log(element);
        let newOptionElement = document.createElement('option')
        newOptionElement.value = element["id"];
        newOptionElement.innerHTML = `${element["name"]} ${element["surname"]}`;
        tenantSelect.appendChild(newOptionElement);
      })
    })
  }
})