window.onload = () => {
  let setConsentCheckbox = () => {
    let consentList = document.getElementsByClassName("consent");
    let numberOfConsentChecked = [...consentList].filter(checkbox => checkbox.checked);
    if(consentList.length === numberOfConsentChecked.length){
      document.getElementById("student_personal_consent").checked = true;
    }
    else{
      document.getElementById("student_personal_consent").checked = false;
    }
  }

  let studentParentalCheckbox = document.getElementById("student-parentalconsent");
  studentParentalCheckbox!==null?addEventListener("change", setConsentCheckbox):null;
  let studentConductCheckbox = document.getElementById("student-conductconsent");
  studentConductCheckbox!==null?addEventListener("change", setConsentCheckbox):null;
  let studentGeneralCheckbox = document.getElementById("student-generalconsent")
  studentGeneralCheckbox!==null?addEventListener("change", setConsentCheckbox):null;

  $("#studentCOCModal").on("click","#acceptStudentCOC", function(){
    $('#student-conductconsent').prop('checked', true);
  });
  
    $('#studentCOCLink[href$="#"]').on( "click", function() {
      $('#studentCOCModal').modal('show');
   });
   
   $("#tutorCOCModal").on("click","#acceptTutorCOC", function(){
    $('#tutor_code_of_conduct').prop('checked', true);
  });
  
    $('#tutorCOCLink[href$="#"]').on( "click", function() {
      $('#tutorCOCModal').modal('show');
   });
}