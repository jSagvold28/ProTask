const plusButton = document.getElementById('plus-button');
const menuItems = document.getElementById('menu-items');

plusButton.addEventListener('click', function() {
  if (menuItems.style.display === 'none') {
    menuItems.style.display = 'block';
  } else {
    menuItems.style.display = 'none';
  }
});
