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
  parentalconsentCheckbox!==null?addEventListener("change", setConsentCheckbox):null;
  let conductconsentCheckbox = document.getElementById("conductconsent");
  conductconsentCheckbox!==null?addEventListener("change", setConsentCheckbox):null;
  let generalconsentCheckbox = document.getElementById("generalconsent")
  generalconsentCheckbox!==null?addEventListener("change", setConsentCheckbox):null;

  console.log("Helllo")