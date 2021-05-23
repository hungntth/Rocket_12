$(function() {
    $(".header").load("header.html");
    $(".main").load("main.html");
    getListEmployees();
    buildtable();
});
function buildtable(){
       $.get("https://60a7c4318532520017ae4ee6.mockapi.io/Tesst", function (data,status) {

           departments = []
           if (status == "error") {

               alert("Error when loading data");

           }
           data.forEach(function(Tesst) {
                $("tbody").append(
                    '<tr>' +
                    '<td>' + Tesst.Department + '</td>' +
                    '<td>' + Tesst.NumberOfEmployee + '</td>' +
                    '<td>' +
                    '<a class="edit" title="Edit" data-toggle="tooltip" onclick="openUpdateModal(' + Tesst.id + ')"><i class="material-icons">&#xE254;</i></a>' +
                    '<a class="delete" title="Delete" data-toggle="tooltip" onClick="openConfirmDelete(' + Tesst.id + ')"><i class="material-icons">&#xE872;</i></a>' +
                    '</td>' +
                    '</tr>'
                )


           })

       } );

    }

function openAddModal(){
    clearForm();
    $("#createmodal").modal("show");
}
function closeAddModal(){
    $("#createmodal").modal("hide");

}


function save(){

    var Department = document.getElementById("Department").value;
    var NumberOfEmployee = document.getElementById("NumberOfEmployee").value;

    var employee = {
        Department: Department,
        NumberOfEmployee: NumberOfEmployee,

    };

    $.post("https://60a7c4318532520017ae4ee6.mockapi.io/Tesst", employee,
        function(data, status) {

            if (status == "error") {
                alert("Error when loading data");
                return;
            }

            closeAddModal();
            showSuccessAlert();
            location.reload();


        });
}

function showSuccessAlert() {
    $("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
        $("#success-alert").slideUp(500);
    });
}
function closeUpdateModal(){
    $("#updatemodal").modal("hide");
}
function showUpdateModal(){
    $("#updatemodal").modal("show");
}
var employees = [];
function Employee(id, department, numberOfEmployee) {
    this.id = id;
    this.department = department;
    this.numberOfEmployee = numberOfEmployee;
}
function getListEmployees() {

    $.get("https://60a7c4318532520017ae4ee6.mockapi.io/Tesst", function(data, status) {

        employees = [];


        if (status == "error") {

            alert("Error when loading data");
            return;
        }


        parseData(data);
    });
}
function parseData(data) {

    data.forEach(function(Tesst) {
        employees.push(new Employee(Tesst.id, Tesst.Department, Tesst.NumberOfEmployee));
    });
}
function openUpdateModal(id){
    var index = employees.findIndex(x => x.id == id);
    document.getElementById("id").value = employees[index].id;
    document.getElementById("uDepartment").value = employees[index].department;
    document.getElementById("uNumberOfEmployee").value = employees[index].numberOfEmployee;

    showUpdateModal();
}
function update(){
    var id = document.getElementById("id").value;
    var Department = document.getElementById("uDepartment").value;
    var NumberOfEmployee = document.getElementById("uNumberOfEmployee").value;
    var employee = {
        Department: Department,
        NumberOfEmployee: NumberOfEmployee,

    };
    $.ajax({
        url: 'https://60a7c4318532520017ae4ee6.mockapi.io/Tesst/' + id,
        type: 'PUT',
        data: employee,
        success: function(result) {

            if (result == undefined || result == null) {
                alert("Error when loading data");
                return;
            }
            closeUpdateModal();
            showSuccessAlert();
            location.reload();
        }
    });
}

function openConfirmDelete(id) {
    var index = employees.findIndex(x => x.id == id);
    var department = employees[index].department;

    var result = confirm("Bạn muốn xóa department: " + department + "?");
    if (result) {
        $.ajax({
            url: 'https://60a7c4318532520017ae4ee6.mockapi.io/Tesst/' + id,
            type: 'DELETE',
            success: function(result) {

                if (result == undefined || result == null) {
                    alert("Error when loading data");
                    return;
                }

                showSuccessAlert();
                location.reload();
            }
        });
    }
}
function clearForm(){
    document.getElementById("Department").value = "";
    document.getElementById("NumberOfEmployee").value = "";
}
