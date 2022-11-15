
function changeHiddenValue()
{
    
    let add = document.getElementById("address_field").value;
    let n = document.getElementById("name_field").value;
    console.log(n);
    console.log(add);
    document.getElementById("h-name").value = n;
    document.getElementById("h-address").value = add;
    document.getElementById("h-date").value = new Date();
    
}


function submitForms()
{
    changeHiddenValue();
    document.getElementById("bill-form").submit();
    //document.getElementById("customer-form").submit();
}


function getDate()
{
    return new Date();
}