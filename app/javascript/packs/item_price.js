function tax() {
   const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
       const inputValue = priceInput.value;
       const addTaxDom = document.getElementById("add-tax-price");
       const taxPrice = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = taxPrice
       const addprofitDom = document.getElementById("profit");
    addprofitDom.innerHTML = inputValue - taxPrice
   });


};




window.addEventListener('load',tax);

