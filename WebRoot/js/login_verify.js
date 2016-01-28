function login_verify()
{
	var input_name=document.getElementById("input_name");
	var input_password=document.getElementById("input_password");
	var input_identifyCode=document.getElementById("input_identifyCode");
	var tip_name_null=document.getElementById("tip_name_null");
	var tip_password_null=document.getElementById("tip_password_null");
	var tip_name_length=document.getElementById("tip_name_length");
	var tip_password_length=document.getElementById("tip_password_length");
	var tip_identifyCode_null=document.getElementById("tip_identifyCode_null");
	var tip_wrong=document.getElementById("tip_wrong");
	if(input_name.value=="")
	{
		tip_name_null.style.display="block";
		tip_name_length.style.display="none";
		tip_password_null.style.display="none";
		tip_password_length.style.display="none";
		tip_identifyCode_null.style.display="none";
		tip_wrong.style.display="none";
		return false;
	}
	else
	{
		if(input_name.value.length>30||input_name.value.length<2)
		{
			tip_name_null.style.display="none";
			tip_name_length.style.display="block";
			tip_password_null.style.display="none";
			tip_password_length.style.display="none";
			tip_identifyCode_null.style.display="none";
			tip_wrong.style.display="none";
			return false;
		}
		else
		{
			if(input_password.value=="")
			{
				tip_name_null.style.display="none";
				tip_name_length.style.display="none";
				tip_password_null.style.display="block";
				tip_password_length.style.display="none";
				tip_identifyCode_null.style.display="none";
				tip_wrong.style.display="none";
				return false;
			}
			else
			{
				if(input_password.value.length<6||input_password.value.length>30)
				{
					tip_name_null.style.display="none";
					tip_name_length.style.display="none";
					tip_password_null.style.display="none";
					tip_password_length.style.display="block";
					tip_identifyCode_null.style.display="none";
					tip_wrong.style.display="none";
					return false;
				}
				else
				{
					if(input_identifyCode.value=="")
					{
						tip_name_null.style.display="none";
						tip_name_length.style.display="none";
						tip_password_null.style.display="none";
						tip_password_length.style.display="none";
						tip_identifyCode_null.style.display="block";
						tip_wrong.style.display="none";
						return false;
					}
					else
					{
						tip_name_null.style.display="none";
						tip_name_length.style.display="none";
						tip_password_null.style.display="none";
						tip_password_length.style.display="none";
						tip_identifyCode_null.style.display="none";
						return true;
					}
				}
			}
		}
	}
}