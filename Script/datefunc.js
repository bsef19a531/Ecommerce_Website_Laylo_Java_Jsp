
function orderStatusCalculator(date, id)
{
    console.log("in funct");
    let d1 = new Date(date).getDate();
    let d2 = new Date().getDate();
    console.log("dates assigned");
    if(d2-d1 > 3)
    {
        console.log("status del");
        document.getElementById(id).innerHTML = "Delivered";
    }
    else
    {
        console.log("status inProg");
        document.getElementById(id).innerHTML = "InProgress";
        console.log("status inProg END");
    }

}