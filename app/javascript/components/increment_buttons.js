// increment_buttons.js

console.log("Hello from increment_buttons.js")

const initIncrementButtons = () => {
  $(".btn-inc-dec").on("click", function() {
    // this.preventDefault();
    var $button = $(this);
    var oldValue = $button.parent().find("input").val();

    if ($button.text() == "+") {
      var newVal = parseFloat(oldValue) + 1;
    } else {
     // Don't allow decrementing below zero
      if (oldValue > 1) {
        var newVal = parseFloat(oldValue) - 1;
      } else {
        newVal = 1;
      }
    }

    $button.parent().find("input").val(newVal);

  });
};

export { initIncrementButtons };
