$(function () {
    // 
    debugger;

    // This will make every element with the class "date-picker" into a DatePicker element
    $('.date-picker').datepicker({
        onSelect: function (date, datepicker) {
            var beginDate = $('#BeginDate').val();
            var endDate = $('#EndDate').val();

            /*
            var startDate = $('#BeginDate').datepicker("getDate");
            var endDate2 = $('#EndDate').datepicker("getDate");
            */

            var newHref = '/Report/DownloadReport?beginDate=';
            newHref += beginDate.substr(0, 2) + '%2F' + beginDate.substr(3, 2) + '%2F' + beginDate.substr(6, 4);
            newHref += '%2000%3A00%3A00&endDate=';
            newHref += endDate.substr(0, 2) + '%2F' + endDate.substr(3, 2) + '%2F' + endDate.substr(6, 4);
            newHref += '%2000%3A00%3A00';

            var var2 = $('#download').attr('href');
            $('#download').attr('href', newHref);
            var var3 = $('#download').attr('href');
            // debugger;
        }
    });

    $('.date-picker').datepicker({ dateFormat: 'dd/mm/yy' });
    $('.date-picker').get(0).setAttribute("type", "text");

    /*
    $.datepicker.regional['ru'] = {
        closeText: 'Закрыть',
        prevText: 'Пред',
        nextText: 'След',
        currentText: 'Сегодня',
        monthNames: [
            'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
            'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'
        ],
        monthNamesShort: [
            'Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн',
            'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'
        ],
        dayNames: ['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
        dayNamesShort: ['вск', 'пнд', 'втр', 'срд', 'чтв', 'птн', 'сбт'],
        dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
        weekHeader: 'Не',
        dateFormat: 'dd.mm.yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['ru']);
    */

    $('#submit').click(function (e) {
        e.preventDefault();
        $("#dataTable").empty();
        var beginDate = $('#BeginDate').val();
        var endDate = $('#EndDate').val();
        var sendData = 'beginDate=' + beginDate + '&' + 'endDate=' + endDate;

        $.ajax({
            data: sendData,
            // 
            url: 'Report/LoadReport',
            // url: 'LoadReport',
            type: "GET",
            dataType: "json",
            contentType: 'application/json; charset=utf-8',
            async: true,
            processData: false,
            cache: false,
            columnSorting: true,
            success: OnSuccess,
            error: function (xhr, status) {
                alert("An error occurred: " + status);
                console.log(xhr.responseText);
            }
        });
    });

    $.ajax({
        // 
        url: 'Report/LoadTable',
        // url: 'LoadTable',
        type: "GET",
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        async: true,
        processData: false,
        cache: false,
        columnSorting: true,
        success: OnSuccess,
        error: function (xhr, status) {
            alert("An error occurred: " + status);
            console.log(xhr.responseText);
        }
    });
});

function OnSuccess(res) {
    // debugger;
    debugger;

    var Data = [];

    var header = [];
    header[0] = 'Id';
    header[1] = 'Название';
    header[2] = 'Жанр';
    header[3] = 'Сезон';
    header[4] = 'Серия';
    header[5] = 'Дата просмотра';
    Data.push(header);

    var records = JSON.parse(res);

    for (var i = 0; i < records.length; i++) {
        var report = [];
        report[0] = records[i].HistoryId;
        report[1] = records[i].Fname;
        report[2] = records[i].Tname;
        report[3] = records[i].Sname;
        report[4] = records[i].Ename;
        report[5] = records[i].Hdate;

        Data.push(report);
    }

    var container2 = document.getElementById('dataTable'), hot2;

    hot2 = new Handsontable(container2, {
        /*
        startRows: 8,
        startCols: 6,
        rowHeaders: true,
        colHeaders: true,
        */
        data: Data,
        cells: function (row, col, prop) {
            var cellProperties = {};

            if (row === 0) {
                cellProperties.renderer = firstRowRenderer; // uses function directly
            }

            cellProperties.readOnly = true;

            return cellProperties;
        }
        // , licenseKey: 'non-commercial-and-evaluation'
    });
}

function firstRowRenderer(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.renderers.TextRenderer.apply(this, arguments);
    td.style.fontWeight = 'bold';
    td.style.color = 'green';
    // td.style.color = 'blue';
    td.style.background = '#CEC';
}
