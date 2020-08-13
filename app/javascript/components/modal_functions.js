// modal_functions.js

console.log("Hello from modal_functions")

const initItemModalFunctions = () => {
  $('#itemModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('id') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  console.log(button.data('id'))
  // console.log(button.data('title'))

  // debugger

  // modal.find('.item-modal-name').innerHTML = "JAVADABADU";
  // modal.find('.item-modal-name').text('Javadabadu');
  // modal.find('.item-modal-name').text('New message to ' + recipient)
  // modal.find('.modal-body input').val(recipient)
})

  // return 'test';
};

export { initItemModalFunctions };
