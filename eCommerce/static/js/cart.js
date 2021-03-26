var updateBtns= document.getElementsByClassName('update-cart')

for(var i = 0; i < updateBtns.length; i++){
    updateBtns[i].addEventListener('click', function(){
        var productName = this.dataset.product
        var action = this.dataset.action

        console.log("product:", productName, 'action: ', action)
    })
}