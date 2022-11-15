function addToCart(pName, pPrice, pQuantity)
{

	let cart = localStorage.getItem("cart");
	if(cart == null)
	{

		let products = [];
		let product = {productName: pName, productPrice: pPrice, productQuantity: 1 };
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));

		//console.log("New Product Added to Cart");
		snackBar("New Product Added to Cart");
	}
	else
	{
		pcart = JSON.parse(cart);
		
		let existProduct = pcart.find((item)=> item.productName === pName);
		
		if(existProduct)
		{
			if(pQuantity > existProduct.productQuantity){
			existProduct.productQuantity = existProduct.productQuantity + 1;
			pcart.map((item)=>{
				if(item.productName === existProduct.productName)
				{
					item.productQuantity = existProduct.productQuantity;
					//console.log("Product Quantity Increased");
					snackBar("Product Quantity Increased ("+item.productQuantity+")");
				}
			})
			
			localStorage.setItem("cart",JSON.stringify(pcart));}
			else
			{
				//console.log("In start else max");
				snackBar("Maximum Quantity Reached");
				//alert("Maximum Quantity reached");
				console.log("In end else max");
				
			}
			
		}
		else
		{
			let product = {productName: pName, productPrice: pPrice, productQuantity: 1 };
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			//console.log("Another New Product Added");
			snackBar("Another New Product Added");
		}
	}
}


function updateCart()
{
	let cart = JSON.parse(localStorage.getItem("cart"));
	
	if(cart == null || cart.length  == 0)
	{
		document.getElementById('cart-number').innerHTML = '0';
		document.getElementById('md-body').innerHTML = "Cart is Empty...";
		document.getElementById("check-btn").classList.add("disabled_button");
	}
	else
	{
		document.getElementById("check-btn").classList.remove("disabled_button")
		let size = cart.length;
		document.getElementById('cart-number').innerHTML = size;
		
		let table = `
			<table class="table">
				<thead id="table-head">
					<tr>
						<th>Item Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
						<th>Action</th>
					</tr>
				</thead>
			
		`;
		totalBill = 0;
		cart.map((item)=>{

		table += `<tr>
				<td>`+item.productName+`</td>
				<td>`+item.productPrice+`</td>
				<td>`+item.productQuantity+`</td>
				<td>`+item.productPrice*item.productQuantity+`</td>
				<td><button class="btn btn-danger btn-sm" onclick="deleteFromCart('`+item.productName+`')">Remove</button></td>
			</tr>`;
			totalBill+= item.productPrice*item.productQuantity;
		})
		
		table = table + `
		<tr>
			<td colspan='3' style="text-align: right;"><b>Final Total</b></td>
			<td><b>`+totalBill+`</b></td>
		</tr>
		</table>`;
		document.getElementById('md-body').innerHTML = table;
	}
}

function deleteFromCart(pName)
{
	let cart = JSON.parse(localStorage.getItem("cart"));
	let newCart = cart.filter((item)=> !(item.productName === pName));
	localStorage.setItem("cart",JSON.stringify(newCart));
	// if(localStorage.getItem("cart").length == 0)
	// {
	// 	localStorage.clear();
	// 	console.log("in clear");
	// }
	updateCart();
	snackBar("Item "+ pName +" removed from the cart");
}

function snackBar(msg)
{
	//console.log("In Snackbar");
	let x = document.getElementById("snackbar");
	x.innerHTML = msg;
	x.className = "show";
	setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	//console.log("In Snackbar End");
}

function goToCheckOut()
{
	console.log("checkout");
	//implemented in cart Modal
}

function pageCart()
{
	let cart = JSON.parse(localStorage.getItem("cart"));
	if(cart == null || cart.length  == 0)
	{
		document.getElementById('cart-number').innerHTML = '0';
		document.getElementById('cart-body').innerHTML = "Cart is Empty...";
		//document.getElementById("check-btn").classList.add("disabled_button");
	}
	else
	{
		//document.getElementById("check-btn").classList.remove("disabled_button")
		//let size = cart.length;
		//document.getElementById('cart-number').innerHTML = size;

		let table = `
			<table class="table">
				<thead id="table-head">
					<tr>
						<th>Item Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
				</thead>
			
		`;
		totalBill = 0;
		cart.map((item)=>{

		table += `<tr>
				<td class="table-content">`+item.productName+`</td>
				<input type="hidden" value="`+item.productName+`" name="table"> 
				<td class="table-content">`+item.productPrice+`</td>
				<input type="hidden" value="`+item.productPrice+`" name="table">
				<td class="table-content">`+item.productQuantity+`</td>
				<input type="hidden" value="`+item.productQuantity+`" name="table">
				<td class="table-content">`+item.productPrice*item.productQuantity+`</td>
			</tr>`;
			totalBill+= item.productPrice*item.productQuantity;
		})
		
		table = table + `
		<tr>
			<td colspan='3' style="text-align: right;" class="table-content-final"><b>Final Total (Rs)</b></td>
			<td class="table-content-final"><b>`+totalBill+`</b></td>
			<input type="hidden" value="" name="date" id="h-date">
			<input type="hidden" value = "" name="name" id="h-name">
			<input type="hidden" value = "" name="address" id="h-address">
		</tr>
		</table>`;
		document.getElementById('cart-body').innerHTML = table;
	}
}

function clearCart()
{
	localStorage.clear();
	updateCart();
}
