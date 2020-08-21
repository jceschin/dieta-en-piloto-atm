// increment_buttons.js

// console.log("Hello from increment_buttons.js")

const initIncrementButtons = () => {
  $(".btn-inc-dec").on("click", function() {
    event.preventDefault();
    var $button = $(this);
    const $input = $button.parent().find("input")
    var oldValue = $input.val();

    var newVal;
    var incrementType;

    if ($button.text() == "+") {
      newVal = parseFloat(oldValue) + 1;
      incrementType = "inc";
    } else {
     // Don't allow decrementing below zero
      if (oldValue > 1) {
        newVal = parseFloat(oldValue) - 1;
      } else {
        newVal = 1;
      }
      incrementType = "dec";
    }

    // updates the value of the input
    $button.parent().find("input").val(newVal);

    const idName = $input.attr('id');

    // Optional change to total value, if the clases are note in the html
    // it does nothing
    if (idName == 'item-quantity'){
      // case for the item_Modal
      const $priceP = $(`#${idName}-total`)
      $priceP.text(`$${changeTotalItem($priceP, oldValue, newVal)}`);
    } else {
      // case for the cart modal
      const $priceP = $(`#${idName}-total`)
      const $priceTotal = $(`#cart-total-price`)
      $priceP.text(`$${changeTotalCart($priceP, $priceTotal, incrementType)}`);
    }
  });
};


const changeTotalItem = ($element, oldQty, newQty) => {
  console.log(`${oldQty} ${newQty}`);
  if ( $element.length ){
    const oldValue = parseFloat($element.text().replace('$', ''));
    const singleValue = oldValue / oldQty;
    return(singleValue * newQty);
  }
};

const changeTotalCart = ($element, $total, incrementType) => {
  console.log(`${incrementType}`);
  if ( $element.length ){
    const oldValue = parseFloat($element.text().replace('$', ''));
    const singleValue = oldValue / oldQty;
    return(singleValue * newQty);
    // console.log(`this: ${oldValue}`);
  }
  // const partial =
  // accessory = (raining ? "umbrella" : "sunglasses")
};


export { initIncrementButtons };
