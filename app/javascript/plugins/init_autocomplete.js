import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById("search_query");
  if (addressInput) {
    places({ container: addressInput });
  }
  const addressInputCreate = document.getElementById("boxbike_address");
  if (addressInputCreate) {
    places({ container: addressInputCreate });
  }
};

export { initAutocomplete};
