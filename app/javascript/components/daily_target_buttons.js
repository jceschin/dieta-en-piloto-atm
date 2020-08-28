// daily_target_buttons.js

// console.log("Hello from daily_target_buttons.js");


// harcoded data, doesn't check how many elements are or the actual size
let elementsQty = 5;
let elementWidth = 195;
// *************************************************

const initDailyTargetButtons = () => {

  const btn_left = document.getElementById("nav-dt-btn-left");
  const btn_right = document.getElementById("nav-dt-btn-right");

  btn_left.addEventListener("click", (event) => {
    // Do something (callback)
    event.preventDefault();
    console.log("lefty lefty");
    moveTarget("left");
  });

  btn_right.addEventListener("click", (event) => {
    // Do something (callback)
    event.preventDefault();
    console.log("righty righty");
    moveTarget("right");
  });

  setInterval(moveTarget, 5000, "right");

};

const moveTarget = (direction) => {
  const dtDisplay = document.getElementById("daily-targets-display");
  initElementWidth();
  console.log(`width: ${elementWidth}`);
  console.log(elementPosition(dtDisplay));
  if ( direction == 'left') {
    if ( isFirstPosition(dtDisplay) ){
      console.log("left-first")
      changePosition(dtDisplay, ( elementsQty - 1 ) * elementWidth * -1);
    } else {
      console.log("left-any")
      changePosition(dtDisplay, elementWidth);
    }
  } else {
    if ( isLastPosition(dtDisplay) ){
      console.log("right-last")
      changePosition(dtDisplay, ( elementsQty - 1 ) * elementWidth);
    }else {
      console.log("right-any")
      changePosition(dtDisplay, elementWidth * -1);
    }
  }
  // console.log(elementPosition(dtDisplay));
};


const isLastPosition = (element) => {
  const position = elementPosition(element);
  return ( ( elementsQty - 1 ) * elementWidth * -1 == position );
}

const isFirstPosition = (element) => {
  const position = elementPosition(element);
  return ( 0 == position );
}

const changePosition = (element, increment) => {
  const position = elementPosition(element);
  const newPosition = position + increment;
  const incrementStr = `${newPosition}px`;
  element.style.left = incrementStr;
}

const elementPosition = (element) => {
  const style = getComputedStyle(element)
  const positionStr = style.left;
  const position = parseInt(positionStr.slice(0,positionStr.length - 2), 10);
  return position;
}

const initElementWidth = () => {
  const element = document.getElementById("daily-targets-wrapper")
  const style = getComputedStyle(element)
  const elementWidthStr = style.width;
  elementWidth = parseInt(elementWidthStr.slice(0,elementWidthStr.length - 2), 10);
}


// const changeTotalItem = ($element, oldQty, newQty) => {
//   console.log(`${oldQty} ${newQty}`);
//   if ( $element.length ){
//     const oldValue = parseFloat($element.text().replace('$', ''));
//     const singleValue = oldValue / oldQty;
//     return(singleValue * newQty);
//   }
// };

// const changeTotalCart = ($element, $total, incrementType) => {
//   console.log(`${incrementType}`);
//   if ( $element.length ){
//     const price = parseFloat($element.text().replace('$', ''));
//     const total = parseFloat($total.text().replace('$', ''));
//     return( (incrementType == "inc" ) ? total + price : total - price );
//   }
// };


export { initDailyTargetButtons };
