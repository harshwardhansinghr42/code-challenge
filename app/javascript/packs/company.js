function doSubmit(event){
	var company_email = document.getElementById('company_email').value;
 	if(company_email && !company_email.endsWith('@getmainstreet.com')){
		event.preventDefault();
		alert('Email should only be a @getmainstreet.com domain');
	}
}

document.addEventListener("turbolinks:load", () => {
	const form = document.getElementsByClassName('new_company')[0] ||
							 document.getElementsByClassName('edit_company')[0];
	if(form){
		form.addEventListener('submit', (event) => doSubmit(event))
	}
});