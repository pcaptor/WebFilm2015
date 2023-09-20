/// <reference path="jquery.jqGrid.js" />
$(function () {
    /* 'use strict'; ??? */
    FunctionArray = function (count) {
        var arr = [];
        for (var i = 0; i < count; i++) {
            arr[i] = function (i) { alert(i + 1) };
            /*
            arr.push(function(i) {
                alert(i);
            });
            */

        }
        return arr;
    };

    checkName = function (value, colname) {
        /*
        var i = 5;
        var arr = FunctionArray(i);

        arr[0](0);
        
        r argsContainer = ['hello', 'you', 'there'];
        var functionsContainer = [];

        for (var i = 0; i < argsContainer.length; i++) {
        var currentArg = argsContainer[i]; 

          functionsContainer.push(function(currentArg){
            console.log(currentArg);
          });
        };

        for (var i = 0; i < functionsContainer.length; i++) {
          functionsContainer[i](argsContainer[i]);
        }
        */

        if (value !== undefined && value !== "") {
            return [true];
        } else {
            // error
            return [false, 'Заполните поле "' + colname + '"!'];
        }
    };
    $("#jqGrid").jqGrid({
        url: "/Film/GetFilms",
        datatype: 'json',
        mtype: 'Get',
        colNames: ['ID', 'Название', 'Название (анг.)', 'Жанр', '', 'Страна', 'Год', 'Сезон', 'Серия', 'Описание', 'Дата'],
        colModel: [
        { key: true, name: 'film_id', index: 'film_id', hidden: true, width: 30, align: 'center', editable: true },
        { key: false, name: 'fname', index: 'fname', width: 300, editable: true, editrules: { custom: true, custom_func: checkName } },
        { key: false, name: 'fname_eng', index: 'fname_eng', width: 300, editable: true, editrules: { custom: true, custom_func: checkName } },
        { key: false, name: 'tname', index: 'tname', width: 120, align: 'left', editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/TypeSelectList" } },
        /*  { key: false, name: 'type_id', index: 'type_id', width: 120, editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/TypeSelectList" } },
        { key: false, name: 'country_id', index: 'country_id', width: 80, editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/CountrySelectList" } }, */
        {
            key: false,
            name: 'flag',
            index: 'flag',
            width: 20,
            editable: false,
            edittype: 'image',
            editoptions: { src: '' },
            formatter: function (cell, options) {
                // debugger;
                var code = arguments[2].code;
                return '<img src="/Uploads/' + code + '.jpg"/>';
            }
        },
        { key: false, name: 'cname', index: 'cname', align: 'left', width: 80, editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/CountrySelectList" } },
        { key: false, name: 'year', index: 'year', width: 36, align: 'center', editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/YearSelectList" } },
        /* { key: false, name: 'season_id', index: 'season_id', width: 80, editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/SeasonSelectList" }, editrules: { required: true, edithidden: false } }, */
        { key: false, name: 'sname', index: 'sname', width: 60, editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/SeasonSelectList" }, editrules: { required: true } },
        { key: false, name: 'ename', index: 'ename', width: 60, editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/EpisodeSelectList" }, editrules: { required: true } },
        /* { key: false, name: 'episode_id', index: 'episode_id', align: 'left', width: 80, editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/EpisodeSelectList" }, editrules: { required: true } },
        { key: false, name: 'episode_id', index: 'episode_id', align: 'left', editable: true, edittype: 'select', editoptions: { dataUrl: "/Film/EpisodeList" }, editrules: { required: true } },  */
        { key: false, name: 'description', index: 'description', hidden: true, editable: true, edittype: 'textarea', editoptions: { rows: "6", cols: "46" } },
        { key: false, name: 'hdate', index: 'hdate', width: 90, align: 'center', editable: false, sorttype: 'date', formatter: 'date', formatoptions: { srcformat: 'U', newformat: 'd-M-Y' }, datefmt: 'd-M-Y' }],
        /*
        onSelectRow: function(id) {
            jQuery('#jqGrid').editRow(id, true);
        },
        */
        subGrid: true,
        subGridOptions: {
            plusicon: "ui-icon-plus",
            minusicon: "ui-icon-minus",
            openicon: "ui-icon-carat-1-sw",
            expandOnLoad: false,
            selectOnExpand: false,
            reloadOnExpand: true
        },
        subGridRowExpanded: function (subgrid_id, row_id) {
            var subgrid_table_id;
            subgrid_table_id = subgrid_id + '_t';
            $('#' + subgrid_id).html('<table id="' + subgrid_table_id + '"></table><div id="' + subgrid_table_id + '_pager"></div>');
            $('#' + subgrid_table_id).jqGrid({
                url: "/Film/GetDescription",
                datatype: 'json',
                mtype: 'POST',
                postData: { film_id: row_id },
                colNames: ['ID', 'Описание'],
                colModel: [
                    { key: true, name: 'film_id', hidden: true, index: 'film_id', width: 30, align: 'center', editable: true },
                    { key: false, name: 'description', index: 'description', width: 500, align: 'left', editable: false },
                ],
                /*
                ondblClickRow: function (id) {
                    jQuery('#' + subgrid_table_id).editRow(id, true);
                },
                editurl: "/Film/EditDescription",
                */
                height: 'auto',
                autowidth: true,
                viewrecords: true,
                /* Если нет jsonReader записи не возвращаются  */
                jsonReader: {
                    root: "rows",
                    page: "page",
                    total: "total",
                    records: "records",
                    repeatitems: false,
                    Id: "0"
                },
                multiselect: false
                /* ondblClickRow: function (id) { gridEditChar(id); },
                sortname: 'id',
                sortorder: 'asc'  */
                /* onSelectRow: function (id) {
                    selectRow = id;
                }
                */
            });
        },
        onSelectRow: function (ids) {
            console.log("onSelectRow START");
            console.log("ids = " + ids);

            if (ids === null) {
                ids = 0;
                if (jQuery("#jqGridDetails").jqGrid('getGridParam', 'records') > 0) {
                    /* jQuery("#jqGridDetails").jqGrid('setGridParam', { url: "/Request/Detail/id=" + ids, page: 1 }); */
                    jQuery("#jqGridDetails").jqGrid('setCaption', "Сериал: " + ids);
                    // jQuery("#jqGridDetails").jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid');
                }
            } else {
                var fname = $("#jqGrid").getCell(ids, "fname");
                jQuery("#jqGridDetails").jqGrid('setCaption', "Сериал: " + fname);
                // jQuery("#jqGridDetails").jqGrid('setGridParam', { url: "/Film/GetDetail?Id=" + ids, page: 1 }).trigger("reloadGrid");

                var postDataValues = $("#jqGrid").jqGrid('getGridParam', 'postData');
                postDataValues['filmId'] = ids;

                console.log("postDataValues = " + postDataValues);
                // clearSelection(); // ???

                $('#jqGridDetails').jqGrid().setGridParam({ postData: postDataValues, page: 1 }).trigger('reloadGrid');
            }
            console.log("onSelectRow END");
        },
        onSortCol: clearSelection,
        onPaging: clearSelection,
        pager: jQuery('#jqControls'),
        rowNum: 10,
        rowList: [10, 20, 30, 40, 50],
        /* height: 'auto', */
        height: '100%',
        viewrecords: true,
        caption: 'Список',
        emptyrecords: 'No Films Records are Available to Display',
        jsonReader: {
            root: "rows",
            page: "page",
            total: "total",
            records: "records",
            repeatitems: false,
            Id: "0"
        },
        // 
        autowidth: true,
        // width: 1600,
        multiselect: false,
    }).navGrid('#jqControls', {
        edit: true, add: true, del: true, search: true,
        searchtext: "Поиск фильма", refresh: true
    },
        {
            zIndex: 100,
            url: '/Film/Edit',
            closeOnEscape: true,
            closeAfterEdit: true,
            recreateForm: true, width: 420,
            beforeShowForm: function (form) {
                // var nameColumnField = $('#tr_film_id', form).show();
                var nameColumnField = $('#tr_description', form).show();
                // $('<tr class="FormData" id="tr_AddInfo"><td class="CaptionTD ui-widget-content"><b>Additional Information:</b></td></tr>').insertAfter(nameColumnField);
            },
            afterComplete: function (response) {
                if (response.responseText) {
                    /* alert(response.responseText); */
                    swal(response.responseText);
                }
            }
        },
        {
            zIndex: 100,
            url: "/Film/Create",
            closeOnEscape: true,
            closeAfterAdd: true,
            recreateForm: true, width: 420,
            /*
            beforeShowForm: function(form) {
                $('#tr_film_id', form).hide();
            },
            */
            beforeShowForm: function (form) {
                var nameColumnField = $('#tr_description', form).show();
            },
            /* 
            afterShowForm: function (form) {
               $('#tr_year').val('2016');
               $('#tr_year', form).val('2016');
            },
             */
            afterComplete: function (response) {
                if (response.responseText) {
                    /* alert(response.responseText); */
                    swal(response.responseText);
                }
            }
        },
        {
            zIndex: 100,
            url: "/Film/Delete",
            closeOnEscape: true,
            closeAfterDelete: true,
            recreateForm: true,
            msg: "Вы уверены что хотите удалить фильм... ? ",
            afterComplete: function (response) {
                if (response.responseText) {
                    swal(response.responseText);
                    /* alert(response.responseText); */
                }
            }
        },
        {
            zIndex: 100,
            caption: "Поиск фильмов",
            sopt: ['cn']
        });

    // detail grid
    $("#jqGridDetails").jqGrid({
        url: "/Film/GetDetail",
        datatype: 'json',
        // mtype: 'Get',
        mtype: 'Post',
        colNames: ['ID', 'Сезон', 'Серия', 'Дата просмотра'],
        colModel: [
        { key: true, name: 'History_id', index: 'History_id', hidden: false, width: 100, align: 'right', editable: false },
        { key: true, name: 'Sname', index: 'Sname', hidden: false, width: 100, align: 'left', editable: false },
        { key: true, name: 'Ename', index: 'Ename', hidden: false, width: 100, align: 'left', editable: false },
        { key: true, name: 'Hdate', index: 'Hdate', hidden: false, width: 100, align: 'right', align: 'center', formatter: 'date', formatoptions: { srcformat: "m/d/Y h:i:s A", newformat: "Y-m-d h:i:s" }, editable: false }],
        // page: 1,
        width: 780,
        rowNum: 5,
        emptyrecords: 'No Records are Available to Display',
        // jsonReader необходим для показа записей 
        jsonReader: {
            root: "rows",
            page: "page",
            total: "total",
            records: "records",
            repeatitems: false,
            Id: "0"
        },
        height: '100',
        viewrecords: true,
        caption: 'Сериал:',
        pager: "#jqGridDetailsPager"
    });

    function clearSelection() {
        var myGrid = $("#jqGridDetails");
        myGrid.jqGrid('setCaption', "Сериал:");
        var gridBody = myGrid.children("tbody");
        gridBody.empty();
    }
});


