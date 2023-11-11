document.addEventListener('DOMContentLoaded', function() {
  fetch('https://fakestoreapi.com/carts')
    .then(res => res.json())
    .then(storeApiData => {
      console.log('Store API Data:', storeApiData);
      // You can handle the store API data as needed.
    })
    .catch(error => console.error('Error fetching data from store API:', error));
});
