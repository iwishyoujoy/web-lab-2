function svgHandler(event) {
    const svg = document.querySelector('svg');
    const rect = svg.getBoundingClientRect();
    updateValidationPanel();
    let r = getRValue();
    if (validateRValue(r)) {
        let x = (((event.clientX - rect.left - 150)/50) * (r / 2)).toFixed(2);
        let y = (((event.clientY - rect.top)*(-1)+150)/50*(r/2)).toFixed(2);
        sendDataToServer(x, y, r);
    }
}
