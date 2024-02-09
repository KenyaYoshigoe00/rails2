document.addEventListener('turbolinks:load', function() {
  const drop_down_button = document.getElementById('drop_down_button')

  drop_down_button.addEventListener('click', function() {
    const element = document.getElementById('drop_down_menu')
    if (element.style.display == 'none'){
      element.style.display = 'block';
    }else{
      element.style.display = 'none';
    }
  })
})