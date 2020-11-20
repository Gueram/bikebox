const roundAmount = (amount) => {
  return Math.round((amount + Number.EPSILON) * 10) / 10
}

const dynamicPrice = (startDate, endDate, totalBikesString) => {
  const totalDays = document.getElementById("total-days");
  const boxPricePerDay = document.getElementById("box-price-per-day").innerText;
  const totalPriceElement = document.getElementById("total-price");
  let dateDiffInMilliseconds = new Date(endDate.value) - new Date(startDate.value);
  let nbrOfDays = dateDiffInMilliseconds / 86400000;
  /* let boxPricePerDayReduced = boxPricePerDay.innerText - nbrOfDays / 10; */
  const totalBikesInt = parseInt(totalBikesString.value, 10);
  let totalBikes = isNaN(totalBikesInt) ? 1 : totalBikesInt
  if (startDate.value && endDate.value) {
    totalDays.innerText = nbrOfDays
    /* boxPricePerDay.innerText = roundAmount(boxPricePerDayReduced) */
    const totalPrice = nbrOfDays * boxPricePerDay * totalBikes
    totalPriceElement.innerText = roundAmount(totalPrice)
  }
};

const price = () => {
  const startDate = document.getElementById("range_start");
  const endDate = document.getElementById("range_end");
  const totalBikesString = document.getElementById("total-bikes");

  console.group();
  console.log(startDate);
  console.log(endDate);
  console.log(totalBikesString);
  console.groupEnd();

  if (startDate && endDate && totalBikesString) {
  [startDate, endDate].forEach(date => {
    date.addEventListener("change", (event) => {
      dynamicPrice(startDate, endDate, totalBikesString);
    });
  })
 
  totalBikesString.addEventListener("input", (event) => {
    dynamicPrice(startDate, endDate, totalBikesString);
  });
  }
};

export { price };
