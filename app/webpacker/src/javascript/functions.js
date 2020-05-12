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

  let parentalconsentCheckbox = document.getElementById("parentalconsent");
  parentalconsentCheckbox.addEventListener("change", setConsentCheckbox);
  let conductconsentCheckbox = document.getElementById("conductconsent");
  conductconsentCheckbox.addEventListener("change", setConsentCheckbox);
  let generalconsentCheckbox = document.getElementById("generalconsent")
  generalconsentCheckbox.addEventListener("change", setConsentCheckbox);