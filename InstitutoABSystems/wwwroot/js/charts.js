window.initCharts = (presentados, cancelados, inscritos) => {
    // Pie Chart
    var ctxPie = document.getElementById('pieChart').getContext('2d');
    new Chart(ctxPie, {
        type: 'pie',
        data: {
            labels: ['Presentados', 'Cancelados'],
            datasets: [{
                data: [presentados, cancelados],
                backgroundColor: ['#006D77', '#FF2E88']
            }]
        }
    });

    // Bar Chart
    var ctxBar = document.getElementById('barChart').getContext('2d');
    new Chart(ctxBar, {
        type: 'bar',
        data: {
            labels: ['Exámenes Inscritos'],
            datasets: [{
                label: 'Cantidad',
                data: [inscritos],
                backgroundColor: ['#00968F']
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true }
            }
        }
    });
};

