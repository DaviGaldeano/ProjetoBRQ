function swapImage() {
    var elem = document.getElementById("pic");
    if (elem.src.endsWith('closedGate.png') == true)  //Comparison
    {
        elem.src = "./assets/icons/houseIcons/openGate.png"; //assignment  
        const element = document.getElementById("id01");
        element.innerHTML = "<center>Fechar Portão</center>";
    }
    else if (elem.src.endsWith('openGate.png') == true) {
        elem.src = "./assets/icons/houseIcons/closedGate.png";
        const element = document.getElementById("id01");
        element.innerHTML = "<center>Abrir Portão</center>";
        
    }
}

